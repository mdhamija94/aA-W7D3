# == Schema Information
#
# Table name: goals
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  details    :text
#  private    :boolean          default(FALSE), not null
#  completed  :boolean          default(FALSE), not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Goal < ApplicationRecord
  validates :title, :user_id, presence: true
  validates :title, uniqueness: { scope: :user_id }
  after_initialize :set_defaults

  def set_defaults
    self.private = false
    self.completed = false
  end

  belongs_to :user,
    foreign_key: :user_id,
    class_name: 'User'
end
