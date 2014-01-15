-- main.lua
-- This is an AndroLua activity which uses a traditional layout defined
-- in XML. In this case, the `create` function does not return a view,
-- but must set the content view explicitly.
-- Note that `ctrls` is a cunning lazy table for accessing named
-- controls in the layout!

main = require 'android'.new()

local SMM = bind 'android.text.method.ScrollingMovementMethod'
local InputType = bind 'android.text.InputType'

function test(dataFromJava)
    print("got from java", dataFromJava);
end

function main.create(me)
    local a = me.a

    -- yes, it's a global!
    activity = a

    me:set_content_view 'main'
    local ctrls = me:wrap_widgets()
    local status = ctrls.statusText

    status:setText "listening on port 3333\n"
    local smm = SMM:getInstance()
    status:setMovementMethod(smm)

    ctrls.source:setText "require 'android.import'\nlocal L = luajava.package 'java.lang'\nprint(L.Math:sin(2.3))\n"

    me:on_click(ctrls.executeBtn,function()
        local src = ctrls.source:getText():toString()
        local ok,err = pcall(function()
            local res = service:evalLua(src,"tmp")
            status:append(res..'\n')
            status:append("Finished Successfully\n")
        end)
        if not ok then -- make a loonnng toast..
            me:toast(err,true)
        end
    end)

    me:on_click(ctrls.exampleBtn,function()
        me:luaActivity("example.launch")
    end)

    return true
end

return main
