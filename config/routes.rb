Routes = Router.new do
	match '/' => 'home#index'
	match '/echo' => 'echo#index'
	match '/home/index' => 'home#index'
	match '/users' => 'users#index'
	match '/users/show' => 'users#show'
	
end