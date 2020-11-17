Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  namespace "api" do
    resources :alloted_number do
      collection do
        post 'phone/:number', to: 'alloted_numbers#phone'
        post :phone, to: 'alloted_numbers#phone'
      end
    end
  end
end
