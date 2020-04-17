class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  
  has_one :employee
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable, :timeoutable

  validate :password_complexity
  validates :firstName, format: { with: /\A[A-Za-z0-9-\/\.\s]*\z/,
    message: "accepts only alphanumeric - . space" }
  validates :lastName, format: { with: /\A[A-Za-z0-9-\/\.\s]*\z/,
    message: "accepts only alphanumeric - . space" }
  validates :job_title, format: { with: /\A[A-Za-z0-9-\/\.\s]*\z/,
    message: "accepts only alphanumeric - . space" }
  validates :phoneNumber, numericality: { only_integer: true ,
    message: "accepts only digits" }
  def is_employee(email)
 
    @all_Employees = Employee.all

    @all_Employees.each do |employee| 

      if email == employee.email
 
      return true
      
      end
    end
    return false
    
  end

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/

    errors.add :password, 'Complexity requirement not met. Please use: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end


  #  @employee.each do |employee| 

  #   if current_user.id == employee.if 

  #   return true

    
end

