module Api
    module V1
        class PagosController < ApplicationController
            def index
                #@sotr = Pago.pruebaf
                pagos = Pago.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Loaded Pagos', data:pagos}, status: :ok
            end

            def showPagos
                require 'openssl'
                require 'base64'

                json = File.read("public/dataPagos.json")
                json = JSON.parse json
                jsonT = json['pagos'].to_a
                res = jsonT.map{|o| o['IdApto']}
                counter = 0
                idPropiedad = params[:id]
                pos = []
                while counter < res.length
                    if res[counter] == idPropiedad
                        pos.push(counter)
                    end
                    counter = counter + 1
                end

                pagos = []
                for i in pos
                    pagos.push(jsonT[i])
                end
                
               # pagosStringUno = pagos[0].to_s
                encripArray = []

                public_key_file = "public/public.pem";
                public_key = OpenSSL::PKey::RSA.new(File.read(public_key_file))

                counter = 0
                while counter < pagos.length
                    encripArray.push(Base64.encode64(public_key.public_encrypt(pagos[counter].to_s)))
                    counter = counter + 1
                end
                
                encrypted_string = encripArray.to_s
                

                
               #encrypted_string = Base64.encode64(public_key.public_encrypt(pagosString))

                puts encrypted_string
                render json: encrypted_string

            end

            def show
                pagoTa = Pago.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Vista Pago', data:pagoTa}, status: :ok
            end

            def create
                pago = Pago.find(params[:id])
                #puts pago.IdPago
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

            def pou
            puts "hp"
            end

            private

            def pago_params
                params.permit(:IdPago, :Fecha, :ValorPagar, :IdAptoFK, :Descripcion)
            end
        end
    end
end