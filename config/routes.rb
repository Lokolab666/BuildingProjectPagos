Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :pagos
      #map.connect :action, :controller => 'pagos'
    end
  end
end
