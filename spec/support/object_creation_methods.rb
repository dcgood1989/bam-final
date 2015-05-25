def create_magazine(options ={})
	defaults = {
		title: "Field and Stream",
		edition: 10,
		issue: Date.today,
		language: "English"
	}

	Magazine.create!(defaults.merge(options))
end
