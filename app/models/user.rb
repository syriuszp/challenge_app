class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  # :recoverable, :rememberable and :trackable
  devise :database_authenticatable, :registerable, :validatable

  has_many :questions
  has_many :answers

  def to_s
    email
  end
  
  def pay_for_question
    #logger.debug "Pprawne wywolanie dla uzytwkownika #{self}"
    self.points -= 10
    self.save
  end
  
  def enough_for_question?
     self.points >= 10 ? true : false   
  end
  
  def earn_for_like
    puts "P3000 :#{self.points.inspect}"
    self.points += 5
    puts "P4000 :#{self.points.inspect}"
    self.save
    puts "P5000 :#{self.points.inspect}"
  end
end
