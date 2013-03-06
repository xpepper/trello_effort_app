TrelloEffortApp::Application.routes.draw do
  scope :module => "tracco" do
    resources :tracked_cards, :except => [:new, :create] do
      resources :efforts, :only => [:edit, :update, :destroy] do
        resources :members, :only => [:destroy]
      end
    end
  end

  root :to => 'tracco/tracked_cards#index', :module => 'tracco'
end
