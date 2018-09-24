local altura = display.actualContentHeight 
local largura = display.actualContentWidth  

local textoDoJogo = display.newText("Jogo da Velha -- IFPE", largura / 2,20, native.systemFontBold)

local linhaYUm = display.newLine(largura* 0.33, 110, largura* 0.33, altura-130)
local linhaYDois = display.newLine(largura* 0.66, 110, largura* 0.66, altura -130)
local linhaXUm = display.newLine(0, altura * 0.33 +35, largura, altura * 0.33 + 35)
local linhaXDois = display.newLine(0, altura * 0.66 - 50, largura, altura * 0.66 - 50)

local view = {{},{},{}}
local jogador = 1
local espelho = require ("model.tabuleiro")

function view:preencherView()
	local contadorY, contadorX = 0, 1
	local eixoX, eixoY = 6, 0

	for i=1,#view do
		for j=1,3 do
			contadorY = contadorY + 1
			view[i][j] = display.newRect(0,0,90,90)
			view[i][j]:setFillColor(0.2, 0.2, 0.2)
			view[i][j].idY = contadorY
			view[i][j].idX = contadorX
			view[i][j].x = 53 + eixoX
			view[i][j].y = 175 + eixoY
			view[i][j]:addEventListener("touch", adicionarJogada)
			eixoX = eixoX + 100
		end
		contadorY = 0
		contadorX = contadorX + 1
		eixoY = eixoY + 100
		eixoX = 6
	end
end

function adicionarJogada(event)
	if jogador == 1 then
		local condicao = espelho:verificaTabuleiroParaJogar(event.target.idX, event.target.idY)
		if condicao then
			atualizaEstadoTabuleiro(condicao, event.target.idX, event.target.idY, jogador)
			event.target = display.newText("X", event.target.x, event.target.y, native.systemFontBold, 80)
			if espelho:verificarJogo(jogador) then
				display.newText("GANHADOR X", largura / 2,40, native.systemFontBold)
				view:resetaTabuleiro()		
			end
			jogador = 2
		end	
	elseif jogador == 2 then
		condicao = espelho:verificaTabuleiroParaJogar(event.target.idX, event.target.idY)
		if condicao then
			atualizaEstadoTabuleiro(condicao, event.target.idX, event.target.idY, jogador)
			event.target = display.newText("O", event.target.x, event.target.y, native.systemFontBold, 80)
			if espelho:verificarJogo(jogador) then
				display.newText("GANHADOR O", largura / 2,40, native.systemFontBold)		
			end
			jogador = 1
		end	
	end
end

function atualizaEstadoTabuleiro(argCondicao, argPosicaoX, argPosicaoY, jogador)
	espelho:inserirJogadaNoTabuleiro(argCondicao, argPosicaoX, argPosicaoY, jogador)
end
 
function view:resetaTabuleiro()
	for i=1,#view do
		for j=1,#view[i] do
			view[i][j]:removeEventListener("touch", adicionarJogada)
		end
	end
end

function view:verificarJogo()
	
end

return view