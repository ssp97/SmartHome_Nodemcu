LIGHT_PIN = 2
gpio.mode(LIGHT_PIN, gpio.OUTPUT)

function Light_on()
    gpio.write(LIGHT_PIN, gpio.HIGH)
end

function Light_off()
    gpio.write(LIGHT_PIN, gpio.LOW)
end