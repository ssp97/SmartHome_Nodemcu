

function fuhome_callback(text)
    print("[backtrack]"..text)

    if(text=="L1-0")then
        Light_off(LIGHT_PIN_1)
    elseif(text=="L2-0")then
        Light_off(LIGHT_PIN_2)
    elseif(text=="L3-0")then
        Light_off(LIGHT_PIN_3)
    elseif(text=="L4-0")then
        Light_off(LIGHT_PIN_4)
    elseif(text=="L1-1")then
        Light_on(LIGHT_PIN_1)
    elseif(text=="L2-1")then
        Light_on(LIGHT_PIN_2)
    elseif(text=="L3-1")then
        Light_on(LIGHT_PIN_3)
    elseif(text=="L4-1")then
        Light_on(LIGHT_PIN_4)
    elseif(text=="LALL-0")then
        Light_off(LIGHT_PIN_1)
        Light_off(LIGHT_PIN_2)
        Light_off(LIGHT_PIN_3)
        Light_off(LIGHT_PIN_4)
    elseif(text=="LALL-1")then
        Light_on(LIGHT_PIN_1)
        Light_on(LIGHT_PIN_2)
        Light_on(LIGHT_PIN_3)
        Light_on(LIGHT_PIN_4)
    end
end
