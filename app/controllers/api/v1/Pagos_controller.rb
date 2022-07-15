module Api
    module V1
        class PagosController < ApplicationController
            def index
                pagos = Pago.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Loaded Pagos', data:pagos}, status: :ok
            end

            def show
                #pago = Pago.find(params[:id])

                render json: {status: 'SUCCESS', message: 'Vista Pago', data:pago}, status: :ok
            end

            def create
                pago = Pago.find(params[:id])
                puts pago.IdPago
                render json: {status: 'SUCCESS', message: 'Vista Pago', data:pago}, status: :ok
                json = File.read("public/dataPagos.json")
                json = JSON.parse json
                jsonT = json['pagos']
                event_json = {
                  "IdPago" => pago.IdPago,
                  "FechaPago" => pago.Fecha,
                  "ValorPago" => pago.ValorPagar,
                  "IdApto" => pago.IdAptoFK
                }
                jsonT << event_json
                
                File.open("public/dataPagos.json","w") do |f|
                  f.write(json.to_json)
                end
                    
            
            
            
                pago.destroy
                #if pago.save
                #    render json: {status: 'SUCCESS', message: 'Guardado Pago', data:pago}, status: :ok
                #else
                #    render json: {status: 'ERROR', message: 'No Guardado Pago', data:pago.errors}, status: :unprocessable_entity
                #end
            end

            def destroy
                pago = Pago.find(params[:id])
                pago.destroy
                render json: {status: 'SUCCESS', message: 'Eliminado Pago', data:pago}, status: :ok
            end

            def update
                pago = Pago.find(params[:id])
                if pago.update(pago_params)
                    render json: {status: 'SUCCESS', message: 'Actualizado Pago', data:pago}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'No Actualizado Pago', data:pago.errors}, status: :unprocessable_entity
                end
            end

            #def postback
           #     puts request.body.read    
           # end

            private

            def pago_params
                params.permit(:IdPago, :Fecha, :ValorPagar, :IdAptoFK, :Descripcion)
            end
        end
    end
end