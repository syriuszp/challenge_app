class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  # :recoverable, :rememberable and :trackable
  devise :database_authenticatable, :registerable, :validatable
  devise :omniauthable, :omniauth_providers => [:github]

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :mini => "35x35>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  has_many :questions
  has_many :answers

  validates :username, :uniqueness => {:case_sensitive => false}

  attr_accessor :login

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name   # assuming the user model has a name
      user.avatar = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

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
