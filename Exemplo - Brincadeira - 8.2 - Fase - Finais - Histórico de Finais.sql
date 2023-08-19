-- Acessando --
Use Qatar2022
Go

-- Criando a Fun��o F_ResumoHistoricoSimulacao --
Create Or Alter Function F_HistoricoDeFinais (@NomeSelecao Varchar(30))
Returns Table
As
Return (Select @NomeSelecao As 'Sele��o', 
                        TotalCampea=(Select Count(CodigoHistoricoSimulacao) From HistoricoSimulacao 
                                                Where SelecaoCampea=@NomeSelecao),
						TotalViceCampea=(Select Count(CodigoHistoricoSimulacao) From HistoricoSimulacao 
                                                        Where SelecaoVice=@NomeSelecao)						)
Go

-- Executando --
Select *, TotalCampea+TotalViceCampea As 'Finais Disputadas'
From dbo.F_HistoricoDeFinais('Estados Unidos')
Go