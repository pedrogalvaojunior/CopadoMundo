-- Criando o Banco de Dados --
Create Database Qatar2022
Go

-- Desativando a contagem de Linhas --
Set NoCount On
Go

-- Acessando --
Use Qatar2022
Go

-- Criando a Tabela HistoricoDeJogos --
Create Table HistoricoJogos
 (CodigoHistoricoJogo Int Identity(1,1) Primary Key Clustered,
  CodigoSimulador Char(1) Not Null,
  CodigoJogo TinyInt Not Null,
  CodigoGrupoSorteio TinyInt Not Null,
  CodigoSelecao1 TinyInt Not Null,
  CodigoSelecao2 TinyInt Not Null,
  CodigoJogoNoGrupo TinyInt Not Null,
  GolsSelecao1 TinyInt Not Null,
  GolsSelecao2 TinyInt Not Null,
  CartoesAmareloSelecao1 TinyInt Not Null,
  CartoesAmareloSelecao2 TinyInt Not Null,
  CartoesVermelhoSelecao1 TinyInt Not Null,
  CartoesVermelhoSelecao2 TinyInt Not Null)
Go

-- Criando a Tabela HistoricoClassificacaoFinal --
Create Table HistoricoClassificacaoGeral
 (CodigoHistoricoClassificacaoGeral Int Identity(1,1) Primary Key Clustered,
  CodigoSimulador Char(1) Not Null,
  CodigoClassificacaoGeral TinyInt Not Null,
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
  SaldoGols Int Default 0)
Go

-- Criando a Tabela HistoricoSimulacao --
Create Table HistoricoSimulacao
 (CodigoHistoricoSimulacao Int Identity(1,1) Primary Key Clustered,
  CodigoSimulador Char(1) Not Null,
  DataHistoricoSimulacao DateTime Default GetDate(),
  Jogo Varchar(100) Not Null,
  Placar Varchar(50) Not Null,
  SelecaoCampea Varchar(30),
  SelecaoVice Varchar(30))
Go

-- Criando a Tabela de Grupos --
Create Table Grupos
 (CodigoGrupo TinyInt Identity(1,1) Primary Key Clustered,
  SiglaGrupo Char(1))
Go

-- Criando a Tabela de Potes --
Create Table Potes
 (CodigoPote TinyInt Identity(1,1) Primary Key Clustered,
  DescricaoPote As (Concat('Pote ',CodigoPote)))
Go

-- Criando a Tabela de Selecoes --
Create Table Selecoes
(CodigoSelecao TinyInt Identity(1,1) Primary Key Clustered,
 CodigoPote TinyInt Not Null,
 NomeSelecao Varchar(30) Not Null,
 SiglaContinente Char(2))
Go

-- Criando a Tabela Sorteios --
Create Table Sorteios
 (CodigoSorteio TinyInt Identity(1,1) Primary Key Clustered,
  CodigoGrupo TinyInt Not Null,
  CodigoSelecao TinyInt Not Null,
  PosicaoGrupo TinyInt Not Null,
  SiglaContinente Char(2) Not Null)
Go

-- Limpando a tabela de Sorteios --
If (Select Count(*) From Sorteios) >0
 Truncate Table Sorteios
Go

-- Inserindo as Sele��es nos Grupos definidos no Sorteio da Fifa --
Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente)
Select 1, CodigoSelecao, CodigoPote, SiglaContinente From Selecoes
Where NomeSelecao In ('Qatar','Equador','Senegal','Holanda')
Go

Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente)
Select 2, CodigoSelecao, CodigoPote, SiglaContinente From Selecoes
Where NomeSelecao In ('Inglaterra','Ir�','Estados Unidos','Pa�s de Gales')
Go

Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente)
Select 3, CodigoSelecao, CodigoPote, SiglaContinente From Selecoes
Where NomeSelecao In ('Argentina','Ar�bia Saudita','M�xico','Pol�nia')
Go

Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente)
Select 4, CodigoSelecao, CodigoPote, SiglaContinente From Selecoes
Where NomeSelecao In ('Fran�a','Austr�lia','Dinamarca','Tun�sia')
Go

Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente)
Select 5, CodigoSelecao, CodigoPote, SiglaContinente From Selecoes
Where NomeSelecao In ('Espanha','Costa Rica','Alemanha','Jap�o')
Go

Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente)
Select 6, CodigoSelecao, CodigoPote, SiglaContinente From Selecoes
Where NomeSelecao In ('B�lgica','Canad�','Marrocos','Cro�cia')
Go

Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente)
Select 7, CodigoSelecao, CodigoPote, SiglaContinente From Selecoes
Where NomeSelecao In ('Brasil','S�rvia','Su��a','Camar�es')
Go

Insert Into Sorteios (CodigoGrupo, CodigoSelecao, PosicaoGrupo, SiglaContinente)
Select 8, CodigoSelecao, CodigoPote, SiglaContinente From Selecoes
Where NomeSelecao In ('Portugal','Gana','Uruguai','Coreia do Sul')
Go

-- Consultando a forma��o completa de cada Grupo de Sele��es --
;With CTEGrupoA (Posicao, NomeSelecao)
As
(Select PosicaoGrupo, SE.NomeSelecao From Sorteios S Inner Join Selecoes SE
                                                                                           On S.CodigoSelecao = SE.CodigoSelecao
																						   And S.CodigoGrupo = 1),
CTEGrupoB (Posicao, NomeSelecao)
As
(Select PosicaoGrupo, SE.NomeSelecao From Sorteios S Inner Join Selecoes SE
                                                                                           On S.CodigoSelecao = SE.CodigoSelecao
																						   And S.CodigoGrupo = 2),
CTEGrupoC (Posicao, NomeSelecao)
As
(Select PosicaoGrupo, SE.NomeSelecao From Sorteios S Inner Join Selecoes SE
                                                                                           On S.CodigoSelecao = SE.CodigoSelecao
																						   And S.CodigoGrupo = 3),
CTEGrupoD (Posicao, NomeSelecao)
As
(Select PosicaoGrupo, SE.NomeSelecao From Sorteios S Inner Join Selecoes SE
                                                                                           On S.CodigoSelecao = SE.CodigoSelecao
 																						   And S.CodigoGrupo = 4),
CTEGrupoE (Posicao, NomeSelecao)
As
(Select PosicaoGrupo, SE.NomeSelecao From Sorteios S Inner Join Selecoes SE
                                                                                           On S.CodigoSelecao = SE.CodigoSelecao
 																						   And S.CodigoGrupo = 5),
CTEGrupoF (Posicao, NomeSelecao)
As
(Select PosicaoGrupo, SE.NomeSelecao From Sorteios S Inner Join Selecoes SE
                                                                                           On S.CodigoSelecao = SE.CodigoSelecao
 																						   And S.CodigoGrupo = 6),
 CTEGrupoG (Posicao, NomeSelecao)
As
(Select PosicaoGrupo, SE.NomeSelecao From Sorteios S Inner Join Selecoes SE
                                                                                           On S.CodigoSelecao = SE.CodigoSelecao
 																						   And S.CodigoGrupo = 7),
CTEGrupoH (Posicao, NomeSelecao)
As
(Select PosicaoGrupo, SE.NomeSelecao From Sorteios S Inner Join Selecoes SE
                                                                                           On S.CodigoSelecao = SE.CodigoSelecao
 																						   And S.CodigoGrupo = 8)
Select Row_Number() Over(Order By A.Posicao) As 'Pote',
           A.NomeSelecao As 'Grupo A', B.NomeSelecao As 'Grupo B', 
           C.NomeSelecao As 'Grupo C', D.NomeSelecao As 'Grupo D',
           E.NomeSelecao As 'Grupo E', F.NomeSelecao As 'Grupo F',
		   G.NomeSelecao As 'Grupo G', H.NomeSelecao As 'Grupo H'
From CTEGrupoA A Inner Join CTEGrupoB B
                                On A.Posicao = B.Posicao
							   Inner Join CTEGrupoC C
                                On A.Posicao = C.Posicao
							   Inner Join CTEGrupoD D
                                On A.Posicao = D.Posicao
							   Inner Join CTEGrupoE E
                                On A.Posicao = E.Posicao
							   Inner Join CTEGrupoF F
                                On A.Posicao = F.Posicao
							   Inner Join CTEGrupoG G
                                On A.Posicao = G.Posicao
							   Inner Join CTEGrupoH H
                                On A.Posicao = H.Posicao
Go