-- Acessando --
Use Qatar2022
Go

-- Criando a Tabela ClassificacaoGeral --
Create Table ClassificacaoGeral
 (CodigoClassificacaoGeral TinyInt Identity(1,1) Primary Key Clustered,
  PosicaoClassificacaoGeral TinyInt Default 0,
  CodigoSelecao TinyInt Not Null,
  Jogos TinyInt Default 0,
  Pontos TinyInt Default 0,
  Vitorias TinyInt Default 0,
  Empates TinyInt Default 0,
  Derrotas TinyInt Default 0,
  CartoesAmarelos TinyInt Default 0,
  CartoesVermelhos TinyInt Default 0,
  GolsPro Int Default 0,
  GolsContra Int Default 0,
  SaldoGols As (GolsPro - GolsContra))
Go

-- Implementando a Classificacação Geral após o encerramento da Copa do Mundo --
Create Or Alter Procedure P_ClassificacaoGeral
As
Begin

-- Removendo as classificações anteriores --
Truncate Table ClassificacaoGeral

-- Desativando a Contagem de Linhas --
Set NoCount On

-- Inserindo as 32 Selecoes na ClassificacaoGeral --
Insert Into ClassificacaoGeral (CodigoSelecao)
Select CodigoSelecao From Selecoes

-- Identificando a Quantidade de Jogos, GolsPro, GolsContra, Cartoões Amarelos e Vermelhos --
Declare @CodigoSelecao TinyInt

Set @CodigoSelecao = 1

While @CodigoSelecao <=32
Begin

 ;With CTEResumoJogos (CodigoSelecao, Jogos, Gols, GolsContra, Amarelos, Vermelhos)
 As

 (Select CodigoSelecao1, Count(CodigoJogo) As Jogos, Sum(GolsSelecao1) As GolsPro, Sum(GolsSelecao2) As GolsContra,              
             Sum(CartoesAmareloSelecao1) As Amarelos, Sum(CartoesVermelhoSelecao1) As Vermelhos
 From Jogos
 Where CodigoSelecao1=@CodigoSelecao
 Group By CodigoSelecao1

 Union

 Select CodigoSelecao2, Count(CodigoJogo) As Jogos, Sum(GolsSelecao2) As GolsPro, Sum(GolsSelecao1) As GolsContra,   
            Sum(CartoesAmareloSelecao2) As Amarelos, Sum(CartoesVermelhoSelecao2) As Vermelhos
 From Jogos
 Where CodigoSelecao2=@CodigoSelecao
 Group By CodigoSelecao2)

 Update ClassificacaoGeral
 Set Jogos = CR.Jogos,
       GolsPro = CR.GolsPro,
	   GolsContra = CR.GolsContra,
       CartoesAmarelos = CR.Amarelos,
	   CartoesVermelhos = CR.Vermelhos
 From ClassificacaoGeral C Cross Apply (Select CodigoSelecao, Sum(Jogos) As Jogos, Sum(Gols) As GolsPro, Sum(GolsContra) As GolsContra,
                                                                             Sum(Amarelos) As Amarelos, Sum(Vermelhos) As Vermelhos
																  From CTEResumoJogos
																  Where CodigoSelecao = C.CodigoSelecao
																  Group By CodigoSelecao) As CR (CodigoSelecao, Jogos, GolsPro, GolsContra, Amarelos, Vermelhos)

 Where C.CodigoSelecao = @CodigoSelecao

 Set @CodigoSelecao = @CodigoSelecao + 1
End

-- Identificando a Quantidade de Vitorias, Empates, Derrotas e Pontos --
Set @CodigoSelecao = 1

While @CodigoSelecao <=32
Begin

 ;With CTEResumoVitorasEmpatesDerrotas(CodigoSelecao, Vitorias, Derrotas, Empates)
 As
 (
  Select CodigoSelecao1,
             IsNull(Case When GolsSelecao1 > GolsSelecao2 Then 1 End,0) As Vitorias,
             IsNull(Case When GolsSelecao1 < GolsSelecao2 Then 1 End,0) As Derrotas,
             IsNull(Case When GolsSelecao1 = GolsSelecao2 Then 1 End,0) As Empates
  From Jogos
  Where CodigoSelecao1=@CodigoSelecao

  Union All

  Select CodigoSelecao2,
             IsNull(Case When GolsSelecao2 > GolsSelecao1 Then 1 End,0) As Vitorias,
             IsNull(Case When GolsSelecao2 < GolsSelecao1 Then 1 End,0) As Derrotas,
             IsNull(Case When GolsSelecao2 = GolsSelecao1 Then 1 End,0) As Empates
  From Jogos
  Where CodigoSelecao2=@CodigoSelecao
 ),
  CTEResumoPontuacao (CodigoSelecao, TotalVitorias, TotalDerrotas, TotalEmpates, Pontos)
  As
  (
   Select CodigoSelecao, Sum(Vitorias) As V, Sum(Derrotas) As D, Sum(Empates) As E,
              Sum(Vitorias)*3+Sum(Empates)*1 As Pontos
   From CTEResumoVitorasEmpatesDerrotas
   Where CodigoSelecao = @CodigoSelecao
   Group By CodigoSelecao
  )
  
  Update ClassificacaoGeral
  Set Vitorias = CT.TotalVitorias,
		Derrotas = CT.TotalDerrotas,
        Empates = CT.TotalEmpates,
		Pontos = CT.Pontos
  From ClassificacaoGeral C Inner Join CTEResumoPontuacao CT
											  On C.CodigoSelecao = CT.CodigoSelecao
  Where C.CodigoSelecao = @CodigoSelecao

 Set @CodigoSelecao = @CodigoSelecao + 1
End

-- Atualizando a Classificação Geral --
;With CTEPosicaoClassificacaoGeral (Classificacao, CodigoSelecao)
As
(
Select Row_Number() Over (Order By Pontos Desc, Jogos Desc, Vitorias Desc, Empates Desc, Derrotas Desc,
                                              GolsPro Desc, GolsContra Desc, SaldoGols Desc, 
											  CartoesAmarelos Desc, CartoesVermelhos Desc) As 'Classificação',
		  CodigoSelecao
From ClassificacaoGeral
)
Update ClassificacaoGeral
Set PosicaoClassificacaoGeral = CP.Classificacao
From ClassificacaoGeral C Inner Join CTEPosicaoClassificacaoGeral CP
										    On C.CodigoSelecao = CP.CodigoSelecao

-- Apresentando - Classificação Final - World Champion, Runner-Up, Terceiro e Quarto --
Select 'Classificação Final - World Champion, Runner-Up, Terceiro e Quarto' As 'Qatar 2022'
Union All
Select Case When J.GolsSelecao1 > J.GolsSelecao2 Then '1º lugar: '+S1.NomeSelecao Else '1º lugar: '+S2.NomeSelecao End As 'Classificação'
From ClassificadosFinal C Inner Join Selecoes S1
                                           On C.CodigoSelecaoSorteio = S1.CodigoSelecao
										  Inner Join Jogos J
										   On J.CodigoSelecao1 = S1.CodigoSelecao
										  Inner Join Selecoes S2
										   On S2.CodigoSelecao = J.CodigoSelecao2
Where J.CodigoJogo = 64

Union All

Select Case When J.GolsSelecao1 < J.GolsSelecao2 Then '2º lugar: '+S1.NomeSelecao Else '2º lugar: '+S2.NomeSelecao End As 'Classificação'
From ClassificadosFinal C Inner Join Selecoes S1
                                           On C.CodigoSelecaoSorteio = S1.CodigoSelecao
										  Inner Join Jogos J
										   On J.CodigoSelecao1 = S1.CodigoSelecao
										  Inner Join Selecoes S2
										   On S2.CodigoSelecao = J.CodigoSelecao2
Where J.CodigoJogo = 64

Union All

Select Case When J.GolsSelecao1 > J.GolsSelecao2 Then '3º lugar: '+S1.NomeSelecao Else '3º lugar: '+S2.NomeSelecao End As 'Classificação'
From ClassificadosTerceiroLugar C Inner Join Selecoes S1
                                           On C.CodigoSelecaoSorteio = S1.CodigoSelecao
										  Inner Join Jogos J
										   On J.CodigoSelecao1 = S1.CodigoSelecao
										  Inner Join Selecoes S2
										   On S2.CodigoSelecao = J.CodigoSelecao2
Where J.CodigoJogo = 63

Union All

Select Case When J.GolsSelecao1 < J.GolsSelecao2 Then '4º lugar: '+S1.NomeSelecao Else '4º lugar: '+S2.NomeSelecao End As 'Classificação'
From ClassificadosTerceiroLugar C Inner Join Selecoes S1
                                           On C.CodigoSelecaoSorteio = S1.CodigoSelecao
										  Inner Join Jogos J
										   On J.CodigoSelecao1 = S1.CodigoSelecao
										  Inner Join Selecoes S2
										   On S2.CodigoSelecao = J.CodigoSelecao2
Where J.CodigoJogo = 63

-- Apresentando - Classificação Final - Posicionamento - Seleções --
Select 'Classificação Final - Posicionamento - Seleções' As 'Qatar 2022'
Union All
Select Case When J.GolsSelecao1 > J.GolsSelecao2 Then '1º lugar: '+S1.NomeSelecao Else '1º lugar: '+S2.NomeSelecao End As 'Classificação'
From ClassificadosFinal C Inner Join Selecoes S1
                                           On C.CodigoSelecaoSorteio = S1.CodigoSelecao
										  Inner Join Jogos J
										   On J.CodigoSelecao1 = S1.CodigoSelecao
										  Inner Join Selecoes S2
										   On S2.CodigoSelecao = J.CodigoSelecao2
Where J.CodigoJogo = 64

Union All

Select Case When J.GolsSelecao1 < J.GolsSelecao2 Then '2º lugar: '+S1.NomeSelecao Else '2º lugar: '+S2.NomeSelecao End As 'Classificação'
From ClassificadosFinal C Inner Join Selecoes S1
                                           On C.CodigoSelecaoSorteio = S1.CodigoSelecao
										  Inner Join Jogos J
										   On J.CodigoSelecao1 = S1.CodigoSelecao
										  Inner Join Selecoes S2
										   On S2.CodigoSelecao = J.CodigoSelecao2
Where J.CodigoJogo = 64

Union All

Select Case When J.GolsSelecao1 > J.GolsSelecao2 Then '3º lugar: '+S1.NomeSelecao Else '3º lugar: '+S2.NomeSelecao End As 'Classificação'
From ClassificadosTerceiroLugar C Inner Join Selecoes S1
                                           On C.CodigoSelecaoSorteio = S1.CodigoSelecao
										  Inner Join Jogos J
										   On J.CodigoSelecao1 = S1.CodigoSelecao
										  Inner Join Selecoes S2
										   On S2.CodigoSelecao = J.CodigoSelecao2
Where J.CodigoJogo = 63

Union All

Select Case When J.GolsSelecao1 < J.GolsSelecao2 Then '4º lugar: '+S1.NomeSelecao Else '4º lugar: '+S2.NomeSelecao End As 'Classificação'
From ClassificadosTerceiroLugar C Inner Join Selecoes S1
                                           On C.CodigoSelecaoSorteio = S1.CodigoSelecao
										  Inner Join Jogos J
										   On J.CodigoSelecao1 = S1.CodigoSelecao
										  Inner Join Selecoes S2
										   On S2.CodigoSelecao = J.CodigoSelecao2
Where J.CodigoJogo = 63
Union All

Select Concat(Row_Number() Over (Order By PosicaoClassificacaoGeral Asc)+4,'º lugar: ', S.NomeSelecao) As 'Classificação'
From ClassificacaoGeral C Inner Join Selecoes S
										 On C.CodigoSelecao = S.CodigoSelecao 
Where C.PosicaoClassificacaoGeral >=5

-- Apresentando - Classificação Final - Performance Geral - Seleções - Considerando todas as fases disputadas --
Select 'Classificação Final - Performance Geral - Seleções - Considerando todas as fases disputadas' As 'Qatar 2022'
Select Concat(Row_Number() Over (Order By Case PosicaoClassificacaoGeral When 2 Then Pontos - 3 Else Pontos End Desc, Jogos Desc, Vitorias Desc, Empates Desc, Derrotas Desc ),'º lugar: ', S.NomeSelecao) As 'Classificação',
		   C.Jogos, C.Vitorias, C.Empates, C.Derrotas,
		   C.GolsPro As 'Gols Pró', C.GolsContra As 'Gols Contra', C.SaldoGols As 'Saldo de Gols',
		   C.CartoesAmarelos  As Amarelos, C.CartoesVermelhos As Vermelhos,
		   Convert(Varchar(4),Ceiling((Convert(Numeric(2,0),C.Pontos)/21.00)*100))+'%' As '% de Pontos'
From ClassificacaoGeral C Inner Join Selecoes S
										 On C.CodigoSelecao = S.CodigoSelecao 

-- Apresentando - Classificação Geral - Desempenho ao longo da Copa do Mundo - Critérios - Pontos, Jogos, Vitórias, Empates --
Select 'Classificação Geral - Desempenho ao longo da Copa do Mundo - Critérios - Pontos, Jogos, Vitórias, Empates, Derrotas...' As 'Qatar 2022'
Select Concat(Row_Number() Over (Order By Pontos Desc, Jogos Desc, Vitorias Desc, Empates Desc, Derrotas Desc,
                                                                          GolsPro Desc, GolsContra Desc, SaldoGols Desc, 
											                              CartoesAmarelos Desc, CartoesVermelhos Desc),
           'º lugar: ', S.NomeSelecao) As 'Classificação',
		   C.Pontos,
		   C.Jogos, C.Vitorias, C.Empates, C.Derrotas,
		   C.GolsPro As 'Gols Pró', C.GolsContra As 'Gols Contra', C.SaldoGols As 'Saldo de Gols',
		   C.CartoesAmarelos  As Amarelos, C.CartoesVermelhos As Vermelhos,
		   Round(Percent_Rank() Over (Order By Case PosicaoClassificacaoGeral 
																			When 1 Then (Pontos - 3) 
																			When 2 Then (Pontos - 3) 
																		  Else Pontos
																		 End),2) As 'Ranking'
From ClassificacaoGeral C Inner Join Selecoes S
										 On C.CodigoSelecao = S.CodigoSelecao 
Order By Pontos Desc
End
Go