ResquePastie::Application.routes.draw do
  resources :snippets
  root :to => "snippets#index"
  mount Resque::Server, :at => "/resque"
end
