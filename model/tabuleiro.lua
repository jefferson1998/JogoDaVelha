local tabuleiro = {
	{0,0,0},
	{0,0,0},
	{0,0,0}
}


function tabuleiro:verificaTabuleiroParaJogar(x,y)
	local argCondicao = true
	
	if tabuleiro[x][y] ~= 0 then
		argCondicao = false
	end

	return argCondicao
end


function tabuleiro:inserirJogadaNoTabuleiro(argCondicao, x, y, vez)
	if argCondicao ~= true then
		print("Não é possível inserir aqui!")
	else
		tabuleiro[x][y] = vez
	end
end

function tabuleiro:verificarJogo(vez)
	if tabuleiro[1][1] == vez  and tabuleiro[1][2] == vez and tabuleiro[1][3] == vez then
		return true
	end

	if tabuleiro[1][1] == vez  and tabuleiro[2][1] == vez and tabuleiro[3][1] == vez then
		return true
	end

	if tabuleiro[1][1] == vez  and tabuleiro[2][2] == vez and tabuleiro[3][3] == vez then
		return true
	end

	if tabuleiro[1][3] == vez  and tabuleiro[2][2] == vez and tabuleiro[3][1] == vez then
		return true
	end

	if tabuleiro[2][1] == vez  and tabuleiro[2][2] == vez and tabuleiro[2][3] == vez then
		return true
	end

	if tabuleiro[3][1] == vez  and tabuleiro[3][2] == vez and tabuleiro[3][3] == vez then
		return true
	end

	if tabuleiro[1][3] == vez  and tabuleiro[2][3] == vez and tabuleiro[3][3] == vez then
		return true
	end

	if tabuleiro[1][2] == vez  and tabuleiro[2][2] == vez and tabuleiro[3][2] == vez then
		return true
	end

	return false
end

function tabuleiro:mostrarTabuleiro()
	local srtTabuleiro = ""

	for i=1,#tabuleiro do
		for j=1,#tabuleiro[i] do
			srtTabuleiro = srtTabuleiro .. tabuleiro[i][j] .. ""
		end
		srtTabuleiro = srtTabuleiro .. "\n"
	end
	return srtTabuleiro
end



return tabuleiro