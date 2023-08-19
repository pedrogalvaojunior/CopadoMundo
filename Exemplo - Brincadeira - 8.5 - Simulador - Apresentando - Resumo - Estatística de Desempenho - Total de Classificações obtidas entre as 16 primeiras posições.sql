-- Acessando --
Use Qatar2022
Go

-- Criando a Função F_EstatisticaDesempenho16PrimeirasPosicoes --
Create Or Alter Function F_EstatisticaDesempenho16PrimeirasPosicoes (@NomeDaSelecao VarChar(30))
Returns Table
As
Return(
Select '       Seleção do(a) '+Pvt.NomeSelecao As 'Desempenho ao longo das simulações',
           Concat(Pvt.[1],' vez(es)') As 'Em 1º', Concat(Pvt.[2],' vez(es)') As 'Em 2º', 
		   Concat(Pvt.[3],' vez(es)') As 'Em 3º', Concat(Pvt.[4],' vez(es)') As 'Em 4º', 
		   Concat(Pvt.[5],' vez(es)') As 'Em 5º', Concat(Pvt.[6],' vez(es)') As 'Em 6º', 
		   Concat(Pvt.[7],' vez(es)') As 'Em 7º', Concat(Pvt.[8],' vez(es)') As 'Em 8º',
           Concat(Pvt.[9],' vez(es)') As 'Em 9º', Concat(Pvt.[10],' vez(es)') As 'Em 10º', 
		   Concat(Pvt.[11],' vez(es)') As 'Em 11º', Concat(Pvt.[12],' vez(es)') As 'Em 12º',
           Concat(Pvt.[13],' vez(es)') As 'Em 13º', Concat(Pvt.[14],' vez(es)') As 'Em 14º', 
		   Concat(Pvt.[15],' vez(es)') As 'Em 15º', Concat(Pvt.[16],' vez(es)') As 'Em 16º'
From
		(Select H.PosicaoClassificacaoGeral, S.CodigoSelecao, S.NomeSelecao
		 From HistoricoClassificacaoGeral H Inner Join Selecoes S
																	On S.NomeSelecao = @NomeDaSelecao
																	And H.CodigoSelecao = S.CodigoSelecao
		 And PosicaoClassificacaoGeral Between 1 And 16) As C 
Pivot (Count(CodigoSelecao) For PosicaoClassificacaoGeral In ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16])) As Pvt)
Go

-- Executando --
Select * From dbo.F_EstatisticaDesempenho16PrimeirasPosicoes('Camarões')
Go