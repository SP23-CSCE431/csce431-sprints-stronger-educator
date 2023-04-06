class Campus < ApplicationRecord
    self.table_name = "campuses"

    def create
        @campus = Campus.new(campus_params)
        if @campus.save
            redirect_to @campus
        else
            render 'new'
        end
    end

    validates :name, presence: true
    validates :campus_id, presence: true
    validates :district_id, presence: true

    private

    def campus_params
        params.require(:campus).permit(:campus_id, :name, :districts_id)
    end
end
