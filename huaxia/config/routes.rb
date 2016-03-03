Huaxia::Application.routes.draw do


  mount Ckeditor::Engine => '/ckeditor'

  resources :about_us, :only => [:index]
  get "about_us/:child_info" => "about_us#index", :as => "about_us_child_info"
  resources :student_associations, :only => [:index]
  resources :tour_travels, :only => [:index]
  get "tour_travels/:child_info" => "tour_travels#index", :as => "tour_travel_child_info"
  get "tour_travels/:child_info/:airline" => "tour_travels#airline_detail", :as => "tour_travel_airline_detail"
  post "tour_travels/tiket-pesawat/search_result" => "tour_travels#search_result", :as => "search_result"

  resources :testimonials, :only => [:index, :show]
  get "study_in_china" => "info_study#index", :as => "study_in_china"
  get "study_in_china/:child_info" => "info_study#index", :as => "study_in_china_child_info"
#  get "hsk" => "hsk#index", :as => "hsk"
  get "learning_mandarin" => "learning_mandarin#index", :as => "learning_mandarin"
  get "galleries/:type" => "galleries#index", :as => "categories"
  get "gallery/:permalink" => "galleries#show", :as => "category"
  get "universities/:city" => "universities#index", :as => "universities"
  get "universities/:city/:permalink" => "universities#show", :as => "university"
  post "universities/search_result" => "universities#search_result", :as => "university_search_result"
  get "programs" => "features#index", :as => "programs"
  get "programs/:permalink" => "features#show", :as => "program"
  get "books/:book_type" => "books#index", :as => "books"
  get "book/:book_type/:permalink" => "books#show", :as => "book"

  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  resources :sessions, :only => [:create]

  match "admin" => "admin/dashboard#index", :as => "admin"
  post "admin/dashboard/change_password"

  namespace :admin do
    resources :airlines do
      member do
        get  "routes" => "routes#index", :as => "routes"
        post "routes" => "routes#create", :as => "routes"
        get  "routes/new" => "routes#new", :as => "new_routes"
        get  "routes/:id_route/edit" => "routes#edit", :as => "edit_routes"
        put  "routes/:id_route" => "routes#update", :as => "route"
        delete  "routes/:id_route" => "routes#destroy", :as => "route"
      end
    end
    resources :banners
    resources :book_categories
    resources :books
    resources :informations
    resources :student_associations
    resources :universities
    resources :uploaded_files
    
    get  "list_news" => "features#index", :as => "features"
    post "list_news" => "features#create", :as => "features"
    get  "news/new" => "features#new", :as => "new_feature"
    get  "news/:id/edit" => "features#edit", :as => "edit_feature"
    put  "news/:id" => "features#update", :as => "feature"
    delete  "news/:id" => "features#destroy", :as => "feature"
    delete  "news/:id/delete_image" => "features#destroy_image", :as => "feature_delete_image"
    get  "news_categories" => "feature_categories#index", :as => "feature_categories"
    post "news_categories" => "feature_categories#create", :as => "feature_categories"
    get  "news_categories/new" => "feature_categories#new", :as => "new_feature_category"
    get  "news_categories/:id/edit" => "feature_categories#edit", :as => "edit_feature_category"
    put  "news_categories/:id" => "feature_categories#update", :as => "feature_category"
    delete  "news_categories/:id" => "feature_categories#destroy", :as => "feature_category"

    resources :testimonials
    get ":type/gallery_categories" => "categories#index", :as => "list_gallery_category"
    get "gallery_categories" => "categories#index", :as => "gallery_categories"
    get "gallery_categories/new" => "categories#new", :as => "new_gallery_categories"
    post "gallery_categories" => "categories#create", :as => "gallery_categories"
    get "gallery_categories/:id/edit" => "categories#edit", :as => "edit_gallery_categories"
    put "gallery_categories/:id/edit" => "categories#update", :as => "update_gallery_categories"
    delete "gallery_categories/:id" => "categories#destroy", :as => "delete_gallery_categories"

    get ":category_id/galleries" => "galleries#index", :as => "galleries"
    post ":category_id/galleries" => "galleries#create", :as => "galleries"
    get ":category_id/galleries/new" => "galleries#new", :as => "new_gallery"
    get ":category_id/galleries/:id/edit" => "galleries#edit", :as => "edit_gallery"
    get ":category_id/galleries/:id" => "galleries#show", :as => "gallery"
    put ":category_id/galleries/:id" => "galleries#update", :as => "gallery"
    delete ":category_id/galleries/:id" => "galleries#destroy", :as => "gallery"

    get "informations/:id/child_informations" => "informations#index", :as => "child_informations"
    post "informations/:id/child_informations" => "informations#create", :as => "child_informations"
    get "informations/:id/child_informations/new" => "informations#new", :as => "new_child_informations"
    get "informations/:id/child_informations/:child_id/edit" => "informations#edit", :as => "edit_child_informations"
    put "informations/:id/child_informations/:child_id" => "informations#update", :as => "child_information"
    delete "informations/:id/child_informations/:child_id" => "informations#destroy", :as => "child_information"


  end

  root :to => 'home#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
