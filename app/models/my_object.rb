# == Schema Information
#
# Table name: my_objects
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class MyObject < ActiveRecord::Base
  attr_accessible :description, :name
end
