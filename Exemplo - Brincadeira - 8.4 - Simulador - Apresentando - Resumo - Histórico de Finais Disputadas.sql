-- Acessando --
Use Qatar2022
Go

-- Apresentando o Hist�rico de Finais Disputadas, Jogos e Placares --
Declare @NomeSelecaoExtenso Varchar(30)

Set @NomeSelecaoExtenso='Argentina'

If Exists (Select NomeSelecao From Selecoes Where NomeSelecao=@NomeSelecaoExtenso) 
Begin
 Select Sele��o, 
            Concat(Convert(Varchar(4),TotalCampea),' vez(es)') As 'Campe� Mundial', 
            Concat(Convert(Varchar(4),TotalViceCampea),' vez(es)') As 'Vice-Campe� Mundial',
            Convert(Varchar(4),TotalCampea+TotalViceCampea) As 'Total de Final(is) Disputada(s)'
 From dbo.F_HistoricoDeFinais(@NomeSelecaoExtenso) 

 Select Replicate('>>>',30) As 'Hist�rico de Finais Disputadas'

 Select @NomeSelecaoExtenso As ' ',
            'N� '+Convert(Varchar(4),Row_Number() Over(Order By CodigoHistoricoSimulacao)) As 'Final Disputada', 
            Jogo As 'Jogo(s)', 
			Placar As 'Placar(es)'
 From HistoricoSimulacao
 Where SelecaoCampea = @NomeSelecaoExtenso
 Or SelecaoVice = @NomeSelecaoExtenso
End
 Else
  Select 'O nome da sele��o informada n�o foi encontrado na rela��o de sele��es participantes desta edi��o.' As 'Aten��o'
Go