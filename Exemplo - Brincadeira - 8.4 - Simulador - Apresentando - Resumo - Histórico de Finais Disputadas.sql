-- Acessando --
Use Qatar2022
Go

-- Apresentando o Histórico de Finais Disputadas, Jogos e Placares --
Declare @NomeSelecaoExtenso Varchar(30)

Set @NomeSelecaoExtenso='Argentina'

If Exists (Select NomeSelecao From Selecoes Where NomeSelecao=@NomeSelecaoExtenso) 
Begin
 Select Seleção, 
            Concat(Convert(Varchar(4),TotalCampea),' vez(es)') As 'Campeã Mundial', 
            Concat(Convert(Varchar(4),TotalViceCampea),' vez(es)') As 'Vice-Campeã Mundial',
            Convert(Varchar(4),TotalCampea+TotalViceCampea) As 'Total de Final(is) Disputada(s)'
 From dbo.F_HistoricoDeFinais(@NomeSelecaoExtenso) 

 Select Replicate('>>>',30) As 'Histórico de Finais Disputadas'

 Select @NomeSelecaoExtenso As ' ',
            'Nº '+Convert(Varchar(4),Row_Number() Over(Order By CodigoHistoricoSimulacao)) As 'Final Disputada', 
            Jogo As 'Jogo(s)', 
			Placar As 'Placar(es)'
 From HistoricoSimulacao
 Where SelecaoCampea = @NomeSelecaoExtenso
 Or SelecaoVice = @NomeSelecaoExtenso
End
 Else
  Select 'O nome da seleção informada não foi encontrado na relação de seleções participantes desta edição.' As 'Atenção'
Go