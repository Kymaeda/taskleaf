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

FactoryBot.define do
  factory :task do
    name { 'テスト' }
    description { 'これはRspecとFactoryBotのテストです。' }
    status_value { 0 }
    user
  end
end
