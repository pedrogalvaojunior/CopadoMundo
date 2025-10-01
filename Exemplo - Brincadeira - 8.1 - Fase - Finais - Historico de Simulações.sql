-- Criando a Stored Procedure P_HistoricoSimulacao --
Create Or Alter Procedure P_HistoricoSimulacao @CodigoSimulador Char(1)
As
Begin

-- Desativando a Contagem de Linhas --
Set NoCount On

-- Armazenando o Histórico de Jogos realizados --
Insert Into HistoricoJogos (CodigoSimulador, CodigoJogo, CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, 
                                           GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2,  CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
Select @CodigoSimulador, CodigoJogo, CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, 
                                           GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2,  CartoesVermelhoSelecao1, CartoesVermelhoSelecao2 
From Jogos

-- Armazenado o Histórico da última Classificação Geral --
Insert Into HistoricoClassificacaoGeral (CodigoSimulador, CodigoClassificacaoGeral, PosicaoClassificacaoGeral, CodigoSelecao, Jogos, 
                                                                 Pontos, Vitorias, Empates, Derrotas, CartoesAmarelos, CartoesVermelhos, GolsPro, GolsContra, SaldoGols)
Select @CodigoSimulador, CodigoClassificacaoGeral, PosicaoClassificacaoGeral, CodigoSelecao, Jogos, 
           Pontos, Vitorias, Empates, Derrotas, CartoesAmarelos, CartoesVermelhos, GolsPro, GolsContra, SaldoGols
From ClassificacaoGeral

-- Armazenado o Historico de Simulações realizadas --
Insert Into HistoricoSimulacao (CodigoSimulador, Jogo, Placar, SelecaoCampea, SelecaoVice)
Select @CodigoSimulador,
           Concat('Jogo nº ',J.CodigoJogo,' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Final',
           Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar,
		   Case When J.GolsSelecao1 > J.GolsSelecao2 Then S1.NomeSelecao Else S2.NomeSelecao End As 'World Champions',
		   Case When J.GolsSelecao1 > J.GolsSelecao2 Then S2.NomeSelecao Else S1.NomeSelecao End As 'Runner-up'
From Jogos J Inner Join Grupos G
                      On J.CodigoGrupoSorteio = G.CodigoGrupo
                     Inner Join Selecoes S1
                      On J.CodigoSelecao1 = S1.CodigoSelecao
                     Inner Join Selecoes S2
                      On J.CodigoSelecao2 = S2.CodigoSelecao
Where J.CodigoJogo = 64
End
Go
