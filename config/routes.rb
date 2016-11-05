Rails.application.routes.draw do
  resources :guests do
    match 'rsvp-update', to: 'guests#rsvp_update', via: [:put]
    match 'rsvp-success', to: 'guests#rsvp_success', via: [:get]
  end
  resources :parties do 
    match 'rsvp-update', to: 'parties#rsvp_update', via: [:put]
    match 'rsvp-sucess', to: 'parties#rsvp_success', via: [:get]
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  get 'rsvp', to: 'home#rsvp'
  
  get 'export_for_mailchimp_english', to: 'home#export_for_mailchimp_english'
  get 'export_for_mailchimp_portuguese', to: 'home#export_for_mailchimp_portuguese'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
