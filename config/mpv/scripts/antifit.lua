function fit_to_screen()
	local scale = mp.get_property("panscan")
	if tonumber(scale) > 0 then
		mp.set_property("panscan", 0)
	else
		mp.set_property("panscan", 1)
	end
end

mp.add_key_binding("ctrl+f", "antifit", fit_to_screen)
