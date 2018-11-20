SYS_LED_PIN = 0
gpio.mode(SYS_LED_PIN, gpio.OUTPUT)

function ledTrg(id)
    local i = gpio.read(id)
    if (i == 0) then
        gpio.write(id, gpio.HIGH)
    else
        gpio.write(id, gpio.LOW)
    end
end
