Time::DATE_FORMATS[:simple] = "%B %d %Y"
Time::DATE_FORMATS[:pretty] = lambda { |time| time.strftime("%a, %b %e at %l:%M") + time.strftime("%p").downcase }
