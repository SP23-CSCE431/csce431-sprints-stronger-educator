class District < ApplicationRecord
  self.table_name = "districts"

  validates :name, presence: true
  validates :id, presence: true
end
