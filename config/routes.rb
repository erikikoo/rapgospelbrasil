Rails.application.routes.draw do

  resources :top5s
  resources :words
  resources :notices
  devise_for :artists

  mount Ckeditor::Engine => '/ckeditor'

  #pagina principal 
  get 'welcome/index'
  get '/principal'                    => 'principal#index'
  get '/noticias'                     => 'welcome#noticia'
  get '/palavras'                     => 'welcome#palavra'
  get '/artistas'                     => 'welcome#artista'
  get '/videos'                       => 'welcome#video'
  get '/show_noticia/:id'             => 'notices#show'
  get '/show_palavra/:id'             => 'words#show'  
  get '/show_artista/:id'             => 'artist_datas#show'
  get '/search_artista/:word'         => 'artist_datas#search_artista'

  #adm
  get '/top5/:profile'                     => 'admin#top5'

  get '/show_artista/:id/:profile'         => 'admin#show_artista'  
  get 'admin/index'
  get '/artistas/:profile'                 => 'admin#artistas'
  get '/artistas_filter'                   => 'admin#artistas_filter'
  get '/artistas_filter/:option'           => 'admin#artistas_filter'
  
  
  get '/palavras/:profile'                 => 'admin#palavras'
  get '/nova_palavra/:profile'             => 'admin#nova_palavra'
  get '/edit_palavra/:id/:profile'         => 'admin#edit_palavra'
  get '/show_palavra/:id/:profile'         => 'admin#show_palavra'    
  get '/palavras/:profile/:status'         => 'admin#palavras'

  get '/noticias/:profile'                 => 'admin#noticias'
  get '/nova_noticia/:profile'             => 'admin#nova_noticia'
  get '/edit_noticia/:id/:profile'         => 'admin#edit_noticia'
  get '/show_noticia/:id/:profile'         => 'admin#show_noticia'  
  get '/noticias/:profile/:status'         => 'admin#noticias'

  get '/aprovar_artista/:id/:profile'      => 'admin#aprova_artista'
  get '/bloquear_artista/:id/:profile'     => 'admin#bloquear_artista'
  get '/desbloquear_artista/:id/:profile'  => 'admin#desbloquear_artista'

  get '/videos/:profile'                   => 'admin#videos'
  get '/novo_video/:profile'               => 'admin#novo_video' 
  delete 'remove_artista/:id/:profile'     => 'admin#remove_artista'
  delete 'remove_noticia/:id/:profile'     => 'admin#remove_noticia'
  delete 'remove_palavra/:id/:profile'     => 'admin#remove_palavra'

  #novo 
  get '/novo_disco/:id'        => 'principal#novo_disco'
  get '/novo_agenda/'          => 'principal#novo_agenda'
  get '/novo_email/'           => 'principal#novo_email'
  get '/novo_telefone/'        => 'principal#novo_telefone'
  get '/novo_video/'           => 'principal#novo_video'
  get '/novo_top5/'            => 'top5s#new'

  #rotas ajax
  #views padrão (sem login)
  get '/principal/perfil'          => 'principal#perfil'
  get '/album/:id/:profile'        => 'artist_datas#discography'  
  get '/contato/:id'               => 'artist_datas#contact'
  get '/historia/:id'              => 'artist_datas#history'
  get '/agenda/:id/:profile'       => 'artist_datas#agenda'
  get '/videos/:id/:profile'       => 'artist_datas#videos'
  get '/rede_social/:id/:profile'  => 'artist_datas#rede_social'

  #views user


  #apresenta artista existente
  get '/show_artista/:id/:profile'          => 'principal#artista'
  get '/show_agenda/:id/:profile'           => 'principal#agenda'
  get '/show_disco/:id/:profile'            => 'principal#disco'
  get '/show_historia/:id/:profile'         => 'principal#historia'
  get '/show_contato/:id'                   => 'principal#contato'
  get '/show_email/:id/:profile'            => 'principal#email'
  get '/show_telefone/:id/:profile'         => 'principal#telefone'
  get '/show_rede_social/:id/:profile'      => 'principal#rede_social'  
  get '/show_video/:id/:profile'            => 'principal#video'  
  post '/show_agenda/:id/:profile'          => 'principal#artista'
  get '/show_agenda/:id/:profile'           => 'principal#agenda'

  get '/show_artista/:id/:profile/:status'          => 'principal#artista'
  get '/show_agenda/:id/:profile/:status'           => 'principal#agenda'
  get '/show_disco/:id/:profile/:status'            => 'principal#disco'
  get '/show_contato/:id/:status'                   => 'principal#contato'
  get '/show_email/:id/:profile/:status'            => 'principal#email'
  get '/show_telefone/:id/:profile/:status'         => 'principal#telefone'
  get '/show_rede_social/:id/:profile/:status'      => 'principal#rede_social'
  get '/show_video/:id/:profile/:status'            => 'principal#video'
  

  #edita artista existente
  get '/edit_artista/:id'                 => 'principal#artista'
  get '/edit_agenda/:id/:profile'         => 'principal#edit_agenda'
  get '/edit_disco/:id/:profile'          => 'principal#edit_disco'  
  get '/edit_email/:id/:profile'          => 'principal#edit_email'  
  get '/edit_telefone/:id/:profile'       => 'principal#edit_telefone'  
  get '/edit_rede_social/:id/:profile'    => 'principal#edit_rede_social'  
  
  
  #remove items
  delete '/remove_disco/:id/:profile'          => 'principal#remove_disco'
  delete '/remove_agenda/:id/:profile'         => 'principal#remove_agenda'
  delete '/remove_email/:id/:profile'          => 'principal#remove_email'
  delete '/remove_telefone/:id/:profile'       => 'principal#remove_telefone'
  delete '/remove_video/:id/:profile'          => 'principal#remove_video'
  delete '/remove_rede_social/:id/:profile'    => 'principal#remove_rede_social'  


  post '/videos/:user' => 'videos#create'


   resources :discographys
   resources :phones
   resources :emails
   resources :artist_datas
   resources :rede_sociais
   resources :videos
   resources :commitments  
   resources :historys
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


  # You can have the root of your site routed with "root"
   root 'welcome#index'

  # Example of regular route:
     

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
