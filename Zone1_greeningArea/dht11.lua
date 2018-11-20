

DHT11_PIN = 1
TEMP_ID   = 100
HUMI_ID   = 101

function dht11_send()
    status, temp, humi, temp_dec, humi_dec = dht.read(DHT11_PIN)
    if status == dht.OK then
        print(string.format("[DHT ]DHT Temperature:%d.%03d;Humidity:%d.%03d\r\n",
          math.floor(temp),
          temp_dec,
          math.floor(humi),
          humi_dec))

        ValUpload(TEMP_ID,string.format("%d",temp))
        ValUpload(HUMI_ID,string.format("%d",humi))
    else 
        print("[DHT ] read error")
    end
end
