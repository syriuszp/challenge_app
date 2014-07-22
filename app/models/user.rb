class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  # :recoverable, :rememberable and :trackable
  devise :database_authenticatable, :registerable, :validatable

  has_many :questions
  has_many :answers

  validates :username, :uniqueness => {:case_sensitive => false}

  attr_accessor :login


  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end


  def login=(login)
      @login = login
  end

  def login
    @login || self.username || self.email
  end

  def to_s
    email
  end
  
  def pay_for_question
    self.points -= 10
    self.save
  end
  
  def enough_for_question?
     self.points >= 10 ? true : false   
  end
  
  def earn_for_like
    self.points += 5
    self.save
  end
  
  def earn_for_accept
    self.points += 25
    self.save
  end
  
end
