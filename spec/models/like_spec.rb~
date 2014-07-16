require 'spec_helper'

describe Like do
  
   before(:each) do
     @like = build(:like)
   end
   
   it "is valid with answer and user" do
     expect(@like).to be_valid
   end
   
   it "is invalid without answer" do
     @like.answer_id = nil
     expect(@like).to have(1).errors_on(:answer_id)
   end
   
   it "is invalid without user" do
     @like.user_id = nil
     expect(@like).to have(1).errors_on(:user_id)
   end
   
   it "is removed for destroyed answer its belongs to" do
     @answer = create(:answer)
     @like.save
     #@answer.destroy
     #expect(Like.all.count).to eq 0
     expect{@answer.destroy}.to change(Like, :count).by(-1) 
   end 
   
   it "is unique for given answer per user" do
     @like.save
     @like = build(:like)
     expect(@like).to_not be_valid
   end
   
   it "is invalid for answer user is author of" do  
     @answer = create(:answer)
     @like.user_id = @answer.user_id
     @like.save
     expect(@like).to_not be_valid
   end
    
end 
