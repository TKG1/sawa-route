ActiveAdmin.register User do
  permit_params :name, :email, :password, :password_confirmation, :role, :avatar

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role
      f.input :avatar
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :role
    column :created_at
    column :updated_at
    actions
  end

  controller do
    def create
      super { |format| display_flash_message(@user) }
    end

    def update
      super { |format| display_flash_message(@user) }
    end

    def destroy
      super { |format| display_flash_message(@user) }
    end
  end
end
