Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :pagos
      get '/pagos/showPagos/:id', to: 'pagos#showPagos'
    end
  end
end
