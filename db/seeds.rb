User.destroy_all

5.times do
    User.create(
        name: Faker::Name.first_name
    )
end

puts "Users seeded"

Category.destroy_all

category_names = ["Deep Work", "Shallow Work", "Chores", "Learning", "Mind Care", "Body Care", "People", "Next Week"]

category_names.each do |category_name|
    Category.create(
        name: category_name
    )
end

puts "Categories seeded"

Task.destroy_all

descriptions = ["Mow the lawn", "Walk the dog", "Finish homework", "Start coding project", "Work out for 30 min", "Go grocery shopping"]
users = User.all
categories = Category.all

10.times do
    Task.create(
        description: descriptions.sample,
        user: users.sample,
        category: categories.sample,
        important: false
    )
end

puts "Tasks seeded"
puts "Seeding complete"