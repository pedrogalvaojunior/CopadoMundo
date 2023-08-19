-- Acessando --
Use Qatar2022
Go

Create Or Alter Procedure P_ClassificacaoGrupoD
As
Begin

-- Desativando a Contagem de Linhas --
Set NoCount On

-- Limpando os Dados da Tabela GrupoD --
Update GrupoD
Set Pontos = 0, Vitorias = 0, Empates=0, Derrotas=0, GolsPro=0, GolsContra=0

-- Atualizando a Tabela de Classificação Grupo A --
Declare @ContadorDeJogos TinyInt, 
             @CodigoSelecao1 TinyInt, @CodigoSelecao2 TinyInt, @GolsSelecao1 TinyInt, @GolsSelecao2 TinyInt

Set @ContadorDeJogos = 1

While @ContadorDeJogos <=6
 Begin
  
   Set @CodigoSelecao1 = (Select CodigoSelecao1 From Jogos Where CodigoGrupoSorteio = 4 And CodigoJogoNoGrupo = @ContadorDeJogos)
   Set @CodigoSelecao2 = (Select CodigoSelecao2 From Jogos Where CodigoGrupoSorteio = 4 And CodigoJogoNoGrupo = @ContadorDeJogos)
   Set @GolsSelecao1 = (Select GolsSelecao1 From Jogos Where CodigoGrupoSorteio = 4 And CodigoJogoNoGrupo = @ContadorDeJogos)
   Set @GolsSelecao2 = (Select GolsSelecao2 From Jogos Where CodigoGrupoSorteio = 4 And CodigoJogoNoGrupo = @ContadorDeJogos)	

   If (@GolsSelecao1 > @GolsSelecao2)
	Begin
	  
	Update GrupoD
	Set GolsPro = GolsPro + @GolsSelecao1,
	      GolsContra = GolsContra + @GolsSelecao2,
		  Pontos = Pontos+3,
		  Vitorias = Vitorias+1
	Where CodigoSelecaoSorteio = @CodigoSelecao1

	Update GrupoD
	Set GolsPro = GolsPro + @GolsSelecao2,
	      GolsContra = GolsContra + @GolsSelecao1,
		  Derrotas = Derrotas + 1
	Where CodigoSelecaoSorteio = @CodigoSelecao2
   End

	If (@GolsSelecao2 > @GolsSelecao1)
	 Begin
	  
	  Update GrupoD
	  Set GolsPro = GolsPro + @GolsSelecao2,
		    GolsContra = GolsContra + @GolsSelecao1,
		    Pontos = Pontos + 3,
		    Vitorias = Vitorias + 1
	  Where CodigoSelecaoSorteio = @CodigoSelecao2

	 Update GrupoD
	 Set GolsPro = GolsPro + @GolsSelecao1,
	       GolsContra = GolsContra + @GolsSelecao2,
	 	   Derrotas = Derrotas + 1 
	 Where CodigoSelecaoSorteio = @CodigoSelecao1
    End

	If (@GolsSelecao1 = @GolsSelecao2)
	 Begin
	  
	  Update GrupoD
	  Set GolsPro = GolsPro + @GolsSelecao1,
		    GolsContra = GolsContra + @GolsSelecao2,
		    Pontos = Pontos + 1,
			Empates = Empates + 1
	  Where CodigoSelecaoSorteio = @CodigoSelecao1

	  Update GrupoD
	  Set GolsPro = GolsPro + @GolsSelecao2,
		    GolsContra = GolsContra + @GolsSelecao1,
		    Pontos = Pontos + 1,
			Empates = Empates + 1
	  Where CodigoSelecaoSorteio = @CodigoSelecao2
     End

  Set @ContadorDeJogos = @ContadorDeJogos + 1
End

-- Atualizando a Classificação Final definindo a posição de cada Seleção no Grupo A --
;With ClassificacaoFinalGrupoD (ClassificacaoFinal, PosicaoGrupoSorteio, CodigoSelecaoSorteio)
As
(
Select Row_Number() Over (Order By Pontos Desc, Vitorias Desc, Empates Desc, Derrotas Desc, GolsPro Desc, GolsContra Desc) As ClassificacaoFinal, 
           PosicaoGrupoSorteio, CodigoSelecaoSorteio
From GrupoD)
Update GrupoD
Set ClassificacaoFinalGrupo = C.ClassificacaoFinal
From GrupoD G Inner Join ClassificacaoFinalGrupoD C
                          On G.PosicaoGrupoSorteio = C.PosicaoGrupoSorteio


-- Consultando --
Select Replicate('--',ClassificacaoFinalGrupo)+'>' As 'Grupo D',
           Concat(ClassificacaoFinalGrupo,'º') As 'Classificação', 
           S.NomeSelecao As 'Seleção',  
           Pontos, Vitorias, Empates, Derrotas, GolsPro As 'Gols Pró', GolsContra As 'Gols Contra', SaldoGols As 'Saldo de Gols'
From GrupoD G Inner Join Selecoes S
                       On G.CodigoSelecaoSorteio = S.CodigoSelecao
Order By Classificação
End
Go