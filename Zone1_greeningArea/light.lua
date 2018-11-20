LIGHT_PIN_1 = 2
LIGHT_PIN_2 = 3
LIGHT_PIN_3 = 5
LIGHT_PIN_4 = 6
gpio.mode(LIGHT_PIN_1, gpio.OUTPUT)
gpio.mode(LIGHT_PIN_2, gpio.OUTPUT)
gpio.mode(LIGHT_PIN_3, gpio.OUTPUT)
gpio.mode(LIGHT_PIN_4, gpio.OUTPUT)
function Light_on(id)
    gpio.write(id, gpio.HIGH)
end

function Light_off(id)
    gpio.write(id, gpio.LOW)
end
