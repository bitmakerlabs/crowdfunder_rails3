# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pledge do
		amount 100
		user
		project
  end
end
