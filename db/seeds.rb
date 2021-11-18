# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = [{role:"doctor",email:"george@gmail.com",username:"p1",last_name:"Jones",first_name:"George",gender:"Male",
        birthday:"1972-11-17",password:'valid_password',password_confirmation: 'valid_password'},
        {role:"patient",email:"jn@gmail.com",username:"p2",last_name:"Stark",first_name:"Jonny",gender:"Male",
            birthday:"1989-02-03",password:'valid_password',password_confirmation: 'valid_password'},
        {role:"patient",email:"vd@gmail.com",username:"p3",last_name:"Doe",first_name:"Victoria",gender:"Female",
            birthday:"1962-09-23",password:'valid_password',password_confirmation: 'valid_password'}]
    

users.each do |user|
    User.create!(user)
end

Doctor.find_by(id:1).update({department:"Internal"})
Patient.create({med_record:"docs.google.com/spreadsheets/d/1y1OY7VpP1VY_O9XHssmUsA0o9UePcjSRmmKpYSEOf1c/edit?usp=sharing",user_id:2})
Patient.create({med_record:"docs.google.com/spreadsheets/d/1y1OY7VpP1VY_O9XHssmUsA0o9UePcjSRmmKpYSEOf1c/edit?usp=sharing",user_id:3})

Appointment.create({name: "appointment1",start_time:"2021-11-17 19:00:00",end_time:"2021-11-17 20:00:00",patient_id:2,doctor_id:1})
# Room.create({name: "appointment1"})
# Message.create({room_id:1, user_id:1,message:"How are you?"})
# Message.create({room_id:1, user_id:2,message:"Not well."})