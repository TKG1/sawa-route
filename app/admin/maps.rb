ActiveAdmin.register Map do
  permit_params :latitude, :longitude, :zoom, :route_id

  controller do
    def create
      super { |format| display_flash_message(@map) }
    end

    def update
      super { |format| display_flash_message(@map) }
    end

    def destroy
      super { |format| display_flash_message(@map) }
    end
  end
end
