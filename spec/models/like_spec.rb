require 'spec_helper'

describe Like do
  
   before {@like = FactoryGirl.create(:like)}  
   subject {@like}   
   
   it do
     expect(@like).to respond_to(:answer_id)
   end
     
   it do
     #when subject defined we can use should matcher instead of expect syntax
     should respond_to(:user_id)
   end  
   
   it "validates answer_id presence" do
     @like.answer_id = ''
     #expect(@like).to_not be_valid
     should_not be_valid
   end
   
   it "validates user_id presence" do
     @like.user_id = ''
     expect(@like).to_not be_valid
     #should_not be_valid
   end
   
   it "delete likes if answer destroyed" do
     @answer = FactoryGirl.create(:answer, id: 10)
     @likeanswer = FactoryGirl.create(:like,answer_id: @answer.id)
     @answer.destroy
     expect(Like.where(:answer_id => @answer.id).count).to eq 0   
   end 
   
   it "only one like can be created for given answer and user" do
     @like2 = FactoryGirl.build(:like)
     expect(@like2).to_not be_valid
   end
   
   it "can not like my own answer" do
     pending "TBD"
   end
    
end
