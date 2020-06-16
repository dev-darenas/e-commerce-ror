ActiveAdmin.register Store do
  permit_params :name

  index do
    id_column
    column :name
    column :slug
    actions
  end

  filter :name
  filter :slug

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end

end
