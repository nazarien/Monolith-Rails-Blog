require 'rails_helper'

describe User, type: :model do
  before (:each) do 
    @user = create(:user)    
  end

  it 'chack validate user' do
    expect(@user.valid?).to be_truthy
  end

  it 'user not valid without email' do
    @user.email = nil
    expect(@user.valid?).to be_falsey
  end

  it 'user not valid without password' do
    @user.password = nil
    expect(@user.valid?).to be_falsey
  end

  
end
