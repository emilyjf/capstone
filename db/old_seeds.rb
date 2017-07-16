user1 = User.create!(
  {name: "Emily Flanagan", email: "emily@gmail.com", password: "password", password_confirmation: "password"})
user2 = User.create!(
  {name: "Tash David", email: "tash@gmail.com", password: "password", password_confirmation: "password"})

admin = User.create!(
  {name: "Admin", email: "admin@gmail.com", password: "password", password_confirmation: "password"})

poll1 = Poll.create!(
  {admin_id: admin.id, title: "Capstone Presentation", status: "Open", invitee: "Emily Flanagan", location: "215 W. Ohio Street, Chicago, IL"})
poll2 = Poll.create!(
  {admin_id: admin.id, title: "Birthday", status: "Open", invitee: "Tash David", location: "restaurant"})

appt1 = Appt.create!(
  {scheduled_slot: "7 p.m., Friday, July 20, 2017", poll_id: poll1.id})
appt2 = Appt.create!(
  {scheduled_slot: "8 p.m., Friday, July 20, 2017", poll_id: poll2.id})

Response.create!([
  {user_id: user1.id, appt_id: appt1.id},
  {user_id: user2.id, appt_id: appt2.id}
  ])

Userpoll.create!([
  {user_id: user1.id, poll_id: poll1.id},
  {user_id: user2.id, poll_id: poll2.id}
  ])
