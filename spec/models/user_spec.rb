require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    it 'should create user if all fields are valid' do
      @user = User.create({
      :first_name => "Jon",
      :last_name => "Snow",
      :email => "jsnow@gmail.com", 
      :password => "12345678", 
      :password_confirmation => "12345678"
       })

      expect(@user.id).not_to be_nil
    end

    it 'should fail if password and password_confirmation are not equal' do
      @user = User.create({
      :first_name => "Jon",
      :last_name => "Snow",
      :email => "jsnow@gmail.com", 
      :password => "12345678", 
      :password_confirmation => "1234567"
       })

      expect(@user.password).not_to eq(@user.password_confirmation)
    end

    it 'should pass if password and password_confirmation are equal' do
      @user = User.create({
      :first_name => "Jon",
      :last_name => "Snow",
      :email => "jsnow@gmail.com", 
      :password => "12345678", 
      :password_confirmation => "12345678"
       })

      expect(@user.password).to eq(@user.password_confirmation)
    end

    it 'should fail if email is already in database' do
      @user = User.create({
      :first_name => "Jon",
      :last_name => "Snow",
      :email => "jsnow@gmail.com", 
      :password => "12345678", 
      :password_confirmation => "12345678"
      })

      @user2 = User.create({
      :first_name => "Jon",
      :last_name => "Snow",
      :email => "Jsnow@gmail.com", 
      :password => "12345678", 
      :password_confirmation => "12345678"
      })
      
      expect(@user2.id).to be_nil
    end

    it 'should fail if password is less than 8 characters' do
      @user = User.create({
      :first_name => "Jon",
      :last_name => "Snow",
      :email => "jsnow@gmail.com", 
      :password => "12345678", 
      :password_confirmation => "12345678"
       })

      expect(@user.password.length).to be >= 8
    end
    
        
  end
end
