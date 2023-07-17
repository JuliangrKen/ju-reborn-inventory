
local draw = draw

function draw.LineRect(sx, sy, ex, ey, color)

    ex, ey =  ex- 1, ey - 1 -- чтобы влезли линии слева и снизу
    
    surface.SetDrawColor(color)
    draw.NoTexture()

    surface.DrawLine(sx, sy, sx, ey)
    surface.DrawLine(sx, sy, ex, sy)
    surface.DrawLine(ex, ey, sx, ey)
    surface.DrawLine(ex, ey, ex, sy)

end
