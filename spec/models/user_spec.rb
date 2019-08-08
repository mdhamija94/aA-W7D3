# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(username: 'mimi', password: '123456') }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:session_token) }
  
  describe '::find_by_credentials' do
    subject(:toby) {
      User.create!(
        username: 'toby2',
        password: '123456'
      )
    }

    it 'should not raise an error' do
      expect{User.find_by_credentials('toby', '123456')}.to_not raise_error
    end

    it 'should return nil when no user is found or password is wrong' do
      expect(User.find_by_credentials('toby', '')).to eq(nil) 
    end
  end

end
