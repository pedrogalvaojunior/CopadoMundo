-- Acessando --
Use Qatar2022
Go

-- Criando os 4 Jogos da Fase de Quartas de Final --
Declare @CodigoQuartasDeFinal1 TinyInt, @CodigoQuartasDeFinal2 TinyInt, @CodigoSelecao1 TinyInt, @CodigoSelecao2 TinyInt

Set @CodigoQuartasDeFinal1 = 1
Set @CodigoQuartasDeFinal2 = 2

Set @CodigoSelecao1 = 1
Set @CodigoSelecao2 = 1

While @CodigoQuartasDeFinal1 <=7
 Begin
 
  Set @CodigoSelecao1 = (Select CodigoSelecaoSorteio From ClassificadosQuartasDeFinal Where CodigoQuartasDeFinal = @CodigoQuartasDeFinal1)
  Set @CodigoSelecao2 = (Select CodigoSelecaoSorteio From ClassificadosQuartasDeFinal Where CodigoQuartasDeFinal = @CodigoQuartasDeFinal2)
  
  Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
  Values (1,@CodigoSelecao1,@CodigoSelecao2, 1, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)
  
  Set @CodigoQuartasDeFinal1 = @CodigoQuartasDeFinal1 + 2
  Set @CodigoQuartasDeFinal2 = @CodigoQuartasDeFinal2 + 2

End
Go

-- Consultando os Jogos da Fase Quartas de Final --
Select Concat('Jogo nº ',J.CodigoJogo,' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Quartas de Final'
From Jogos J Inner Join Grupos G
                      On J.CodigoGrupoSorteio = G.CodigoGrupo
                     Inner Join Selecoes S1
                      On J.CodigoSelecao1 = S1.CodigoSelecao
                     Inner Join Selecoes S2
                      On J.CodigoSelecao2 = S2.CodigoSelecao
Where J.CodigoJogo Between 57 And 60
Order By J.CodigoJogo
Go

-- Eliminando a ocorrência de possíveis empates nos Jogos de Quartas de Final --
If (Select Count(CodigoJogo) From Jogos Where CodigoJogo Between 57 And 60 And GolsSelecao1 = GolsSelecao2) >=1
Begin

 Select 'Ocorreu empate(s) no(s) seguinte(s) jogos' As 'Quartas de Final',' ' As 'Placar'
 Union All
 Select Concat('Jogo nº ',J.CodigoJogo,' - ', 'Grupo ',G.SiglaGrupo, ' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Quartas de Final',
            Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar
 From Jogos J Inner Join Grupos G
                       On J.CodigoGrupoSorteio = G.CodigoGrupo
                      Inner Join Selecoes S1
                       On J.CodigoSelecao1 = S1.CodigoSelecao
                      Inner Join Selecoes S2
                       On J.CodigoSelecao2 = S2.CodigoSelecao
 Where J.CodigoJogo In (Select CodigoJogo From Jogos Where CodigoJogo Between 57 And 60 And GolsSelecao1 = GolsSelecao2)

 Select 'Prorrogação ou Penaltys foram realizados....' As 'Quartas de Final'

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
     Where CodigoJogo In (Select CodigoJogo From Jogos Where CodigoJogo Between 57 And 60 And GolsSelecao1 = GolsSelecao2)
 
     Break
    End
  End
End
Go

-- Consultando os Jogos da Fase Quartas de Final - Resultados e Vencedores --
Select Concat('Jogo nº ',J.CodigoJogo,' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Quartas de Final',
           Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar,
		   Case 
		    When J.GolsSelecao1 > J.GolsSelecao2 Then Concat(S1.NomeSelecao,' Venceu...')
		   Else 
			Concat(S2.NomeSelecao,' Venceu...')
           End As 'Vencedor'
From Jogos J Inner Join Grupos G
                      On J.CodigoGrupoSorteio = G.CodigoGrupo
                     Inner Join Selecoes S1
                      On J.CodigoSelecao1 = S1.CodigoSelecao
                     Inner Join Selecoes S2
                      On J.CodigoSelecao2 = S2.CodigoSelecao
Where J.CodigoJogo Between 57 And 60
Order By J.CodigoJogo
Go

-- Criando a Tabela ClassificadosSemiFinais --
Create Table ClassificadosSemiFinais
 (CodigoSemiFinais TinyInt Identity(1,1) Primary Key Clustered,
  CodigoGrupoSorteio TinyInt Not Null,
  CodigoSelecaoSorteio TinyInt Not Null)
 Go
 
 -- Inserindo as Seleções Classificadas para as Semi de Finais --
Insert Into ClassificadosSemiFinais
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
Where J.CodigoJogo Between 57 And 60
Order By J.CodigoJogo
Go

-- Consultando --
Select S.NomeSelecao As 'Seleção' 
From ClassificadosSemiFinais Q Inner Join Selecoes S
		   			                                 On Q.CodigoSelecaoSorteio = S.CodigoSelecao
Go