ActiveAdmin.register Task do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model

permit_params :course_id, :title, :description, :video_url, :image, :preview



index do
  selectable_column
  column :id 
  column :course
  column :title
  column :description
  column :video_url
  column :image
  column :created_at
  column :updated_at
  column :preview
  actions
end

 show do
 	attributes_table do
 		row :course
 		row :title
 		row :description
 		row :video_url
 		row :image do
 			task.image.present? ? image_tag(task.image.url, height: 300) : content_tag(:span, 'No Image')

 		end
    row :preview
 	end
 end


 form do |f|
 	f.inputs do
 		
 		f.input :course, include_blank: false
 		f.input :title
 		f.input :description
 		f.input :video_url
    f.input :preview
 		f.input :image, hint: task.image.present? ? image_tag(task.image.url, height: 100) : content_tag(:span, 'No Image')

 	end
 	f.actions
 end

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
