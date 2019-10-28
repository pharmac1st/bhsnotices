
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

UMONTH_CONV = {

	1 => "january",
	2 => "february",
	3 => "march",
	4 => "april",
	5 => "may",
	6 => "june",
	7 => "july",
	8 => "august",
	9 => "september",
	10 => "october",
	11 => "november",
	12 => "december",

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

DMIT_CONV = {

	"sunday" => "sun",
	"monday" => "mon",
	"tuesday" => "tue",
	"wednesday" => "wed",
	"thursday" => "thu",
	"friday" => "fri",
	"saturday" => "sat"

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

x = "Tuesday, 29 October"

def date_conv_reverse(string)

	date = {:day => "", :daynum => "", :month => ""}
	all = string.split(",").map {|x| x.strip}
	date[:day] = DMIT_CONV[all[0].downcase]
	date[:daynum] = all[1].split(" ")[0]
	date[:month] = all[1].split(" ")[1].downcase

	return date

end
