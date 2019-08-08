require 'rails_helper'

RSpec.describe Goal, type: :model do
  # debugger
  # user = User.create!(username: 'mimi', password: '123456')
  goal = Goal.create!(title: 'new goal 3', details: 'hope I can do it', user_id: User.first.id )
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user_id) }
  it { should validate_uniqueness_of(:title).scoped_to(:user_id) }
  
  describe '#set_defaults' do
    it 'should set private and completed to false by default' do
      goal = Goal.create!(title: 'new goal 2', details: 'hope I can do it', user_id: User.first.id )
      expect(goal.private).to be(false)
      expect(goal.completed).to be(false)
    end
  end
end
