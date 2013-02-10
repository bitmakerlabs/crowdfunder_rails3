# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
  	user
  	title "Wifi-enabled lamps!"
  	teaser "How have we been able to survive without these?"
  	description "Lorem ipsum... "
  	goal 12000
  end
end
