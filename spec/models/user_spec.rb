require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should create a user if all fields are valid' do
      @user = User.create({
        :first_name => "Jon",
        :last_name => "Snow",
        :email => "jsnow@gmail.com", 
        :password => "12345678", 
        :password_confirmation => "12345678"
       })

      expect(@user.errors.full_messages.length).to be 0

    end

    it 'should produce an error if password and password_confirmation are not equal' do
      @user = User.create({
        :first_name => "Jon",
        :last_name => "Snow",
        :email => "jsnow@gmail.com", 
        :password => "12345678", 
        :password_confirmation => "1234567"
      })

      expect(@user.errors.full_messages.length).to be > 0

    end

    it 'should produce an error if email, ignoring case, is already in database' do
      @user = User.create({
        :first_name => "Jon",
        :last_name => "Snow",
        :email => "jsnow@gmail.com", 
        :password => "12345678", 
        :password_confirmation => "12345678"
      })

      @user_two = User.create({
      :first_name => "Jon",
      :last_name => "Snow",
      :email => "Jsnow@gmail.com", 
      :password => "12345678", 
      :password_confirmation => "12345678"
      })
      
      expect(@user_two.errors.full_messages.length).to be > 0

    end

    it 'should produce an error if password is less than 8 characters' do
      @user = User.create({
        :first_name => "Jon",
        :last_name => "Snow",
        :email => "jsnow@gmail.com", 
        :password => "1234567", 
        :password_confirmation => "1234567"
      })

      expect(@user.errors.full_messages.length).to be > 0

    end
    
        
  end

  describe '.authenticate_with_credentials' do

    it 'should return a user instance if provided valid credentials' do

      @user = User.create({
        :first_name => "Jon",
        :last_name => "Snow",
        :email => "jsnow@gmail.com", 
        :password => "12345678", 
        :password_confirmation => "12345678"
      })

      user_instance = User.authenticate_with_credentials('jsnow@gmail.com', '12345678')
      expect(user_instance).not_to be_nil

    end

    it 'should return nil if provided invalid credentials' do

      @user = User.create({
        :first_name => "Jon",
        :last_name => "Snow",
        :email => "jsnow@gmail.com", 
        :password => "12345678", 
        :password_confirmation => "12345678"
      })

      user_instance = User.authenticate_with_credentials('jsnow@gmail.com', 'wrong_password')
      expect(user_instance).to be_nil

    end

    it 'should return a user instance if provided email with padding and correct password' do

      @user = User.create({
        :first_name => "Jon",
        :last_name => "Snow",
        :email => "jsnow@gmail.com", 
        :password => "12345678", 
        :password_confirmation => "12345678"
      })

      authenticated = User.authenticate_with_credentials('  jsnow@gmail.com  ', '12345678')
      expect(authenticated).not_to be_nil

    end

    it 'should return a user instance if provided email with different case and correct password' do

      @user = User.create({
        :first_name => "Jon",
        :last_name => "Snow",
        :email => "jsnow@gmail.com", 
        :password => "12345678", 
        :password_confirmation => "12345678"
      })

      authenticated = User.authenticate_with_credentials('JSNOW@GMAIL.COM', '12345678')
      expect(authenticated).not_to be_nil
    end
  end
end
