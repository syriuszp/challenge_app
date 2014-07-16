FactoryGirl.define do
  factory :answer do
    contents "Best answer ever"
    question
    user
    accepted false
  end
end
