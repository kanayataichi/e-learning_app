ELearningApp::Application.routes.draw do

  # ルートパス
  root to: 'login#index'
  
  # メインメニュー画面パス
  match '/main_menu',    to: 'login#login'
  match '/main_menu/index',    to: 'main_menu#index'
  
  # 試験区分マスタ画面パス
  match '/test_category/',    to: 'test_category#index'
  match '/test_category/new',    to: 'test_category#new'
  match '/test_category/update',    to: 'test_category#update'
  match '/test_category/destory',    to: 'test_category#destory'
  
  # ユーザマスタ画面パス
  match '/user/',    to: 'user#index'
  match '/user/new',    to: 'user#new'
  match '/user/update',    to: 'user#update'
  match '/user/destory',    to: 'user#destory'
  
  # 試験問題作成画面パス
  match '/problem/',    to: 'problem#index'
  match '/problem/new',    to: 'problem#new'
  match '/problem/update',    to: 'problem#update'
  match '/problem/destory',    to: 'problem#destory'
  
  # 試験実施画面パス
  match '/trial/',    to: 'trial#index'
  match '/trial/start',    to: 'trial#start'
  match '/trial/next',    to: 'trial#next'

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
