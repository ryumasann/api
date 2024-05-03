Rails.application.routes.draw do
  get 'articles/index'
  root 'articles#index'
  resources :articles
  get '/health', to: 'health#check'
  # GET	/photos	photos#index	すべての写真の一覧を表示
  # GET	/photos/new	photos#new	写真を1つ作成するためのHTMLフォームを返す
  # POST	/photos	photos#create	写真を1つ作成する
  # GET	/photos/:id	photos#show	特定の写真を表示する
  # GET	/photos/:id/edit	photos#edit	写真編集用のHTMLフォームを1つ返す
  # PATCH/PUT	/photos/:id	photos#update	特定の写真を更新する
  # DELETE	/photos/:id	photos#destroy

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
