class Stage < ApplicationRecord
  has_many :tickets
  
  belongs_to :project

  acts_as_list scope: :project
end