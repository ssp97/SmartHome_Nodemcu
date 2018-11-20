LASER_OUT_PIN = 5
LASER_IN_PIN = 4
gpio.mode(LASER_OUT_PIN, gpio.OUTPUT)
gpio.mode(LASER_IN_PIN, gpio.INPUT)
LASER_NUM=0
LASER_OLD_STATUS = 0

LASER_ID = 500

function Laser_do()
    gpio.write(LASER_OUT_PIN,gpio.HIGH)
    tmr.delay(3000)
    local now_status = gpio.read(LASER_IN_PIN)
    gpio.write(LASER_OUT_PIN,gpio.LOW)

    if(LASER_OLD_STATUS~=now_status)then
        --print("上传数据"..now_status)
        ValUpload(LASER_ID,string.format("%d",now_status))
    end
    LASER_OLD_STATUS = now_status

end



