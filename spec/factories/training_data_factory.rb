FactoryGirl.define do
  factory :training_datum do
    name "..."
    description "..."
    input [0.1,0.2,0.3]
    output 0.2
    admin false
  end

  ## This will use the User class (Admin would have been guessed)
  #factory :admin, class: User do
  #  first_name "Admin"
  #  last_name  "User"
  #  admin      true
  #end
end
