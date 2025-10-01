-- Acessando --
Use Qatar2022
Go

-- Consultando os Jogos da Fase Semi Final - Resultados e Vencedores --
Select Concat('Jogo nº ',J.CodigoJogo,' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Semi Final',
           Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar,
		   Case 
		    When J.GolsSelecao1 > J.GolsSelecao2 Then Concat(S1.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then  'Venceu' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorrogação' End)
		    When J.GolsSelecao2 > J.GolsSelecao1 Then Concat(S2.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then ' Venceu' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorrogação' End)
           End As 'Disputa Final',
		   Case 
		    When J.GolsSelecao1 > J.GolsSelecao2 Then Concat(S2.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then  'Perdeu' When 'PE' Then ' Perdeu nos Penaltys' Else ' Perdeu na Prorrogação' End)
		    When J.GolsSelecao2 > J.GolsSelecao1 Then Concat(S1.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then ' Perdeu' When 'PE' Then ' Perdeu nos Penaltys' Else ' Perdeu na Prorrogação' End)
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

Select Replicate('>>>',21) As 'Em execução - Fase - Terceiro Lugar e Final - Definindo as Seleções'
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

Select Replicate('>>>',22) As 'Em execução - Fase - Terceiro Lugar e Final - Jogos Definidos'
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

Select Replicate('>>>',23) As 'Em execução - Fase - Terceiro Lugar - Simulando o Jogo'
Go

-- Criando o Jogo da Disputa do Terceiro Lugar --
Declare @CodigoSelecao1 TinyInt, @CodigoSelecao2 TinyInt

Set @CodigoSelecao1 = (Select CodigoSelecaoSorteio From ClassificadosTerceiroLugar Where CodigoTerceiroLugar = 1)
Set @CodigoSelecao2 = (Select CodigoSelecaoSorteio From ClassificadosTerceiroLugar Where CodigoTerceiroLugar = 2)
  
Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
Values (1,@CodigoSelecao1,@CodigoSelecao2, 1, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)
Go

Select Replicate('>>>',24) As 'Em execução - Fase - Terceiro Lugar - Análise de Empate'
Go

-- Eliminando a ocorrência de possível empate no Jogo da Disputa do Terceiro Lugar --
If (Select Count(CodigoJogo) From Jogos Where CodigoJogo = 63 And GolsSelecao1 = GolsSelecao2) = 1
Begin

 Select 'Ocorreu empate no jogo' As 'Terceiro Lugar',' ' As 'Placar'
 Union All
 Select Concat('Jogo nº ',J.CodigoJogo,' - ', 'Grupo ',G.SiglaGrupo, ' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Terceiro Lugar',
            Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar
 From Jogos J Inner Join Grupos G
                       On J.CodigoGrupoSorteio = G.CodigoGrupo
                      Inner Join Selecoes S1
                       On J.CodigoSelecao1 = S1.CodigoSelecao
                      Inner Join Selecoes S2
                       On J.CodigoSelecao2 = S2.CodigoSelecao
 Where J.CodigoJogo = 63

 Select 'Prorrogação ou Penaltys serão realizados.' As 'Terceiro Lugar'

 Declare @GolsSelecao1 TinyInt, @GolsSelecao2 TinyInt, @StatusProrrogacaoOuPenaltys Char(2)

 Set @GolsSelecao1=1
 Set @GolsSelecao2=1

 While @GolsSelecao1 =  @GolsSelecao2
  Begin
  
   Set @GolsSelecao1 = Rand()*Rand()*8
   Set @GolsSelecao2 = Rand()*Rand()*8

   If (Select Round(Convert(Float,Rand()),2)) <0.6
    Begin
     Select 'A prorrogação está sendo realizada.' As 'Terceiro Lugar - Prorrogação'
     
     Set @StatusProrrogacaoOuPenaltys = 'PR'
    End
   Else
    Begin
     Select 'Os penaltys estão sendo realizados.' As 'Terceiro Lugar - Penaltys'

     Set @StatusProrrogacaoOuPenaltys = 'PE'
    End

   If @GolsSelecao1 <> @GolsSelecao2
    Begin
     Update Jogos
     Set GolsSelecao1 = J.GolsSelecao1+@GolsSelecao1,
           GolsSelecao2 = J.GolsSelecao2+@GolsSelecao2,
           ProrrogacaoOuPenaltys = @StatusProrrogacaoOuPenaltys
     From Jogos J
     Where CodigoJogo = 63
 
     Break
    End
  End
End
Go

Select Replicate('>>>',25) As 'Em execução - Fase - Terceiro Lugar - Resultado'
Go

-- Consultando o resultado do Jogo - Disputa do Terceiro Lugar --
Select Concat('Jogo nº ',J.CodigoJogo,' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Terceiro e Quarto',
           Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar,
		    Case When J.GolsSelecao1 > J.GolsSelecao2 Then Concat(S1.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then  ' Venceu' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorrogação' End) 
             Else Concat(S2.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then  ' Venceu' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorrogação' End) End As 'Terceiro Lugar',
   		    Case When J.GolsSelecao2 > J.GolsSelecao1 Then Concat(S1.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then  ' Perdeu' When 'PE' Then ' Perdeu nos Penaltys' Else ' Perdeu na Prorrogação' End) 
             Else Concat(S2.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then  ' Perdeu' When 'PE' Then ' Perdeu nos Penaltys' Else ' Perdeu na Prorrogação' End) End As 'Quarto Lugar'
From Jogos J Inner Join Grupos G
                      On J.CodigoGrupoSorteio = G.CodigoGrupo
                     Inner Join Selecoes S1
                      On J.CodigoSelecao1 = S1.CodigoSelecao
                     Inner Join Selecoes S2
                      On J.CodigoSelecao2 = S2.CodigoSelecao
Where J.CodigoJogo = 63
Order By J.CodigoJogo
Go

WaitFor Delay '00:00:05'
Go

Select Replicate('>>>',26) As 'Em execução - Fase - Final - Simulando o Jogo'
Go

-- Criando o Jogo da Final --
Declare @CodigoSelecao1 TinyInt, @CodigoSelecao2 TinyInt

Set @CodigoSelecao1 = (Select CodigoSelecaoSorteio From ClassificadosFinal Where CodigoFinal = 1)
Set @CodigoSelecao2 = (Select CodigoSelecaoSorteio From ClassificadosFinal Where CodigoFinal = 2)
  
Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
Values (1,@CodigoSelecao1,@CodigoSelecao2, 1, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)
Go

Select Replicate('>>>',27) As 'Em execução - Fase - Final - Análise de Empate'
Go

-- Eliminando a ocorrência de possível empate na Final --
If (Select Count(CodigoJogo) From Jogos Where CodigoJogo = 64 And GolsSelecao1 = GolsSelecao2) =1
Begin

 Select 'Ocorreu empate no jogo' As 'Final',' ' As 'Placar'
 Union All
 Select Concat('Jogo nº ',J.CodigoJogo,' - ', 'Grupo ',G.SiglaGrupo, ' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Final',
            Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar
 From Jogos J Inner Join Grupos G
                       On J.CodigoGrupoSorteio = G.CodigoGrupo
                      Inner Join Selecoes S1
                       On J.CodigoSelecao1 = S1.CodigoSelecao
                      Inner Join Selecoes S2
                       On J.CodigoSelecao2 = S2.CodigoSelecao
 Where J.CodigoJogo = 64

 Select 'Prorrogação ou Penaltys serão realizados.' As 'Final'

  Declare @GolsSelecao1 TinyInt, @GolsSelecao2 TinyInt, @StatusProrrogacaoOuPenaltys Char(2)

  Set @GolsSelecao1 = 1
  Set @GolsSelecao2 = 1

  While @GolsSelecao1 =  @GolsSelecao2
  Begin
  
   Set @GolsSelecao1 = Rand()*Rand()*8
   Set @GolsSelecao2 = Rand()*Rand()*8

   If (Select Round(Convert(Float,Rand()),2)) <0.6
    Begin
     Select 'A prorrogação está sendo realizada.' As 'Final - Prorrogação'
     
     Set @StatusProrrogacaoOuPenaltys = 'PR'
    End
   Else
    Begin
     Select 'Os penaltys estão sendo realizados.' As 'Final - Penaltys'

     Set @StatusProrrogacaoOuPenaltys = 'PE'
    End

   If @GolsSelecao1 <> @GolsSelecao2
    Begin

     Update Jogos
     Set GolsSelecao1 = J.GolsSelecao1+@GolsSelecao1,
           GolsSelecao2 = J.GolsSelecao2+@GolsSelecao2,
           ProrrogacaoOuPenaltys = @StatusProrrogacaoOuPenaltys
     From Jogos J
     Where CodigoJogo = 64
 
     Break
    End
  End
End
Go

Select Replicate('>>>',28) As 'Em execução - Fase - Final - Resultado'
Go

-- Consultando o resultado do Jogo - Final --
Select Concat('Jogo nº ',J.CodigoJogo,' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Final',
           Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar,
		    Case When J.GolsSelecao1 > J.GolsSelecao2 Then Concat(S1.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then '' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorrogação' End) 
             Else Concat(S2.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then '' When 'PE' Then ' Venceu nos Penaltys' Else ' Venceu na Prorrogação' End) End As 'Fifa World Champions',
   		    Case When J.GolsSelecao2 > J.GolsSelecao1 Then Concat(S1.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then '' When 'PE' Then ' Perdeu nos Penaltys' Else ' Perdeu na Prorrogação' End) 
             Else Concat(S2.NomeSelecao, Case J.ProrrogacaoOuPenaltys When '' Then '' When 'PE' Then ' Perdeu nos Penaltys' Else ' Perdeu na Prorrogação' End) End As 'Runner-up'	   
From Jogos J Inner Join Grupos G
                      On J.CodigoGrupoSorteio = G.CodigoGrupo
                     Inner Join Selecoes S1
                      On J.CodigoSelecao1 = S1.CodigoSelecao
                     Inner Join Selecoes S2
                      On J.CodigoSelecao2 = S2.CodigoSelecao
Where J.CodigoJogo = 64
Go

Select Replicate('>>>',29) As 'Atualizando as tabelas internas'
Go

-- Apresentando a Classificação Geral --
Exec P_ClassificacaoGeral
Go

-- Processando o Histórico de Simulações - Armazenando os Histórico de Jogos, Classificação e Atualizando a Contagem de Simulações realizadas --
Exec P_HistoricoSimulacao 'F'
Go

-- Atualizando o Histórico - Estatística de Desempenho - 16 Primeiras Posições'
Exec P_AtualizarHistoricoEstatisticaDesempenho
Go

-- Apresentando o Histórico de Finais Disputadas da atual Seleção Campeã Mundial, Jogos e Placares --
Declare @NomeSelecaoExtenso Varchar(30)

Set @NomeSelecaoExtenso=(Select Top 1 SelecaoCampea From HistoricoSimulacao Order By CodigoHistoricoSimulacao Desc)

Select Replicate('>>>',30) As 'Resumo de Conquistas'

Select Seleção, 
           Concat(Convert(Varchar(4),TotalCampea),' vez(es)') As 'Campeã Mundial', 
           Concat(Convert(Varchar(4),TotalViceCampea),' vez(es)') As 'Vice-Campeã Mundial',
           Convert(Varchar(4),TotalCampea+TotalViceCampea) As 'Total de Final(is) Disputada(s)'
From dbo.F_HistoricoDeFinais(@NomeSelecaoExtenso) 

Select Replicate('>>>',31) As 'Histórico de Finais Disputadas'

Select @NomeSelecaoExtenso As ' ',
           'Nº '+Convert(Varchar(4),Row_Number() Over(Order By CodigoHistoricoSimulacao)) As 'Final', 
           Jogo As 'Jogo(s)', 
		   Placar As 'Placar(es)',
		   Format(DataHistoricoSimulacao,'yyyy-mm-dd') As 'Data Realização'
From HistoricoSimulacao
Where SelecaoCampea = @NomeSelecaoExtenso
Or SelecaoVice = @NomeSelecaoExtenso

-- Apresentando o Histórico - Estatística de Desempenho - 16 Primeiras Posições --
Select Replicate('>>>',32) As 'Histórico - Estatística de Desempenho - 16 Primeiras Posições'

Select * from dbo.F_EstatisticaDesempenho16PrimeirasPosicoes(@NomeSelecaoExtenso)
Go

Select Replicate('>>>',33) As 'Processamento da Simulação concluído com Sucesso!!!'
Go