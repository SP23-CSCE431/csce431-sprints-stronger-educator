class District < ApplicationRecord
    self.table_name = "districts"

    validates :name, presence: true
    validates :district_id, presence: true
end
