prepend Actions
require_relative "../lib/signin"
require_relative "../lib/notice"
login = Login.new("db/pretend.json")


on "userlogin" do |request|

	if login.check(request.params["usr"], request.params["pws"]) == true
		request.session[:loggedin] = true
		redirect! "teacher/review"
	else
		request.session[:failed] = true
		redirect! "index"
	end
end


on "teacher/*" do |request|

	if request.session[:loggedin] == false or request.session[:loggedin] == nil
		redirect! "../login"
	end

end

on "teacher/edit" do |request|


	if request.params["editname"] != nil
		request.session[:nname] = request.params["editname"]
	end

	if request.params["comment"] != nil
		request.session[:ncontent] = request.params["comment"]
	end

	p request.params["allyears"]
	if request.params["allyears"] == "on"
		request.session[:nyears] = "All Years"
		p "first if"
	else
		year = []
		(9..13).each do |num|
			year << num if request.params["year#{num}"] != nil
		end
		p "year: #{year}"
		if year.empty?
			request.session[:nyears] = "All Years"
		else
			request.session[:nyears] = year_format(year)
		end
	end

	puts "this: #{request.session[:nyears]}"
	redirect! "review"
end

on "teacher/edityrs" do |request|
	if request.params["allyears"] == "on"
		request.session[:nyears] = "All Years"
		p "first if"
	else
		year = []
		(9..13).each do |num|
			year << num if request.params["year#{num}"] != nil
		end
		p "year: #{year}"
		if year.empty?
			request.session[:nyears] = "All Years"
		else
			request.session[:nyears] = year_format(year)
		end
	end
	redirect! "review"

end
