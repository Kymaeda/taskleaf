# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string(30)       not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Task, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
