

adc.force_init_mode(adc.INIT_ADC)
GP2Y10_OUT_PIN = 7
AD_ID = 200
AD_WARN_NUM = 0

gpio.mode(GP2Y10_OUT_PIN, gpio.OUTPUT)
gpio.write(GP2Y10_OUT_PIN, gpio.HIGH)
function GP2Y10_read()
    gpio.write(GP2Y10_OUT_PIN, gpio.LOW)
    tmr.delay(180)
    local val = adc.read(0)
    tmr.delay(40)
    gpio.write(GP2Y10_OUT_PIN, gpio.HIGH)

    local pm = 0.17*val/1024*5*1000-2; 

    --print(pm)
    
    ValUpload(AD_ID,string.format("%f",pm))
    
end


--warning("杞﹀簱鍙噧姘斾綋瓒呮爣")--车库可燃气体超标

