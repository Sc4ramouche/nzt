local Module = {}

function Module.newZettel(name)
    local timestamp = os.date("%Y%m%d%H%M")
    local fileName = timestamp .. "-" .. name .. ".md"

    print("Creating new file ~/zettelkasten/" .. fileName)
    local file, err = io.open((os.getenv("HOME") .. "/zettelkasten/" .. fileName), "w")

    if file == nil then
        print("Couldn't open file: ", err)
    else
        file:write("# " .. name)
        file:close()
        print("Successfully created new zettel!")
    end
end

return Module
