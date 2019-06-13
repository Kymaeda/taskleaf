# == Schema Information
#
# Table name: tasks
#
#  id           :bigint           not null, primary key
#  description  :text
#  name         :string(30)       not null
#  status_value :integer          default("notyet"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_tasks_on_user_id  (user_id)
#

class Task < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :name, length: { maximum: 30 }
  validates :status_value, presence: true

  enum status_value: {
    notyet:    0,
    ongoing:   1,
    waiting:   2,
    pending:   3,
    completed: 4,
  }

  def self.csv_attributes
    ["name", "description", "status_value", "created_at", "updated_at"]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |task|
        csv << csv_attributes.map{ |attr| task.send(attr) }
      end
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[name updated_at status_value]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
