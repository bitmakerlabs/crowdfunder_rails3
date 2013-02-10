# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	first_name "Karl"
  	last_name "Denninger"
  	email "karl@okgrow.com"
  	password "karl.is.king"
  end
end
