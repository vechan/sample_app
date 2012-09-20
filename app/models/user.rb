# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module ExampleMixin
  def self.incuded(obj)
    puts "ExampleMixin included:: obj: #{obj.inspec}"
  end

  def try_it(user)
    puts "befor_esave:: #{user.email}"
  end
  
  def mothod_missing(method_name, instance)
    puts "ExampleMixin::method_missing :: arg1: #{method_name}, args2: #{instance}
    m = /try_/.match method_name
    case m[1]
      when "that"
         puts "dispatch to some other class or method.."
    end
  end
end

class User < ActiveRecord::Base
  #include ::ExampleMixin
  
  before_save { |user| user.email = email.downcase }
  
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password
  
  validates :name,  presence: true, length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true



end
