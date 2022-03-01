ActiveAdmin.register Mountain do
  permit_params :name, :image, :prefecture_id

  index do
    selectable_column
    id_column
    column :name
    column :prefecture
    column :created_at
    column :updated_at
    actions
  end

  controller do
    def create
      super { |format| display_flash_message(@mountain) }
    end

    def update
      super { |format| display_flash_message(@mountain) }
    end

    def destroy
      super { |format| display_flash_message(@mountain) }
    end
  end
end
