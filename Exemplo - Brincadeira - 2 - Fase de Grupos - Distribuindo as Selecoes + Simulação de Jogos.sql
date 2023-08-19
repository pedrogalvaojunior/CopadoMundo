-- Acessando --
Use Qatar2022
Go

-- Criando as Tabelas GrupoA, GrupoB, GrupoC, GrupoD, GrupoE, GrupoG, GrupoG, GrupoH --
Create Table GrupoA
 (CodigoGrupo TinyInt Identity(1,1) Primary Key Clustered,
  CodigoGrupoSorteio TinyInt Not Null,
  PosicaoGrupoSorteio TinyInt Not Null,
  CodigoSelecaoSorteio TinyInt Not Null,
  ClassificacaoFinalGrupo TinyInt Default 0,
  Pontos TinyInt Default 0,
  Vitorias TinyInt Default 0,
  Empates TinyInt Default 0,
  Derrotas TinyInt Default 0,
  GolsPro Int Default 0,
  GolsContra Int Default 0,
  SaldoGols As (GolsPro - GolsContra))
Go

Create Table GrupoB
 (CodigoGrupo TinyInt Identity(1,1) Primary Key Clustered,
  CodigoGrupoSorteio TinyInt Not Null,
  PosicaoGrupoSorteio TinyInt Not Null,
  CodigoSelecaoSorteio TinyInt Not Null,
  ClassificacaoFinalGrupo TinyInt Default 0,
  Pontos TinyInt Default 0,
  Vitorias TinyInt Default 0,
  Empates TinyInt Default 0,
  Derrotas TinyInt Default 0,
  GolsPro Int Default 0,
  GolsContra Int Default 0,
  SaldoGols As (GolsPro - GolsContra))
Go

Create Table GrupoC
 (CodigoGrupo TinyInt Identity(1,1) Primary Key Clustered,
  CodigoGrupoSorteio TinyInt Not Null,
  PosicaoGrupoSorteio TinyInt Not Null,
  CodigoSelecaoSorteio TinyInt Not Null,
  ClassificacaoFinalGrupo TinyInt Default 0,
  Pontos TinyInt Default 0,
  Vitorias TinyInt Default 0,
  Empates TinyInt Default 0,
  Derrotas TinyInt Default 0,
  GolsPro Int Default 0,
  GolsContra Int Default 0,
  SaldoGols As (GolsPro - GolsContra))
Go

Create Table GrupoD
 (CodigoGrupo TinyInt Identity(1,1) Primary Key Clustered,
  CodigoGrupoSorteio TinyInt Not Null,
  PosicaoGrupoSorteio TinyInt Not Null,
  CodigoSelecaoSorteio TinyInt Not Null,
  ClassificacaoFinalGrupo TinyInt Default 0,
  Pontos TinyInt Default 0,
  Vitorias TinyInt Default 0,
  Empates TinyInt Default 0,
  Derrotas TinyInt Default 0,
  GolsPro Int Default 0,
  GolsContra Int Default 0,
  SaldoGols As (GolsPro - GolsContra))
Go

Create Table GrupoE
 (CodigoGrupo TinyInt Identity(1,1) Primary Key Clustered,
  CodigoGrupoSorteio TinyInt Not Null,
  PosicaoGrupoSorteio TinyInt Not Null,
  CodigoSelecaoSorteio TinyInt Not Null,
  ClassificacaoFinalGrupo TinyInt Default 0,
  Pontos TinyInt Default 0,
  Vitorias TinyInt Default 0,
  Empates TinyInt Default 0,
  Derrotas TinyInt Default 0,
  GolsPro Int Default 0,
  GolsContra Int Default 0,
  SaldoGols As (GolsPro - GolsContra))
Go

Create Table GrupoF
 (CodigoGrupo TinyInt Identity(1,1) Primary Key Clustered,
  CodigoGrupoSorteio TinyInt Not Null,
  PosicaoGrupoSorteio TinyInt Not Null,
  CodigoSelecaoSorteio TinyInt Not Null,
  ClassificacaoFinalGrupo TinyInt Default 0,
  Pontos TinyInt Default 0,
  Vitorias TinyInt Default 0,
  Empates TinyInt Default 0,
  Derrotas TinyInt Default 0,
  GolsPro Int Default 0,
  GolsContra Int Default 0,
  SaldoGols As (GolsPro - GolsContra))
Go

Create Table GrupoG
 (CodigoGrupo TinyInt Identity(1,1) Primary Key Clustered,
  CodigoGrupoSorteio TinyInt Not Null,
  PosicaoGrupoSorteio TinyInt Not Null,
  CodigoSelecaoSorteio TinyInt Not Null,
  ClassificacaoFinalGrupo TinyInt Default 0,
  Pontos TinyInt Default 0,
  Vitorias TinyInt Default 0,
  Empates TinyInt Default 0,
  Derrotas TinyInt Default 0,
  GolsPro Int Default 0,
  GolsContra Int Default 0,
  SaldoGols As (GolsPro - GolsContra))
Go

Create Table GrupoH
 (CodigoGrupo TinyInt Identity(1,1) Primary Key Clustered,
  CodigoGrupoSorteio TinyInt Not Null,
  PosicaoGrupoSorteio TinyInt Not Null,
  CodigoSelecaoSorteio TinyInt Not Null,
  ClassificacaoFinalGrupo TinyInt Default 0,
  Pontos TinyInt Default 0,
  Vitorias TinyInt Default 0,
  Empates TinyInt Default 0,
  Derrotas TinyInt Default 0,
  GolsPro Int Default 0,
  GolsContra Int Default 0,
  SaldoGols As (GolsPro - GolsContra))
Go

-- Populandos os respectivos Grupos de acordo com as Seleções Sorteios --
Insert Into GrupoA (CodigoGrupoSorteio, PosicaoGrupoSorteio, CodigoSelecaoSorteio)
Select CodigoGrupo, PosicaoGrupo, CodigoSelecao From Sorteios
Where CodigoGrupo = 1
Go

Insert Into GrupoB (CodigoGrupoSorteio, PosicaoGrupoSorteio, CodigoSelecaoSorteio)
Select CodigoGrupo, PosicaoGrupo, CodigoSelecao From Sorteios
Where CodigoGrupo = 2
Go

Insert Into GrupoC (CodigoGrupoSorteio, PosicaoGrupoSorteio, CodigoSelecaoSorteio)
Select CodigoGrupo, PosicaoGrupo, CodigoSelecao From Sorteios
Where CodigoGrupo = 3
Go

Insert Into GrupoD (CodigoGrupoSorteio, PosicaoGrupoSorteio, CodigoSelecaoSorteio)
Select CodigoGrupo, PosicaoGrupo, CodigoSelecao From Sorteios
Where CodigoGrupo = 4
Go

Insert Into GrupoE (CodigoGrupoSorteio, PosicaoGrupoSorteio, CodigoSelecaoSorteio)
Select CodigoGrupo, PosicaoGrupo, CodigoSelecao From Sorteios
Where CodigoGrupo = 5
Go

Insert Into GrupoF (CodigoGrupoSorteio, PosicaoGrupoSorteio, CodigoSelecaoSorteio)
Select CodigoGrupo, PosicaoGrupo, CodigoSelecao From Sorteios
Where CodigoGrupo = 6
Go

Insert Into GrupoG (CodigoGrupoSorteio, PosicaoGrupoSorteio, CodigoSelecaoSorteio)
Select CodigoGrupo, PosicaoGrupo, CodigoSelecao From Sorteios
Where CodigoGrupo = 7
Go

Insert Into GrupoH (CodigoGrupoSorteio, PosicaoGrupoSorteio, CodigoSelecaoSorteio)
Select CodigoGrupo, PosicaoGrupo, CodigoSelecao From Sorteios
Where CodigoGrupo = 8
Go

-- Consultando --
Select * From GrupoA
Union
Select * From GrupoB
Union
Select * From GrupoC
Union
Select * From GrupoD
Union
Select * From GrupoE
Union
Select * From GrupoF
Union
Select * From GrupoG
Union
Select * From GrupoH
Go

-- Criando a Tabela de Jogos --
Create Table Jogos
 (CodigoJogo TinyInt Identity(1,1) Primary Key Clustered,
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

-- Verificando a existência de Jogos anteriores --
If (Select Count(*) From Jogos) >0
 Truncate Table Jogos
 Go

-- Criando os 48 Jogos da Fase de Grupos --
Declare @CodigoGrupoSorteio TinyInt, @CodigoJogoNoGrupo TinyInt, 
             @CodigoSelecao1 TinyInt, @CodigoSelecao2 TinyInt, @CodigoSelecao3 TinyInt, @CodigoSelecao4 TinyInt

Set @CodigoGrupoSorteio=1

While (Select Count(CodigoJogo) From Jogos) <=48
 Begin

   Set @CodigoSelecao1 = (Select CodigoSelecao From Sorteios Where CodigoGrupo = @CodigoGrupoSorteio And PosicaoGrupo=1)
   Set @CodigoSelecao2 = (Select CodigoSelecao From Sorteios Where CodigoGrupo = @CodigoGrupoSorteio And  PosicaoGrupo=2)
   Set @CodigoSelecao3 = (Select CodigoSelecao From Sorteios Where CodigoGrupo = @CodigoGrupoSorteio And  PosicaoGrupo=3)
   Set @CodigoSelecao4 = (Select CodigoSelecao From Sorteios Where CodigoGrupo = @CodigoGrupoSorteio And  PosicaoGrupo=4)
   
   Set @CodigoJogoNoGrupo = 1   
   Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
   Values (@CodigoGrupoSorteio,@CodigoSelecao1,@CodigoSelecao2, @CodigoJogoNoGrupo, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)

   Set @CodigoJogoNoGrupo = 2
   Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
   Values (@CodigoGrupoSorteio,@CodigoSelecao3,@CodigoSelecao4, @CodigoJogoNoGrupo, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)

   Set @CodigoJogoNoGrupo = 3
   Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
   Values (@CodigoGrupoSorteio,@CodigoSelecao1,@CodigoSelecao3, @CodigoJogoNoGrupo, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)

   Set @CodigoJogoNoGrupo = 4
   Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
   Values (@CodigoGrupoSorteio,@CodigoSelecao2,@CodigoSelecao4, @CodigoJogoNoGrupo, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)

   Set @CodigoJogoNoGrupo = 5
   Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
   Values (@CodigoGrupoSorteio,@CodigoSelecao1,@CodigoSelecao4, @CodigoJogoNoGrupo, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)

   Set @CodigoJogoNoGrupo = 6
   Insert Into Jogos (CodigoGrupoSorteio, CodigoSelecao1, CodigoSelecao2, CodigoJogoNoGrupo, GolsSelecao1, GolsSelecao2, CartoesAmareloSelecao1, CartoesAmareloSelecao2, CartoesVermelhoSelecao1, CartoesVermelhoSelecao2)
   Values (@CodigoGrupoSorteio,@CodigoSelecao2,@CodigoSelecao3, @CodigoJogoNoGrupo, Rand()*Rand()*8,Rand()*Rand()*8,Rand()*10,Rand()*10,Rand()*4,Rand()*4)

  If (Select Count(CodigoJogo) From Jogos) In (6,12,18,24,30,36,42)
   Set @CodigoGrupoSorteio = @CodigoGrupoSorteio+1
  
  If (Select Count(CodigoJogo) From Jogos) = 48
   Break

End
Go

-- Consultando os 48 Jogos da Fase de Grupo --
Select Concat('Jogo nº ',J.CodigoJogo,' - ', 'Grupo ',G.SiglaGrupo, ' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Fase de Grupos'
From Jogos J Inner Join Grupos G
                      On J.CodigoGrupoSorteio = G.CodigoGrupo
                     Inner Join Selecoes S1
                      On J.CodigoSelecao1 = S1.CodigoSelecao
                     Inner Join Selecoes S2
                      On J.CodigoSelecao2 = S2.CodigoSelecao
Order By J.CodigoJogo
Go

-- Consultando os 48 Jogos da Fase de Grupo - Resultados e Vencedores --
Select Concat('Jogo nº ',J.CodigoJogo,' - ', 'Grupo ',G.SiglaGrupo, ' - ', S1.NomeSelecao,' x ',S2.NomeSelecao) As 'Fase de Grupo',
           Concat(S1.NomeSelecao,' ',J.GolsSelecao1,' x ',J.GolsSelecao2, ' ',S2.NomeSelecao) As Placar,
		   Case 
		    When J.GolsSelecao1 > J.GolsSelecao2 Then Concat(S1.NomeSelecao,' Venceu...')
		    When J.GolsSelecao1 = J.GolsSelecao2 Then 'Empate'
		   Else
		    Concat(S2.NomeSelecao,' Venceu...')
           End As ' '
From Jogos J Inner Join Grupos G
                      On J.CodigoGrupoSorteio = G.CodigoGrupo
                     Inner Join Selecoes S1
                      On J.CodigoSelecao1 = S1.CodigoSelecao
                     Inner Join Selecoes S2
                      On J.CodigoSelecao2 = S2.CodigoSelecao
Order By J.CodigoJogo
Go