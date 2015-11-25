30.times do
  Bucketlist.create(name: "shopping", created_by: 2)
end
45.times do
  Bucketlist.create(name: "research", created_by: 3)
end
150.times do
  Item.create(name: "sleep", done: true, bucketlist_id: rand(1..75))
end
150.times do
  Item.create(name: "work", done: false, bucketlist_id: rand(1..75))
end
150.times do
  Item.create(name: "read", done: false, bucketlist_id: rand(1..75))
end

# Available User objects
# name: "Blessing", email: "email@gmail.com", password: "password"
# name: "Sarah", email: "myemail@go.com", password: "password"
# name: "John Snow", email: "myemail@gor.come", password: "password"
