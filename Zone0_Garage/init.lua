DEBUG = true
timerTackTock = 0
dofile("wifi.lua")

function timedTask()
    local heartBeatTime = 20
    local dht11_send_time = 300
    timerTackTock = timerTackTock+1
    
    if(timerTackTock%heartBeatTime==0)then
        heartBeat()
    end

    if(timerTackTock%dht11_send_time==0)then
        dht11_send()
        ad_read()
    end

    ledTrg(SYS_LED_PIN)
    Laser_do()
    ad_warning()
    
    timerTackTock = timerTackTock %(heartBeatTime*dht11_send_time)
    
end

function init_continue() 

    dofile("led.lua")
    dofile("fuhomeCallback.lua")
    dofile("fuhome.lua")
    dofile("dht11.lua")
    dofile("light.lua")
    dofile("laser.lua")
    dofile("adc.lua")
    heartBeat()
    
    timer = tmr.create()
    timer:register( 1000, tmr.ALARM_AUTO,timedTask ) 
    timer:start()

end

function uinit()
    timer:unregister()
    timer:stop()
end
