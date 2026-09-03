--[[
Given an array of strings strs, group the strings that are anagrams of each other. Two strings are anagrams when one can be formed by rearranging the letters of the other (using all original letters exactly once).

Return a list of groups. The order of the groups and the order of strings within a group do not matter.
]]--

local function sort_string(str) -- sorts the string, making them matchable
    local chars = {}
    for i = 1, #str do
        chars[i] = str:sub(i, i)
    end
    table.sort(chars)
    return table.concat(chars) -- returns the table as a string
end

local function group_anagrams(words) -- 
    local groups = {}

    for _, word in ipairs(words) do -- grab every word, then sort their characters to be matched
        local sorted = sort_string(word)

    
        if not groups[sorted] then -- 2d array wow
            groups[sorted] = {}
        end

        -- if the group already exists (already) go add it
        table.insert(groups[sorted], word)
    end

    local result = {} -- then afterwards, compile the anagrammed words and then return!

    for _, group in pairs(groups) do
        table.insert(result, group)
    end

    return result
end

return group_anagrams({"eat", "tea", "tan", "ate", "nat", "bat"})
--[[
expected result

{{"bat"}, {"nat", "tan"}, {"ate", "eat", "tea"}}
]]