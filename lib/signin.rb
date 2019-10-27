require "json"



class Login

	def initialize(db)

		@db = File.open(db, "a+")

	end

	def all

		@db.readlines.map {|e| JSON.parse(e.chomp)}

	end

	def write(username, password)

		jhash = JSON.generate({username=>password})
		@db.puts(jhash)

	end

	def check(username, password)

		if self.all.include?({username => password})

			return true

		end
		return false
	end

end
