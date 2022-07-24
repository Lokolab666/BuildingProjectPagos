class Pago < ApplicationRecord
    validates :IdPago, presence: true
    validates :Fecha, presence: true
    validates :ValorPagar, presence: true
    validates :IdAptoFK, presence: true
    validates :Descripcion, presence: true
    def self.pruebaf(i,j,k)
        idpropiedades = getPropiedades
        indices = getIndicadorPro
        valorpago = calculo(indices[j])
        fechames = validateFecha(k)

        Pago.create(IdPago: randomId.to_s, Fecha: "2022-#{k}-25", ValorPagar: valorpago, IdAptoFK: idpropiedades[i], Descripcion: fechames);
        puts "Completado"
    end

    def self.randomId
        idrandom = rand 000000000..999999999
        return idrandom
    end

    def self.getPropiedades
        require 'json'
        require 'open-uri'
    
        uri = URI.parse 'https://github.com/Lokolab666/FileAppartament/blob/main/data.json?raw=true'
        json = 
        begin
            json_file = uri.open.read
        rescue OpenURI::HTTPError => e
            puts "Encountered error pulling the file: #{e}"
        else
            JSON.parse json_file
        end
        json = json['apartament'].to_a
        res = json.map{|o| o['Identificador']}
        res = res.to_a
        return res
    end

    def self.getIndicadorPro
        require 'json'
        require 'open-uri'
    
        uri = URI.parse 'https://github.com/Lokolab666/FileAppartament/blob/main/data.json?raw=true'
        json = 
        begin
            json_file = uri.open.read
        rescue OpenURI::HTTPError => e
            puts "Encountered error pulling the file: #{e}"
        else
            JSON.parse json_file
        end
        json = json['apartament'].to_a
        res = json.map{|o| o['IndiceCopropiedad']}
        res = res.to_a
        return res
    end

    def self.calculo(indice)
        if indice == 5
            return 150000
        elsif indice == 4.5
            return 125000
        else
            return 175000
        end
    end

    def self.validateFecha(indice)
        if indice == 8
            return "Agosto"
        elsif indice == 9
            return "Septiembre"
        elsif indice == 10
            return "Octubre"
        elsif indice == 11
            return "Noviembre"
        else
            return "Diciembre"
        end
    end

end
