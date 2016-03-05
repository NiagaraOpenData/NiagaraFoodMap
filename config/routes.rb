Rails.application.routes.draw do
  root to: 'visitors#index'

  # data importer
  get 'foodbanks_import' => 'importer#foodbanks', as: 'import_foodbanks'

  #api routes
  scope '/api' do
    scope '/v1' do
      get 'foodbanks' => 'api#foodbanks', as: 'foodbanks_api'
      get 'foodbanks_nearby' => 'api#foodbanks_nearby', as: 'foodbanks_nearby_api'
    end
  end
end
