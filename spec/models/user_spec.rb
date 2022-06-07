require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do 

    it 'should save a user when created with first_name, last_name, password longer than 3-char and email given' do
      @user = User.create(
        first_name: "Tester",
        last_name: "Doe",
        email: "test@test.com",
        password: "test123",
        password_confirmation: "test123"
      )
      expect(@user).to be_valid
    end

    it 'should not save a user when passwords do not match' do
      @user = User.create(
        first_name: "Tester",
        last_name: "Doe",
        email: "test@test.com",
        password: "test123",
        password_confirmation: "test12"
      )
      expect(@user).to_not be_valid
    end

    it 'should not save a user when password field empty' do
      @user = User.create(
        first_name: "Tester",
        last_name: "Doe",
        email: "test@test.com",
        password: nil,
        password_confirmation: "test12"
      )
      expect(@user).to_not be_valid
    end

    it 'should not save a user when password conf field empty' do
      @user = User.create(
        first_name: "Tester",
        last_name: "Doe",
        email: "test@test.com",
        password: "test123",
        password_confirmation: nil
      )
      expect(@user).to_not be_valid
    end

    it 'should not save a user when first_name field empty' do
      @user = User.create(
        first_name: nil,
        last_name: "Doe",
        email: "test@test.com",
        password: "test123",
        password_confirmation: "test123"
      )
      expect(@user).to_not be_valid
    end

    it 'should not save a user when last_name field empty' do
      @user = User.create(
        first_name: "Tester",
        last_name: nil,
        email: "test@test.com",
        password: "test123",
        password_confirmation: "test123"
      )
      expect(@user).to_not be_valid
    end

    it 'should not save a user when email field empty' do
      @user = User.create(
        first_name: "Tester",
        last_name: "Doe",
        email: nil,
        password: "test123",
        password_confirmation: "test123"
      )
      expect(@user).to_not be_valid
    end

    it 'should not save a user when password less than 3 chars' do
      @user = User.create(
        first_name: "Tester",
        last_name: "Doe",
        email: "test@test.com",
        password: "a1",
        password_confirmation: "a1"
      )
      expect(@user).to_not be_valid
    end

    it 'should not save a user if email already used' do
      @user1 = User.create(
        first_name: "Tester",
        last_name: "Doe",
        email: "test@test.com",
        password: "test123",
        password_confirmation: "test123"
      )
      @user2 = User.create(
        first_name: "Tester",
        last_name: "Doe",
        email: "test@test.com",
        password: "test123",
        password_confirmation: "test123"
      )
      expect(@user2).to_not be_valid
    end


  end
  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'should authenticate if user exists' do
      @user = User.create(
        first_name: "Tester",
        last_name: "Doe",
        email: "test123@test.com",
        password: "test123",
        password_confirmation: "test123"
      )

      auth = User.authenticate_with_credentials("test123@test.com", "test123")

      expect(auth.errors.full_messages).to be_empty
    end

    it 'should not authenticate if user doesnt exist' do
      @user = User.create(
        first_name: "Tester",
        last_name: "Doe",
        email: "test123@test.com",
        password: "test123",
        password_confirmation: "test123"
      )

      auth = User.authenticate_with_credentials("test1234@test.com", "test123")

      expect(auth).to be_nil
    end

    it 'should authenticate if user exists' do
      @user = User.create(
        first_name: "Tester",
        last_name: "Doe",
        email: "test123@test.com",
        password: "test123",
        password_confirmation: "test123"
      )

      auth = User.authenticate_with_credentials("TEST123@test.com", "test123")

      expect(auth.errors.full_messages).to be_empty
    end

  end

end
