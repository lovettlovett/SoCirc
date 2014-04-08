Fbook::Application.routes.draw do
  root "main#index"
  match "/auth/:provider/callback" => "sessions#create", via: [:get, :post]
  match "/signout" => "sessions#destroy", :as => :signout, via: [:get, :post]

  get "/school", to: "main#school"
  get "/location", to: "main#location"
  get "/work", to: "main#work"
  get "/relationship", to: "main#relationship"
end
