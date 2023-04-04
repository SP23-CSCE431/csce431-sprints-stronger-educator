class District < ApplicationRecord
    self.table_name = "districts"

    def create
        @district = District.new(district_params)
        if @district.save
            redirect_to @district
        else
            render 'new'
        end
    end

    private

    def district_params
        params.require(:district).permit(:district_id, :name)
    end
end
