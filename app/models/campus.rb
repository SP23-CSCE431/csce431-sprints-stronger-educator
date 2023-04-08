class Campus < ApplicationRecord
    self.table_name = "campuses"

    validates :name, presence: true
    validates :id, presence: true
    validates :district_id, presence: true
    
end
