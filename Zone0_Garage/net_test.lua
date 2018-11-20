
function net_img()
    local sk = net.createConnection(net.TCP, 0)
    local first = 1
    file.remove("illya.jpg")
    file.open("illya.jpg","a+")
    sk:on("receive", function(sck, c)
        if(first == 1) then 
            local _,start = string.find(c,"\r\n\r\n")
            print(start)
            c = string.sub(c,start+1,#c)
            first = 0
        end
        print(c) 
        file.write(c)
        file.flush()
    end )
    --http://www.fuhome.net/home/image/pic/2381.jpg
    sk:connect(80,"192.168.230.20")
    sk:send("GET /yd47.jpg HTTP/1.1\r\nHost: 192.168.230.20\r\nConnection: close\r\nAccept: */*\r\n\r\n")
end

function net_img_send(fileName)
    local sk = net.createConnection(net.TCP,0)
    sk:on("receive", function(sck, c)
        print(c) 
        file.write(c)
        file.flush()
    end)
    sk:connect(80,"115.28.93.201")
    --sk:connect(80,"192.168.230.20")
    local pos = 0
    local function doSend()
        file.open(fileName, 'r')
        if file.seek('set', pos) == nil then
            --sk:close()
            print('* Finished ', fileName)
        else
            local buf = file.read(1024)
            pos = pos + 1024
            print('send'..pos)
            sk:send(buf)
        end
        file.close()
    end

    sk:on('sent', doSend)
    local fileStat = file.stat(fileName)
    local fileLen = fileStat.size--+101+107+96+145+44-200
    sk:send("POST /api/photo/ HTTP/1.1\r\nContent-Type: multipart/form-data; boundary=----WebKitFormBoundaryjUVXJ3PslTEBh9as\r\nHost: fuhome.net\r\nConnection: keep-alive\r\nContent-Length: "..fileLen.."\r\nAccept: text/html\r\n\r\n")
end



function packMake(fileName,packName)
    file.remove(packName)
    local new = file.open(packName,'a+')
    local fileStat = file.stat(fileName)
    local fileLen = fileStat.size--+101+107+96+145+44-200
    
    new:write("------WebKitFormBoundaryjUVXJ3PslTEBh9as\r\nContent-Disposition: form-data; name=\"sbid\"\r\n\r\n2001370088\r\n")
    new:write("------WebKitFormBoundaryjUVXJ3PslTEBh9as\r\nContent-Disposition: form-data; name=\"sbmm\"\r\n\r\n56b74108e785b589\r\n")
    new:write("------WebKitFormBoundaryjUVXJ3PslTEBh9as\r\nContent-Disposition: form-data; name=\"feelid\"\r\n\r\n200\r\n")
    new:write("------WebKitFormBoundaryjUVXJ3PslTEBh9as\r\nContent-Disposition: form-data; name=\"uploadfile\"; filename=\"fuckZWS.jpg\"\r\nContent-Type: image/jpeg\r\n\r\n")

    local pos = 0
    local old = file.open(fileName,'r')
    while(old:seek('set', pos))do
        local buf = old:read(512)
        new:write(buf)
        print("w"..pos)
        pos = pos+512
    end
    old:close()
    new:write("\r\n------WebKitFormBoundaryjUVXJ3PslTEBh9as\r\n")
    new:close()
end

function packRead(fileName)
    local file = file.open(fileName,'r')
    print(file:readline())
    print(file:readline())
    print(file:readline())
    print(file:readline())
    print(file:readline())
    print(file:readline())
    print(file:readline())
    print(file:readline())
    print(file:readline())
    print(file:readline())
end

--packMake("illya.jpg","illya.pack")
--packRead("illya.pack")

