class Ticket < ApplicationRecord
  belongs_to :stage
  acts_as_list scope: :stage
end