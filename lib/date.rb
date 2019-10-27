
MONTH_CONV = {

	1 => "January",
	2 => "February",
	3 => "March",
	4 => "April",
	5 => "May",
	6 => "June",
	7 => "July",
	8 => "August",
	9 => "September",
	10 => "October",
	11 => "November",
	12 => "December",

}

DAY_CONV = {

	0 => "Sunday",
	1 => "Monday",
	2 => "Tuesday",
	3 => "Wednesday",
	4 => "Thursday",
	5 => "Friday",
	6 => "Saturday"

}

SLANG_CONV = {

	0 => "sun",
	1 => "mon",
	2 => "tue",
	3 => "wed",
	4 => "thu",
	5 => "fri",
	6 => "sat"

}

def date_today
	today = Time.new

	hash = {:nd => DAY_CONV[today.wday], :d => today.day, :m => MONTH_CONV[today.month], :y => today.year}
	return "#{hash[:nd]}, #{hash[:d]} #{hash[:m]} #{hash[:y]}"

end


def date_conv(time)

	hash = {:nd => DAY_CONV[time.wday], :d => time.day, :m => MONTH_CONV[time.month], :y => time.year}
	return "#{hash[:nd]}, #{hash[:d]} #{hash[:m]}"

end
