local launchArgs = ...

local json = require "json"

if launchArgs and launchArgs.notification then
    native.showAlert( "launchArgs", json.encode( launchArgs.notification ), { "OK" } )
end

-- notification listener
local function onNotification( event )
    if event.type == "remoteRegistration" then
        local DeviceID = event.token
        local PW_APPLICATION = "90785-AEA33"
        local PW_URL = "https://cp.pushwoosh.com/json/1.3/registerDevice"
        
        local function networkListener( event )
            if ( event.isError ) then --error occurred notify user
                native.showAlert( "Notification Registration Failed", "An Error Contacting the Server has Occurred. Please try again later from the application settings.", { "OK" } )                 
            else
                native.showAlert("Push notification ready", "You can now receive push notifications.", {"Close"});
            end
        end    
        
        local commands_json = 
        {
            ["request"] = {
                ["application"] = PW_APPLICATION,
                ["push_token"] = DeviceID,
                ["language"] = system.getPreference("ui", "language"),
                ["hwid"] = system.getInfo("deviceID"),
                ["timezone"] = 3600, -- offset in seconds
                ["device_type"] = 1
            }
        }
        
        local jsonvar = {}
        jsonvar = json.encode(commands_json)
        
        local post = jsonvar
        local headers = {}
        headers["Content-Type"] = "application/json"
        headers["Accept-Language"] = "en-US"
        local params = {}
        params.headers = headers
        params.body = post
        network.request ( PW_URL, "POST", networkListener, params )
    elseif event.type == "remote" then
        native.showAlert( "remote", json.encode( event ), { "OK" } )
    end
end

Runtime:addEventListener( "notification", onNotification )


