-- Acessando --
Use Qatar2022
Go

-- Criando a Fun��o F_EstatisticaDesempenho16PrimeirasPosicoes --
Create Or Alter Function F_EstatisticaDesempenho16PrimeirasPosicoes (@NomeDaSelecao VarChar(30))
Returns Table
As
Return(
Select '       Sele��o do(a) '+Pvt.NomeSelecao As 'Desempenho ao longo das simula��es',
           Concat(Pvt.[1],' vez(es)') As 'Em 1�', Concat(Pvt.[2],' vez(es)') As 'Em 2�', 
		   Concat(Pvt.[3],' vez(es)') As 'Em 3�', Concat(Pvt.[4],' vez(es)') As 'Em 4�', 
		   Concat(Pvt.[5],' vez(es)') As 'Em 5�', Concat(Pvt.[6],' vez(es)') As 'Em 6�', 
		   Concat(Pvt.[7],' vez(es)') As 'Em 7�', Concat(Pvt.[8],' vez(es)') As 'Em 8�',
           Concat(Pvt.[9],' vez(es)') As 'Em 9�', Concat(Pvt.[10],' vez(es)') As 'Em 10�', 
		   Concat(Pvt.[11],' vez(es)') As 'Em 11�', Concat(Pvt.[12],' vez(es)') As 'Em 12�',
           Concat(Pvt.[13],' vez(es)') As 'Em 13�', Concat(Pvt.[14],' vez(es)') As 'Em 14�', 
		   Concat(Pvt.[15],' vez(es)') As 'Em 15�', Concat(Pvt.[16],' vez(es)') As 'Em 16�'
From
		(Select H.PosicaoClassificacaoGeral, S.CodigoSelecao, S.NomeSelecao
		 From HistoricoClassificacaoGeral H Inner Join Selecoes S
																	On S.NomeSelecao = @NomeDaSelecao
																	And H.CodigoSelecao = S.CodigoSelecao
		 And PosicaoClassificacaoGeral Between 1 And 16) As C 
Pivot (Count(CodigoSelecao) For PosicaoClassificacaoGeral In ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16])) As Pvt)
Go

-- Executando --
Select * From dbo.F_EstatisticaDesempenho16PrimeirasPosicoes('Camar�es')
Go