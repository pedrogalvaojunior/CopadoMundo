-- Acessando --
Use Qatar2022
Go

Create Or Alter Procedure P_ClassificacaoGrupoG
As
Begin

-- Desativando a Contagem de Linhas --
Set NoCount On

-- Limpando os Dados da Tabela GrupoG --
Update GrupoG
Set Pontos = 0, Vitorias = 0, Empates=0, Derrotas=0, GolsPro=0, GolsContra=0

-- Atualizando a Tabela de Classifica��o Grupo A --
Declare @ContadorDeJogos TinyInt, 
             @CodigoSelecao1 TinyInt, @CodigoSelecao2 TinyInt, @GolsSelecao1 TinyInt, @GolsSelecao2 TinyInt

Set @ContadorDeJogos = 1

While @ContadorDeJogos <=6
 Begin
  
   Set @CodigoSelecao1 = (Select CodigoSelecao1 From Jogos Where CodigoGrupoSorteio = 7 And CodigoJogoNoGrupo = @ContadorDeJogos)
   Set @CodigoSelecao2 = (Select CodigoSelecao2 From Jogos Where CodigoGrupoSorteio = 7 And CodigoJogoNoGrupo = @ContadorDeJogos)
   Set @GolsSelecao1 = (Select GolsSelecao1 From Jogos Where CodigoGrupoSorteio = 7 And CodigoJogoNoGrupo = @ContadorDeJogos)
   Set @GolsSelecao2 = (Select GolsSelecao2 From Jogos Where CodigoGrupoSorteio = 7 And CodigoJogoNoGrupo = @ContadorDeJogos)	

   If (@GolsSelecao1 > @GolsSelecao2)
	Begin
	  
	Update GrupoG
	Set GolsPro = GolsPro + @GolsSelecao1,
	      GolsContra = GolsContra + @GolsSelecao2,
		  Pontos = Pontos+3,
		  Vitorias = Vitorias+1
	Where CodigoSelecaoSorteio = @CodigoSelecao1

	Update GrupoG
	Set GolsPro = GolsPro + @GolsSelecao2,
	      GolsContra = GolsContra + @GolsSelecao1,
		  Derrotas = Derrotas + 1
	Where CodigoSelecaoSorteio = @CodigoSelecao2
   End

	If (@GolsSelecao2 > @GolsSelecao1)
	 Begin
	  
	  Update GrupoG
	  Set GolsPro = GolsPro + @GolsSelecao2,
		    GolsContra = GolsContra + @GolsSelecao1,
		    Pontos = Pontos + 3,
		    Vitorias = Vitorias + 1
	  Where CodigoSelecaoSorteio = @CodigoSelecao2

	 Update GrupoG
	 Set GolsPro = GolsPro + @GolsSelecao1,
	       GolsContra = GolsContra + @GolsSelecao2,
	 	   Derrotas = Derrotas + 1 
	 Where CodigoSelecaoSorteio = @CodigoSelecao1
    End

	If (@GolsSelecao1 = @GolsSelecao2)
	 Begin
	  
	  Update GrupoG
	  Set GolsPro = GolsPro + @GolsSelecao1,
		    GolsContra = GolsContra + @GolsSelecao2,
		    Pontos = Pontos + 1,
			Empates = Empates + 1
	  Where CodigoSelecaoSorteio = @CodigoSelecao1

	  Update GrupoG
	  Set GolsPro = GolsPro + @GolsSelecao2,
		    GolsContra = GolsContra + @GolsSelecao1,
		    Pontos = Pontos + 1,
			Empates = Empates + 1
	  Where CodigoSelecaoSorteio = @CodigoSelecao2
     End

  Set @ContadorDeJogos = @ContadorDeJogos + 1
End

-- Atualizando a Classifica��o Final definindo a posi��o de cada Sele��o no Grupo A --
;With ClassificacaoFinalGrupoG (ClassificacaoFinal, PosicaoGrupoSorteio, CodigoSelecaoSorteio)
As
(
Select Row_Number() Over (Order By Pontos Desc, Vitorias Desc, Empates Desc, Derrotas Desc, GolsPro Desc, GolsContra Desc) As ClassificacaoFinal, 
           PosicaoGrupoSorteio, CodigoSelecaoSorteio
From GrupoG)
Update GrupoG
Set ClassificacaoFinalGrupo = C.ClassificacaoFinal
From GrupoG G Inner Join ClassificacaoFinalGrupoG C
                          On G.PosicaoGrupoSorteio = C.PosicaoGrupoSorteio

-- Consultando --
Select Replicate('--',ClassificacaoFinalGrupo)+'>' As 'Grupo G',
           Concat(ClassificacaoFinalGrupo,'�') As 'Classifica��o', 
           S.NomeSelecao As 'Sele��o',  
           Pontos, Vitorias, Empates, Derrotas, GolsPro As 'Gols Pr�', GolsContra As 'Gols Contra', SaldoGols As 'Saldo de Gols'
From GrupoG G Inner Join Selecoes S
                       On G.CodigoSelecaoSorteio = S.CodigoSelecao
Order By Classifica��o
End
Go