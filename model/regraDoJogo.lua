
local eixoX, eixoY = 0, 100
for i=1,#tabuleiro do
	for j=1,3 do
		tabuleiro[i][j] = display.newRect(0,0,90,90)
		tabuleiro[i][j]:setFillColor(0.2, 0.2, 0.2)
		tabuleiro[i][j].x = 53 + eixoX
		tabuleiro[i][j].y = 175
			if j == 3 then
				tabuleiro[i][j].y = 175 + eixoY
			else
				tabuleiro[i][j].x = 53 + eixoX
			end
		tabuleiro[i][j].moverTexto = display.newText("", tabuleiro[i][j].x, tabuleiro[i][j].y, native.systemFontBold, 80)
		tabuleiro[i][j].moveTipo = nil
		tabuleiro[i][j]:addEventListener( "touch", adicionarJogada )
		
	end
	eixoY = eixoY + 100
	eixoX = 0
	
end


local function adicionarJogada(event)
	if event.phase == "began" then
		if event.target.moveTipo == nil then
			if player == "X" then
				event.target.posicionarJogada.text = player
				event.target.moveTipo = player
				print(event.target)
				player = "O"
			else
				event.target.posicionarJogada.text = player
				event.target.moveTipo = player
				player = "X"
			end
		end
	end
	return true
end

local  function verificaJogo(event)
	if event.phase == "began" then
		if event.target.moveTipo == nil then
			if player == "X" then
				event.target.posicionarJogada.text = player
				event.target.moveTipo = player
				
				player = "O"
			else
				event.target.posicionarJogada.text = player
				event.target.moveTipo = player
				player = "X"
			end
		end
	end
	return true
end 
