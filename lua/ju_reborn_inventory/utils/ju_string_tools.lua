
-- 'test', 3 -> 's'
function string.charByIndex(str, i)
    
    return string.sub(str, i, i)
    
end

-- random_words -> RandomWords
function string.toCamelCase(str)
    
    local strs = string.Split(str, '_')

    str = ''

    for k, v in ipairs(strs) do
        
        local word = strs[k]
        word = string.upper(string.charByIndex(word, 1)) .. string.sub(word, 2)

        str = str .. word
        
    end

    return str

end
