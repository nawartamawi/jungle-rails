require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create!(first_name: 'Nwr', last_name: 'Tmwi', email: 'nawar@google.com', password: '123456', password_confirmation: '123456' )
    @user2 = User.new(first_name: 'Nwqr', last_name: 'Tmawi', email: '  nas31war@google.com', password: '123456', password_confirmation: '123456' )
  end  
  describe "Validation" do 
    it "should have a matching password" do 
      @user.password_digest = nil 
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "should have a unique email address" do
      @user2.email = @user.email
      @user2.valid?
      @user2.errors
      # expect(@user2.errors.full_messages).to include("IMPROVE ME")
      expect(@user2.errors.full_messages).to_not eql([])  # todo: improve a lot
    end


    it 'should have first name' do 
      @user.first_name = nil 
      @user.valid?
      # expect(@user.valid?).to eql(false)
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'should have last name' do 
      @user.last_name = nil 
      @user.valid? 
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'should have Email' do 
      @user.email = nil 
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")

    end
    it 'should has a password of length more than 5 letters' do 
      @user.password = '123'
      expect(@user).to_not be_valid
    end 
  end 


  describe '.authenticate_with_credentials' do 
    # it 'should has an email in db' do 
    #   @user = User.find_by_email(@user2.email)
    #   # expect(@user).not 
    # end 
    
    # it 'should has a password in db' do 

    # end

    it 'works on a valid user' do
      user = User.authenticate_with_credentials('nawar@google.com', '123456')
      expect(user).to eql(@user)
    end

    it 'fails on an invalid password' do
      user = User.authenticate_with_credentials('nawar@google.com', 'WRONG PASSWORD')
      expect(user).to eql(nil)
    end

    it 'fails on an invalid email' do
      user = User.authenticate_with_credentials('WrongEmail@google.com', '123456')
      expect(user).to eql(nil)
    end

    it  'should pass if email entered with spaces before or after' do 
      user = User.authenticate_with_credentials('nawar@google.com ', '123456')
      expect(user).to eql(@user)
    end

    it  'should pass if email entered with upper or lower' do 
      user = User.authenticate_with_credentials('nawar@googlE.com', '123456')
      expect(user).to eql(@user)
    end

  end 
end
