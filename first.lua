require 'android.import'
import 'android.widget.*'

first = {}

function first.onCreate(me, bundle)
    first.a = me
   -- local edit,btn,txt
    edit = EditText(me)
    edit:setHint 'please?'
    btn = Button(me)
    btn:setText 'Click me'
    txt = TextView(me)
    txt:setText 'here we go\nagain'  


    local ll = LinearLayout(me)
    ll:setOrientation(LinearLayout.VERTICAL)
    ll:addView(edit)
    ll:addView(btn)
    ll:addView(txt)

    return  ll
end

return first

