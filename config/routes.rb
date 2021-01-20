Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 root to: "posts#index"
 match 'post/sorted_data', to: 'posts#sorted_data', via: [:post]

	 resources :posts do
	 	resources :comments
	 	
 	end

end