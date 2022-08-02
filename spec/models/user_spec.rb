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

    it 'should produce an error if email is already in database' do
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
      
      expect(@user2.errors.full_messages.length).to be > 0

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
end
