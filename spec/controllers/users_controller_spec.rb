require 'rails_helper'

RSpec.describe UsersController , type: :controller do
  
  it 'create_bad_user' do
    post :create,
    params: {user: {'username' => '', 'password' => ''}}
    expect(JSON.parse(response.body)).to eql({
      "error" => "Password can't be blank, Email can't be blank, and Email is invalid"
    })
  end

  it 'create_good_user' do
    post :create,
    params: {user: {'username' => 'SpongeBob', 'password' => '12341234'}}
    expect(JSON.parse(response.body)).to eql({
      "error" => "Email can't be blank and Email is invalid"
    })
  end
end
