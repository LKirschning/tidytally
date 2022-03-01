# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "Destroying everything"
Room.destroy_all
Task.destroy_all
p "Database clear"
rooms_and_tasks = "kitchen
living room
dining room
toilet/bathoom
office
entrance/hallway
laundry
basement
attic

kitchen
dust
sweep floor
vacuum floor
mop floor
wipe counters
clean sink
organize and wipe cupboards
organize and wipe drawers
organize fridge
organize freezer
clean stove top
clean hood above stove
clean oven
clean trashcan
change towels
sharpen knives
clean walls
clean microwave
organize pantry
clean behind

lounge
dust
sweep floor
vacuum floor
mop floor
wipe counters and cabinets
organize and clean bookshelf
wipe electronics
clean walls
tidy up (quick)
tidy up (thorough)
(special tasks)
vacuum pillows
wash blankets
furniture (wash cover)
curtains vacuum
curtains wash
clean ceiling fan
clean fireplace
declutter/discard

bathroom
sweep floor
mop floor
disinfect floor
dust
clean toilet
clean sink
clean mirrors
change towels
change bathmat
shower clean fittings
shower wash curtains
shower clean glass
clean walls
(special tasks)
clean bathtub
clean trashcan
clean drains
clean mold

office
dust
sweep floor
vacuum floor
mop floor
clean desk/surfaces
clean walls
tidy up (quick)
tidy up (thorough)

toilet
sweep floor
mop floor
disinfect floor
dust
clean toilet
clean sink
clean mirrors
change towels
clean walls

entrance/hallway
dust
sweep floor
vacuum floor
mop floor
organize shoe rack
clean walls
(special tasks)
vaccuum stairs
clean skirting boards
clean stairwell railing
polish shoes

basement/attic
dust
sweep floor
vacuum floor
mop floor
organize storage
clean walls

laundry
dust
sweep floor
vacuum floor
mop floor
clean dryer
clean washing machine
clean sink
clean closets and cabinets
clean walls

general
clean all doors
clean all doorknobs
remove cobwebs
sanitize light switches
clean/dust all lights
water plants
collect trash
test smoke detectors
dust blinds

garage
sweep floors
mop floors
organize tools
wash car
clean inside car
tidy up
declutter storage

garden
weed garden
water garden
trim bushes
trim hedges
rake leaves
mow lawn
(special)
clean up BBQ
fertilize lawn
prune plants and trees
rotate compost

house (outside)
wash windows
shake doormats
sweep driveway and paths
clean gutters
clean trashcans and recycle bins
(special tasks)
check airconditioner
broom pool
empty pool filter
scrub pool tiles
"
hash = {}
rooms_and_tasks.split("\n\n").each do |paragraph|
  hash[paragraph.split("\n")[0]] = paragraph.split("\n")[1..]
  end


household = Household.create(name: "Test")
user = User.create(email: "test@test.de", password: "123456")


hash.keys.each do |room|
  room_instance = Room.create(name: room, household: household)
  p "room created: #{room}"
  hash[room].each do |task|
    task_instance = Task.new(name: task, room: room_instance, user: user)
    task_instance.save!
    p "task created: #{task}"
  end
end
