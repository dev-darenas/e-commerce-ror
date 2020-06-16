ActiveAdmin.register User do
  permit_params :name, :email, :password, :password_confirmation, :store_id

  index do
    id_column
    column :name
    column :email
    actions
  end

  filter :name
  filter :slug

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :store
    end
    f.actions
  end
end
