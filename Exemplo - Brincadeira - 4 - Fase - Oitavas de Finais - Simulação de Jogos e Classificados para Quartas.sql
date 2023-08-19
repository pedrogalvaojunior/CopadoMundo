-- Acessando --
Use Qatar2022
Go

-- Criando os 8 Jogos da Fase de Oitavas de Final --
Declare @CodigoGrupoSorteioInicial TinyInt, @CodigoGrupoSorteioFinal TinyInt, @CodigoSelecao1 TinyInt, @CodigoSelecao2 TinyInt

Set @CodigoGrupoSorteioInicial = 1
Set @CodigoGrupoSorteioFinal = 2
Set @CodigoSelecao1 = 1
Set @CodigoSelecao2 = 1

While (Select Count(CodigoJogo) From Jogos) <= 56
 Begin
 
  Set @CodigoSelecao1 = (Select CodigoSelecaoSorteio From ClassificadosOitavasDeFinal
                                          Where CodigoGrupoSorteio=@CodigoGrupoSorteioInicial
                                          And ClassificacaoFinalNoGrupo=1)

  Set @CodigoSelecao2 = (Select CodigoSelecaoSorteio From ClassificadosOitavasDeFinal
										  Where CodigoGrupoSorteio=@CodigoGrupoSorteioFinal
										  And ClassificacaoFinalNoGrupo=2)

  Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
  Values (@CodigoGrupoSorteioInicial,@CodigoSelecao1,@CodigoSelecao2, 1, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)

  Set @CodigoSelecao1 = (Select CodigoSelecaoSorteio From ClassificadosOitavasDeFinal
										   Where CodigoGrupoSorteio=@CodigoGrupoSorteioFinal
											And ClassificacaoFinalNoGrupo=1)

  Set @CodigoSelecao2 = (Select CodigoSelecaoSorteio From ClassificadosOitavasDeFinal
										   Where CodigoGrupoSorteio=@CodigoGrupoSorteioInicial
											And ClassificacaoFinalNoGrupo=2)

  Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
  Values (@CodigoGrupoSorteioFinal,@CodigoSelecao1,@CodigoSelecao2, 2, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)

  If (Select Count(CodigoJogo) From Jogos) In (50,52,54,56)
   Begin
    Set @CodigoGrupoSorteioInicial = @CodigoGrupoSorteioInicial+2
    Set @CodigoGrupoSorteioFinal = @CodigoGrupoSorteioFinal+2
   End

  If (Select Count(CodigoJogo) From Jogos) = 56
   Break
End
Go

-- Consultando os Jogos da Fase Oitavas de Final --
Select Concat('Jogo nº ',J.CodigoJogo,' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Quartas de Final'
From Jogos J Inner Join Grupos G
                      On J.CodigoGrupoSorteio = G.CodigoGrupo
                     Inner Join Selecoes S1
                      On J.CodigoSelecao1 = S1.CodigoSelecao
                     Inner Join Selecoes S2
                      On J.CodigoSelecao2 = S2.CodigoSelecao
Where J.CodigoJogo Between 49 And 56
Order By J.CodigoJogo
Go

-- Eliminando a ocorrência de possíveis empates nos Jogos de Oitavas de Final --
If (Select Count(CodigoJogo) From Jogos Where CodigoJogo Between 49 And 56 And GolsSelecao1 = GolsSelecao2) >=1
Begin

 Select 'Ocorreu empate(s) no(s) seguinte(s) jogos' As 'Oitavas de Final',' ' As 'Placar'
 Union All
 Select Concat('Jogo nº ',J.CodigoJogo,' - ', 'Grupo ',G.SiglaGrupo, ' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Oitavas de Final',
            Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar
 From Jogos J Inner Join Grupos G
                       On J.CodigoGrupoSorteio = G.CodigoGrupo
                      Inner Join Selecoes S1
                       On J.CodigoSelecao1 = S1.CodigoSelecao
                      Inner Join Selecoes S2
                       On J.CodigoSelecao2 = S2.CodigoSelecao
 Where J.CodigoJogo In (Select CodigoJogo From Jogos Where CodigoJogo Between 49 And 56 And GolsSelecao1 = GolsSelecao2)

 Select 'Prorrogação ou Penaltys foram realizados....' As 'Oitavas de Final'
 
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
     Where CodigoJogo In (Select CodigoJogo From Jogos Where CodigoJogo Between 49 And 56 And GolsSelecao1 = GolsSelecao2)
 
     Break
    End
  End
End
Go

-- Consultando os Jogos da Fase Oitavas de Final - Resultados e Vencedores --
Select Concat('Jogo nº ',J.CodigoJogo,' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Quartas de Final',
           Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar,
		   Case 
		    When J.GolsSelecao1 > J.GolsSelecao2 Then Concat(S1.NomeSelecao,' Venceu...')
		    When J.GolsSelecao2 > J.GolsSelecao1 Then Concat(S2.NomeSelecao,' Venceu...')
           End As 'Vencedor'
From Jogos J Inner Join Grupos G
                      On J.CodigoGrupoSorteio = G.CodigoGrupo
                     Inner Join Selecoes S1
                      On J.CodigoSelecao1 = S1.CodigoSelecao
                     Inner Join Selecoes S2
                      On J.CodigoSelecao2 = S2.CodigoSelecao
Where J.CodigoJogo Between 49 And 56
Order By J.CodigoJogo
Go

-- Criando a Tabela ClassificadosQuartasDeFinal --
Create Table ClassificadosQuartasDeFinal
 (CodigoQuartasDeFinal TinyInt Identity(1,1) Primary Key Clustered,
  CodigoGrupoSorteio TinyInt Not Null,
  CodigoSelecaoSorteio TinyInt Not Null)
 Go
 
-- Inserindo as Seleções Classificadas para as Quartas de Final --
Insert Into ClassificadosQuartasDeFinal
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
Where J.CodigoJogo Between 49 And 56
Order By J.CodigoJogo
Go

-- Consultando --
Select S.NomeSelecao As 'Seleção' From ClassificadosQuartasDeFinal Q Inner Join Selecoes S
										 							                                                  On Q.CodigoSelecaoSorteio = S.CodigoSelecao
Go