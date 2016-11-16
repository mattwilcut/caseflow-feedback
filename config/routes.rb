Rails.application.routes.draw do
 
 resource :feedbacks

 root 'feedbacks#new'
 
end
