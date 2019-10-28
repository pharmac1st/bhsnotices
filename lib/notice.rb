require_relative "date"
require 'fileutils'
require "json"


def weekend_shift(date)
	if date.sunday?
		return Time.new(date.year, date.month, date.day + 1)
	end

	if date.saturday?
		return Time.new(date.year, date.month, date.day + 2)
	end

	return Time.new(date.year, date.month, date.day)

end


class Entry

	def initialize(name, content, tsub)

		@local = {:tsub => tsub, :name => name, :content => content}

	end

	def view

		return @local

	end


end



class Month

	def initialize

		@now = weekend_shift(Time.new(Time.new.year, Time.new.month, Time.new.day))

		days = []
		31.times {|x|
			days << Time.new(@now.year, @now.month, (x + 1))
		}

		@local = days.delete_if {|x| x.saturday? || x.sunday?}
		@today = @local.index(@now)

	end

	def show(past=false)

		@displayable = @local.map {|time| [date_conv(time), time]}
		@displayable[@today][0] = @displayable[@today][0] + " (NOW)"

		if past == false
			return @displayable[@today..-1]
		end

		return @displayable

	end



	def local

		return @local

	end



end



class NoticeController

	def initialize(date, database)

		@month = MONTH_CONV[date.month].downcase; @year = date.year
		@marray = Month.new; @marray = @marray.local
		@database = database
		@date = date
		if date.sunday?
			@date = Time.new(date.year, date.month, date.day + 1)
		end
		if date.saturday?
			@date = Time.new(date.year, date.month, date.day + 2)
		end


		if File.exists?("#{@database}/#{@year}") == false
			FileUtils.mkdir("#{@database}/#{@year}")
		end

		if File.exists?("#{@database}/#{@year}/#{@month}") == false
			FileUtils.mkdir("#{@database}/#{@year}/#{@month}")
		end

		@marray.each do |day|

			day = "#{day.day}_#{SLANG_CONV[day.wday]}"
			if File.exists?("#{@database}/#{@year}/#{@month}/#{day}.json")

			else

				File.open("#{@database}/#{@year}/#{@month}/#{day}.json", "w")

			end

		end

	end

	def add_notice(date_for, name, content, tsub)

		date_for = date_conv_reverse(date_for)
		entry = Entry.new(name, content, tsub)
		entry = entry.view.to_json
		entry_date = "#{date_for[:daynum]}_#{date_for[:day]}"
		File.open("#{@database}/#{@year}/#{date_for[:month]}/#{entry_date}.json", "a") {|file|
			file.puts entry
		}

	end

	def retrieve_notices
		entry_date = "#{@date.day}_#{SLANG_CONV[@date.wday]}"
		notices = File.readlines("#{@database}/#{@date.year}/#{UMONTH_CONV[@date.month]}/#{entry_date}.json").map {|x| JSON.parse(x)}
		return notices

	end

	def date

		return @date

	end

end


def year_format(type)

	if type.is_a? Symbol
		return "All Years"
	end

	if type.is_a? Array

		if type == [9, 10]
			return "Juniors"
		end

		if type == [11, 12, 13]
			return "Seniors"
		end

		string = ""
		type.each do |year|

			string = string + " Year #{year},"

		end

		string[0] = ""; string[-1] = ""
		return string

	end

end


x = Month.new
p x.show
