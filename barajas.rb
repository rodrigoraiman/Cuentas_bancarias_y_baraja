require_relative 'carta.rb'


class Baraja
    attr_accessor :cartas
    def initialize()
        @cartas = []
        ['C', 'D', 'E', 'T'].each do |pinta|
            13.times do |i|
                i +=  1
                @cartas.push(Carta.new(i, pinta))

            end
        end
    end
        

    def barajar
        @cartas.shuffle!
    end

    def saca
        carta = @cartas.pop
    end
    
    def repartir_mano
        mano = []
        5.times do |i|
            mano.push(saca)
        end
        return mano
    end
end

juego = Baraja.new
puts juego.cartas
puts juego.saca
puts juego.barajar
print juego.repartir_mano