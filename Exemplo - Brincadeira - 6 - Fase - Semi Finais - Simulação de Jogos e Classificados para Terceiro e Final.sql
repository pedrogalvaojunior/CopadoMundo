-- Acessando --
Use Qatar2022
Go

-- Criando os 2 Jogos da Fase de Semi Final --
Declare @CodigoSemiFinal1 TinyInt, @CodigoSemiFinal2 TinyInt, @CodigoSelecao1 TinyInt, @CodigoSelecao2 TinyInt

Set @CodigoSemiFinal1 = 1
Set @CodigoSemiFinal2 = 2

Set @CodigoSelecao1 = 1
Set @CodigoSelecao2 = 1

While @CodigoSemiFinal1 <=3
 Begin
 
  Set @CodigoSelecao1 = (Select CodigoSelecaoSorteio From ClassificadosSemiFinais Where CodigoSemiFinais = @CodigoSemiFinal1)
  Set @CodigoSelecao2 = (Select CodigoSelecaoSorteio From ClassificadosSemiFinais Where CodigoSemiFinais = @CodigoSemiFinal2)
  
  Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
  Values (1,@CodigoSelecao1,@CodigoSelecao2, 1, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)
  
  Set @CodigoSemiFinal1 = @CodigoSemiFinal1 + 2
  Set @CodigoSemiFinal2 = @CodigoSemiFinal2 + 2

End
Go

-- Consultando os Jogos da Fase Semi Final --
Select Concat('Jogo nº ',J.CodigoJogo,' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Semi Final'
From Jogos J Inner Join Grupos G
                      On J.CodigoGrupoSorteio = G.CodigoGrupo
                     Inner Join Selecoes S1
                      On J.CodigoSelecao1 = S1.CodigoSelecao
                     Inner Join Selecoes S2
                      On J.CodigoSelecao2 = S2.CodigoSelecao
Where J.CodigoJogo Between 61 And 62
Order By J.CodigoJogo
Go

-- Eliminando a ocorrência de possíveis empates nos Jogos de Semi Final --
If (Select Count(CodigoJogo) From Jogos Where CodigoJogo Between 61 And 62 And GolsSelecao1 = GolsSelecao2) >=1
Begin

 Select 'Ocorreu empate(s) no(s) seguinte(s) jogos' As 'Semi Final',' ' As 'Placar'
 Union All
 Select Concat('Jogo nº ',J.CodigoJogo,' - ', 'Grupo ',G.SiglaGrupo, ' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Semi Final',
            Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar
 From Jogos J Inner Join Grupos G
                       On J.CodigoGrupoSorteio = G.CodigoGrupo
                      Inner Join Selecoes S1
                       On J.CodigoSelecao1 = S1.CodigoSelecao
                      Inner Join Selecoes S2
                       On J.CodigoSelecao2 = S2.CodigoSelecao
 Where J.CodigoJogo In (Select CodigoJogo From Jogos Where CodigoJogo Between 61 And 62 And GolsSelecao1 = GolsSelecao2)

 Select 'Prorrogação ou Penaltys foram realizados....' As 'Semi Final'
 
  Declare @GolsSelecao1 TinyInt, @GolsSelecao2 TinyInt

  Set @GolsSelecao1 = 1
  Set @GolsSelecao2 = 1

  While @GolsSelecao1 = @GolsSelecao2
  Begin
  
   Set @GolsSelecao1 = Rand()*Rand()*8
   Set @GolsSelecao2 = Rand()*Rand()*8

   If @GolsSelecao1 <> @GolsSelecao2
    Begin
     Update Jogos
     Set GolsSelecao1 = @GolsSelecao1,
           GolsSelecao2 = @GolsSelecao2
     From Jogos
     Where CodigoJogo In (Select CodigoJogo From Jogos Where CodigoJogo Between 61 And 62 And GolsSelecao1 = GolsSelecao2)
 
     Break
    End
  End
End
Go

-- Consultando os Jogos da Fase Semi Final - Resultados e Vencedores --
Select Concat('Jogo nº ',J.CodigoJogo,' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Semi Final',
           Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar,
		   Case 
		    When J.GolsSelecao1 > J.GolsSelecao2 Then S1.NomeSelecao
		    Else
			 S2.NomeSelecao
           End As 'Disputa Final',
		   Case 
		    When J.GolsSelecao1 > J.GolsSelecao2 Then S2.NomeSelecao
		   Else 
			S1.NomeSelecao
           End As 'Disputa Terceiro Lugar'
From Jogos J Inner Join Grupos G
                      On J.CodigoGrupoSorteio = G.CodigoGrupo
                     Inner Join Selecoes S1
                      On J.CodigoSelecao1 = S1.CodigoSelecao
                     Inner Join Selecoes S2
                      On J.CodigoSelecao2 = S2.CodigoSelecao
Where J.CodigoJogo Between 61 And 62
Order By J.CodigoJogo
Go

-- Criando a Tabela ClassificadosTerceiroLugar --
Create Table ClassificadosTerceiroLugar
 (CodigoTerceiroLugar TinyInt Identity(1,1) Primary Key Clustered,
  CodigoGrupoSorteio TinyInt Not Null,
  CodigoSelecaoSorteio TinyInt Not Null)
 Go

-- Criando a Tabela ClassificadosFinal --
Create Table ClassificadosFinal
 (CodigoFinal TinyInt Identity(1,1) Primary Key Clustered,
  CodigoGrupoSorteio TinyInt Not Null,
  CodigoSelecaoSorteio TinyInt Not Null)
 Go

-- Inserindo as Seleções definidas para disputar o Terceiro Lugar --
Insert Into ClassificadosTerceiroLugar
Select G.CodigoGrupo, 
           Case 
		    When J.GolsSelecao1 > J.GolsSelecao2 Then S2.CodigoSelecao
		    When J.GolsSelecao2 > J.GolsSelecao1 Then S1.CodigoSelecao
           End As CodigoSelecaoSorteio
From Jogos J Inner Join Grupos G
                      On J.CodigoGrupoSorteio = G.CodigoGrupo
                     Inner Join Selecoes S1
                      On J.CodigoSelecao1 = S1.CodigoSelecao
                     Inner Join Selecoes S2
                      On J.CodigoSelecao2 = S2.CodigoSelecao
Where J.CodigoJogo Between 61 And 62
Order By J.CodigoJogo
Go
 
-- Inserindo as Seleções Classificadas para Final --
Insert Into ClassificadosFinal
Select G.CodigoGrupo, 
           Case 
		    When J.GolsSelecao1 > J.GolsSelecao2 Then S1.CodigoSelecao
		    When J.GolsSelecao2 > J.GolsSelecao1 Then S2.CodigoSelecao
           End As CodigoSelecaoSorteio
From Jogos J Inner Join Grupos G
                      On J.CodigoGrupoSorteio = G.CodigoGrupo
                     Inner Join Selecoes S1
                      On J.CodigoSelecao1 = S1.CodigoSelecao
                     Inner Join Selecoes S2
                      On J.CodigoSelecao2 = S2.CodigoSelecao
Where J.CodigoJogo Between 61 And 62
Order By J.CodigoJogo
Go

-- Consultando --
Select 'Terceiro e Quarto' As Fase, 
          (Select S.NomeSelecao As 'Seleção' 
		   From ClassificadosTerceiroLugar Q Inner Join Selecoes S On Q.CodigoSelecaoSorteio = S.CodigoSelecao
           Where CodigoTerceiroLugar = 1) + ' x '+
          (Select S.NomeSelecao As 'Seleção' 
		   From ClassificadosTerceiroLugar Q Inner Join Selecoes S On Q.CodigoSelecaoSorteio = S.CodigoSelecao
           Where CodigoTerceiroLugar = 2) As 'Seleções'
Go

Select 'Final' As Fase, 
          (Select S.NomeSelecao As 'Seleção' 
		   From ClassificadosFinal Q Inner Join Selecoes S On Q.CodigoSelecaoSorteio = S.CodigoSelecao
           Where CodigoFinal = 1) + ' x '+
          (Select S.NomeSelecao As 'Seleção' 
		   From ClassificadosFinal Q Inner Join Selecoes S On Q.CodigoSelecaoSorteio = S.CodigoSelecao
           Where CodigoFinal = 2) As 'Seleções'
Go