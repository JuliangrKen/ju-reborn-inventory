local cfg = ju.reborn_inventory.cfg

if SERVER then
    
    

else

    -- [common]

    cfg.inventory_cell_blue = fromHex '#88EECC'
    cfg.inventory_cell_dark_blue = fromHex '#0C3750'
    cfg.inventory_cell_orange = fromHex '#FF7A00'
    cfg.inventory_cell_white = fromHex '#FFFFFF'
    cfg.inventory_cell_light_grey = fromHex '#CECECE'
    cfg.inventory_cell_dark_grey fromHex '#040404'

    -- [c-menu] 
    
    cfg.inventory_cell_c_size = 140
    cfg.inventory_cell_c_strokeSize = 1

    cfg.inventory_cell_stripes_interval = 3
    cfg.inventory_cell_num_stripes = 10

    -- [backpack menu]

    cfg.inventory_cell_b_size = 88
    cfg.inventory_backpack_w_view = 6
    cfg.inventory_backpack_h_view = 5

    cfg.inventory_backpack_title_1 = 'Ваш инвентарь'
    cfg.inventory_backpack_title_2 = 'ВАШ РЮКЗАК'

    cfg.inventory_backpack_equip = 'Экипировать'
    cfg.inventory_backpack_throw = 'Выбросить'
    cfg.inventory_backpack_divide = 'Разделить'

    cfg.inventory_backpack_kilogram = 'кг'

end
