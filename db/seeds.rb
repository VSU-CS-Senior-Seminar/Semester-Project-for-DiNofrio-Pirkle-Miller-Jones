# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   check for commit
Post.delete_all
Post.create!(category: 'Lost & Found', title: 'Found dog',
            content: %{  I found a Irish Terrier in my yard this morning. if it's yours please
                        come and claim him. Please don't take forever in coming. He is becoming a hassle.}, 
            likes: 0)
            
            
Post.create!(category: 'Jobs', title: 'Babysitter needed',
            content: %{ My wife and I are going to a work related banquet and need a babysitter. 
                        DM us here for more information. We will also discuss payment. }, likes: 0)
            
    
Post.create!(category: 'Misc', title: 'BBQ party: Neighborhood invite',
            content: %{ My family is having a BBQ and would like to invite the neighborhood to join us. 
                        DM us if you are planning to come so we accomodate }, likes: 0)