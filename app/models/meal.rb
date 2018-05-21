class Meal < ApplicationRecord
end

# == Schema Information
#
# Table name: meals
#
#  id           :bigint(8)        not null, primary key
#  date_time    :date
#  in           :integer
#  lang         :integer
#  p_num        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  foreigner_id :bigint(8)
#
# Indexes
#
#  index_meals_on_foreigner_id  (foreigner_id)
#
