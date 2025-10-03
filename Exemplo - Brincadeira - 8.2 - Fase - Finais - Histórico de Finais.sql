-- Acessando --
Use Qatar2022
Go

-- Criando a Função F_ResumoHistoricoSimulacao --
Create Or Alter Function F_HistoricoDeFinais (@NomeSelecao Varchar(30))
Returns Table
As
Return (Select @NomeSelecao As 'Seleção', 
                        TotalCampea=(Select Count(CodigoHistoricoSimulacao) From HistoricoSimulacao 
                                                Where SelecaoCampea=@NomeSelecao),
						TotalViceCampea=(Select Count(CodigoHistoricoSimulacao) From HistoricoSimulacao 
                                                        Where SelecaoVice=@NomeSelecao))
Go

-- Executando --
Declare @NomeSelecaoExtenso Varchar(30)

Set @NomeSelecaoExtenso=(Select Top 1 SelecaoCampea From HistoricoSimulacao Order By CodigoHistoricoSimulacao Desc)

Select Seleção, TotalCampea+TotalViceCampea As 'Finais Disputadas' From dbo.F_HistoricoDeFinais(@NomeSelecaoExtenso)
Go