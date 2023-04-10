class DataImport < ApplicationRecord
    self.table_name = "data_imports"
    has_many_attached :images
end
