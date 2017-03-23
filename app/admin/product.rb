ActiveAdmin.register Product do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :name, :mfr, :description, :price, :tax, :qty, :tags, :string, :image
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

form(:html => { :multipart => true }) do |f|
  f.inputs "Products" do
    f.input :name
    f.input :mfr
    f.input :image, :as => :file
    f.input :description
  end
  f.button
end

end
