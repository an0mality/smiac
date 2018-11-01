Rails.application.routes.draw do

  get 'politika', :to => redirect('/Politika.pdf')
  get 'calendar_2018', :to => redirect('/calendar_2018.pdf')
  get 'calendar_2019', :to => redirect('/calendar_2019.pdf')
  # resources :feedback

  # post 'feedback' => 'main#index'
  resources :feedback do
    collection do
      post 'create'
      get :autocomplete_organization_name

    end
  end
  # mount Ckeditor::Engine => '/ckeditor'
  get 'sitemap' => 'main#sitemap'

  mount RedactorRails::Engine => '/redactor_rails'
  # mount Ckeditor::Engine => '/ckeditor'


  # resources :main do
  #   collection do
  #     post 'feedb'
  #   end
  # end

  root 'main#index'
  get 'about' => "main#about"
  resources :main do
    collection do
      post 'global_search'
      post 'articles'
    end
  end

  # get 'projects' => "main#projects"
  # get 'service' => "main#service"
  # resources :rmi, :only => [:index]
  resources :rmi
  resources :calendar, only: :index do
        member do
          get 'download_document'
        end
  end

  resources :classroom do
    collection do
      get 'show_video_list'
    end
  end

  resources :organization, :only =>  [:index]  do
    collection do
      get 'info'
      post 'info'
      get 'summary_nok'
      get 'equipment'
    end
  end


  resources :articles, :only =>  [:index, :show]  
  get 'rss' => 'articles#feed', format: 'rss'

  resources :subscribes
  get 'confirm_email' => 'subscribes#confirm'
  get 'unsubscribe' => 'subscribes#unsubscribe'
  post 'send_unsubscribe' => 'subscribes#send_unsubscribe'

    
  # post 'subscribe' => 'articles#subscribe'
  # post 'unsubscribe' => 'articles#unsubscribe'
  # do
  #   member do
  #     get 'full_page'
  #   end
  # end


  resources :statistics, :only =>  [:index]  do
    collection do
      get 'chart'
      get 'docs'
      get 'additionally'
    end

  end


  resources :ratings, only: [:index, :edit] do
    collection do
      get 'add_ambul'
      get 'add_hospital'
      get 'list'
      get 'add_question'
      get 'add_form'
      get 'thank_you'
      get 'edit_form'
      get 'edit_question'
      get 'edit_answer'
      post 'add_ambul'
      post 'add_hospital'
      post 'list'
      post 'add_question'
      post 'add_form'
      put 'edit_form'
      put 'edit_question'
      put 'edit_answer'
    end
  end

  resources :documents


  resources :about do
    collection do
      get 'tasks'
      get 'contacts'
      get 'departments'
      get 'phones'
      get 'vacancies'


    end
  end

  devise_for :users

  resources :eco, only: :index do
    collection do
      post 'create_eco_vote'


    end
  end

  resources :users do
    collection do
      get :autocomplete_organization_name
    end
  end

  namespace :admin do
    namespace :calendar do
      resources :calendar_list do
        member do
          get 'file_list'
          get 'download_document'
          delete 'remove_file'
        end
        collection do
          post 'upload_document'

        end
      end
      resources :calendar_report_type
      resources :calendar_schedule do
        collection do 
          get 'delete_list'
          post 'delete_list'
        end
        
      end
      
    end

    resources :main, only: :index
    resources :articles
    # , only: [:index, :new, :show, :destroy, :create, :edit] do
    #   member do
    #     put 'edit'
    #     post 'edit'
    #   end
    # end

    resources :documents do
      collection do
        post 'mass_deleting'
      end
    end
    
    resources :document_stages 
    # do
    #   collection do
    #     get 'document_stage'
    #     get 'document'
    #     post 'create_document_stage'
    #     post 'create_document'
    #   end

    #   member do
    #     get 'show_document_stage'
    #     post 'edit_document_stage'
    #     delete 'destroy_document_stage'
    #     delete 'destroy_document'
    #   end
    # end



    resources :classroom, :only => [:index, :new, :show_video_list, :destroy, :show, :edit] do
      collection do
        post 'update_video_list'
        get 'update_video_list'
        get 'show_video_list'
        post 'create_video_file'

      end
      member do
        post 'edit'
      end

    end

    resources :organization
    #  :only =>  [:index, :destroy, :edit, :create, :show]  do
    #   collection do
    #     get 'info'
    #     post 'info'
    #     get 'organization_type'
    #     post 'create_organization_type'
    #   end

    #   member do
    #     get 'show_organization_type'
    #     post 'edit_organization_type'
    #     delete 'destroy_organization_type'
    #     post 'edit'
    #   end
    # end

    resources :type_organization
    # , :only =>  [:index, :destroy, :edit, :create, :show]  do
    #   collection do
    #     get 'info'
    #     post 'info'
    #     get 'organization_type'
    #     post 'create_organization_type'
    #   end

    #   member do
    #     get 'show_organization_type'
    #     post 'edit_organization_type'
    #     delete 'destroy_organization_type'
    #     post 'edit'
    #   end
    # end

    resources :rmi do
      collection do
        get 'theme'
        get 'answer'
        post 'create_answer'
      end

      member do

        get 'edit_theme'
        post 'edit_theme'
        delete 'destroy_theme'
        get 'edit_answer'
        post 'update_answer'

        delete 'destroy_answer'

      end


    end
    resources :vacancies do
      collection do
        post 'create_vacancy'
      end
      member do
        put 'edit'
        get 'edit'
        post 'edit'
      end
    end


    resources :employees do
      collection do
        get 'get_employees'
      end
      member do
        put 'edit'
        get 'edit'
        post 'edit'
      end
    end
    # resources :phones do
    #   # collection do
    #     # post 'create_vacancy'
    #   # end
    # end
    resources :department
    # do
      # member do
      #   put 'edit'
      #   get 'edit'
      #   post 'edit'
      # end
    # end

    resources :users do
      collection do
        get :autocomplete_organization_name
      end
      member do
        put 'edit'
        get 'edit'
        post 'edit'
        post 'reset_password'
      end
    end



    devise_for :users
    # post "/admin/article" => "articles#create", :as => :create
    # resources :documents, only: [:index, :new, :show, :destroy]
  end



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
