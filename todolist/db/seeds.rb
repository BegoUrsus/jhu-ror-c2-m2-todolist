# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
#Profile.destroy_all
#TodoList.destroy_all
#TodoItem.destroy_all

oneYearFromNow = Date.today + 1.year;

Profile.create! [
  { first_name: "Carly",   last_name: "Fiorina", birth_year: 1954, gender: "female" },
  { first_name: "Donald",  last_name: "Trump",   birth_year: 1946, gender: "male" },
  { first_name: "Ben",     last_name: "Carson",  birth_year: 1951, gender: "male" },
  { first_name: "Hillary", last_name: "Clinton", birth_year: 1947, gender: "female" }
]

Profile.all.each do |profile| 
	user = profile.create_user!( username: profile.last_name, password_digest: profile.birth_year )
	user_list = user.todo_lists.create!( list_name: "List of #{user.username}", list_due_date: oneYearFromNow)
	user_list.todo_items.create! [
		{ title: "Task 1", due_date: oneYearFromNow, description: "Fist task",   completed: false },
	    { title: "Task 2", due_date: oneYearFromNow, description: "Second task", completed: false },
	    { title: "Task 3", due_date: oneYearFromNow, description: "Third task",  completed: false },
	    { title: "Task 4", due_date: oneYearFromNow, description: "Fourth task", completed: false },
	    { title: "Task 5", due_date: oneYearFromNow, description: "Fifth task",  completed: false }  
	 ]
end

