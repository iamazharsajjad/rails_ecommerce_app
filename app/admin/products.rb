# frozen_string_literal: true

ActiveAdmin.register Product do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :description, :stripe_id, :price, :sale_price, :currency
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :stripe_id, :price, :sale_price, :currency]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :title, :description, :stripe_id, :price, :sale_price, :currency, images: []

  form html: { multipart: true } do |f|
    f.inputs 'Publication' do
      f.input :title
      f.input :description
      f.input :stripe_id
      f.input :price
      f.input :sale_price
      f.input :currency
      f.input :images, as: :file, input_html: { multiple: true }
    end

    f.actions
  end
end
