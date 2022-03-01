ActiveAdmin.register Route do
  permit_params :name, :description, :schedule, :level, :time, :length, :image, :mountain_id

  index do
    selectable_column
    id_column
    column :name
    column :schedule
    column :level
    column :time
    column :length
    column :mountain
    column :created_at
    column :updated_at
    actions
  end

  controller do
    def create
      super { |format| display_flash_message(@route) }
    end

    def update
      super { |format| display_flash_message(@route) }
    end

    def destroy
      super { |format| display_flash_message(@route) }
    end
  end
end
