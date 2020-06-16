ActiveAdmin.register Product do
  permit_params :name, :store_id, :available_on

  index do
    id_column
    column :name
    column :slug
    actions
  end

  filter :email
  filter :slug

  form do |f|
    f.inputs do
      f.input :name
      f.input :store
    end
    f.actions
  end

end
