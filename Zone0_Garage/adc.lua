

adc.force_init_mode(adc.INIT_ADC)
AD_ID = 200
AD_WARN_NUM = 0

function ad_read()
    local val = adc.read(0)
    ValUpload(AD_ID,string.format("%d",val))
    
end

function ad_warning()
    local val = adc.read(0)
    if(val > 400) then
        if(AD_WARN_NUM>0)then
            AD_WARN_NUM = AD_WARN_NUM-1
        else
            warning("杞﹀簱鍙噧姘斾綋瓒呮爣")--车库可燃气体超标
            ValUpload(AD_ID,string.format("%d",val))
            AD_WARN_NUM = 20
        end
    else 
        AD_WARN_NUM = 0
    end
end
--warning("杞﹀簱鍙噧姘斾綋瓒呮爣")--车库可燃气体超标