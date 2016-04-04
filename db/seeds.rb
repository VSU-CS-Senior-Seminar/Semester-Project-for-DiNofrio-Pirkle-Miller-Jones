# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   check for commit
User.delete_all
User.transaction do
@user = User.new( :name => 'CJ',
             :email => 'cjdinofrio@valdosta.edu',
             :password => 'blahblah', 
             :password_confirmation => 'blahblah',
             :zipcode => '30552',
             :role => 0)
@user.skip_confirmation!
@user.save!
@user = User.new( :name => 'Joe',
             :email => 'josepjones@valdosta.edu',
             :password => 'joseph210', 
             :password_confirmation => 'joseph210',
             :zipcode => '30552',
             :role => 0)
@user.skip_confirmation!
@user.save!
@user = User.new( :name => 'Tayler',
             :email => 'tcmiller@valdosta.edu',
             :password => 'herpderp', 
             :password_confirmation => 'herpderp',
             :zipcode => '31539',
             :role => 0)
@user.skip_confirmation!
@user.save!
@user = User.new( :name => 'Andrew',
             :email => 'acpirkle@valdosta.edu',
             :password => 'password', 
             :password_confirmation => 'password',
             :zipcode => '31539',
             :role => 0)
@user.skip_confirmation!
@user.save!
end