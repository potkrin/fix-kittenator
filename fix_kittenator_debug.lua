-- fix_kittenator.lua : written by hotkrin
-- fix result of Lottery Box to Kittenator

-- lotRandomSupport() is called when the lotRareResult() returned false.
-- when the lotRareResult() failed, it means the result of Lottery Box is not kittenator(AirouDrangonator/ネコ式撃龍槍)
-- then, lotRandomSupport() will be called.
-- if you want to fix the result of lotRandomSupport() you have to make an instance of SupportAction and return it.
function on_pre_lotRandomSupport(args)
    log.debug("on_pre_lotRandomSupport")
    return sdk.PreHookResult.CALL_ORIGINAL
end

function on_post_lotRandomSupport(retval)
    log.debug("on_post_lotRandomSupport:---- ")
    return retval
end

sdk.hook(sdk.find_type_definition("snow.otomo.OtomoQuestAirou"):get_method("lotRandomSupport"), 
	on_pre_lotRandomSupport,
	on_post_lotRandomSupport)


function on_pre_lotRareSupport(args)
    log.debug("on_pre_lotRareSupport")
    return sdk.PreHookResult.CALL_ORIGINAL
end

function on_post_lotRareSupport(retval)
    log.debug("on_post_lotRareSupport:---- ")
    log.debug("retval: "..tostring(retval))
    log.debug("retval: "..tostring(sdk.to_int64(retval)))
    return sdk.to_ptr(true)
end

sdk.hook(sdk.find_type_definition("snow.otomo.OtomoQuestAirou"):get_method("lotRareSupport"), 
	on_pre_lotRareSupport,
	on_post_lotRareSupport)


