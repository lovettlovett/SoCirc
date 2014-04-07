Fbook::Application.routes.draw do
  root "main#index"
  match "/auth/:provider/callback" => "sessions#create", via: [:get, :post]
  match "/signout" => "sessions#destroy", :as => :signout, via: [:get, :post]
end
