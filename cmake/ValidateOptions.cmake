function(ValidateOptions ValidOptions ChoiceName Choice RetVal)
	if(Choice)
		foreach(x IN LISTS Choice)
			if(NOT x IN_LIST ValidOptions)
				message(FATAL_ERROR "${ChoiceName}=\"${x}\" is not supported. Valid options are: ${ValidOptions}.")
			endif()
		endforeach()
	else()
		set(isDefault "by default.")
		set(Choice ${ValidOptions})
	endif()
	message(STATUS "Configuring ${ChoiceName}=\"${Choice}\" ${isDefault}")

	set(${RetVal} ${Choice} PARENT_SCOPE)
endfunction()
