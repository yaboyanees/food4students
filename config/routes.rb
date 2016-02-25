Rails.application.routes.draw do
	#admin route
    get '/admin' => 'admin#index', as: 'admin'

    resources :paygrades
	resources :optionals
	resources :children
	resources :adults
	resources :households
	
	resources :legal, path: '/legal'
	root 'households#new'
	get '/thanks' => 'households#thank_you', as: 'thank_you_household/'
	
	# Each Section of the Application
	resources :households do 
		member do
			get 'kids'
			get 'adults'
			get 'optionals'
		end
	end
 
   #rescue from bad url and redirect to homepage
   get ':not_found' => redirect('/'), :constraints => { :not_found => /.*/ }

end
