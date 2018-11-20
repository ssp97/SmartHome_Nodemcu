

function fuhome_callback(text)
    print("[backtrack]"..text)

    if(text=="LIGHT0")then
        Light_off()
    elseif(text=="LIGHT1")then
        Light_on()
    end
end
