application = {
    content = {
        width = 320,
        height = 480, 
        scale = "letterBox",
        fps = 30,
        
		--[[
        imageSuffix = {
		    ["@2x"] = 2,
		}
        --]]
    },
    notification = {
        google = {
            projectNumber = "3982849975315"
        },
--        iphone = {
--            types = { "badge", "sound", "alert" }
--        }
    }
    --[[
    -- Push notifications

    notification =
    {
        iphone =
        {
            types =
            {
                "badge", "sound", "alert", "newsstand"
            }
        }
    }
    --]]    
}
