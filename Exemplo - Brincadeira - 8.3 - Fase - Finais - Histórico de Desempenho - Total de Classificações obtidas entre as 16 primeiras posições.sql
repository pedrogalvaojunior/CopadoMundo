-- Criando a Stored Procedure P_AtualizarHistoricoEstatisticaDesempenho --
Create Or Alter Procedure P_AtualizarHistoricoEstatisticaDesempenho
As
Begin

Set NoCount On

;With CTEAtualizarClassificacaoGeral (PosicaoClassificacao, CodigoSelecao)
As
(
Select 1, Case When J.GolsSelecao1 > J.GolsSelecao2 Then S1.CodigoSelecao Else S2.CodigoSelecao End As 'Classificação'
From ClassificadosFinal C Inner Join Selecoes S1
                                           On C.CodigoSelecaoSorteio = S1.CodigoSelecao
										  Inner Join Jogos J
										   On J.CodigoSelecao1 = S1.CodigoSelecao
										  Inner Join Selecoes S2
										   On S2.CodigoSelecao = J.CodigoSelecao2
Where J.CodigoJogo = 64

Union All

Select 2, Case When J.GolsSelecao1 < J.GolsSelecao2 Then S1.CodigoSelecao Else S2.CodigoSelecao End As 'Classificação'
From ClassificadosFinal C Inner Join Selecoes S1
                                           On C.CodigoSelecaoSorteio = S1.CodigoSelecao
										  Inner Join Jogos J
										   On J.CodigoSelecao1 = S1.CodigoSelecao
										  Inner Join Selecoes S2
										   On S2.CodigoSelecao = J.CodigoSelecao2
Where J.CodigoJogo = 64

Union All

Select 3, Case When J.GolsSelecao1 > J.GolsSelecao2 Then S1.CodigoSelecao Else S2.CodigoSelecao End As 'Classificação'
From ClassificadosTerceiroLugar C Inner Join Selecoes S1
                                           On C.CodigoSelecaoSorteio = S1.CodigoSelecao
										  Inner Join Jogos J
										   On J.CodigoSelecao1 = S1.CodigoSelecao
										  Inner Join Selecoes S2
										   On S2.CodigoSelecao = J.CodigoSelecao2
Where J.CodigoJogo = 63

Union All

Select 4, Case When J.GolsSelecao1 < J.GolsSelecao2 Then S1.CodigoSelecao Else S2.CodigoSelecao End As 'Classificação'
From ClassificadosTerceiroLugar C Inner Join Selecoes S1
                                           On C.CodigoSelecaoSorteio = S1.CodigoSelecao
										  Inner Join Jogos J
										   On J.CodigoSelecao1 = S1.CodigoSelecao
										  Inner Join Selecoes S2
										   On S2.CodigoSelecao = J.CodigoSelecao2
Where J.CodigoJogo = 63
Union All

Select Row_Number() Over (Order By PosicaoClassificacaoGeral Asc)+4, S.CodigoSelecao As 'Classificação'
From ClassificacaoGeral C Inner Join Selecoes S
										 On C.CodigoSelecao = S.CodigoSelecao 
Where C.PosicaoClassificacaoGeral >=5
)
-- Atualizando a Posição da Classificação Geral --
Update HistoricoClassificacaoGeral
Set PosicaoClassificacaoGeral = C.PosicaoClassificacao
From HistoricoClassificacaoGeral H Inner Join CTEAtualizarClassificacaoGeral C
														   On H.CodigoSelecao = C.CodigoSelecao
Where H.CodigoHistoricoClassificacaoGeral >= (Select Max(CodigoHistoricoClassificacaoGeral)-31 From HistoricoClassificacaoGeral)
End
Go