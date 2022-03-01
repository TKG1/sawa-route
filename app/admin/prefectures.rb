ActiveAdmin.register Prefecture do
  permit_params :name

  controller do
    def create
      super { |format| display_flash_message(@prefecture) }
    end

    def update
      super { |format| display_flash_message(@prefecture) }
    end

    def destroy
      super { |format| display_flash_message(@prefecture) }
    end
  end
end
