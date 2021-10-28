class Carta
    attr_accessor :numero, :pinta
    def initialize(numero, pinta)
        if !(1..13).include?(numero)
            raise ArgumentError 'carta no valida'
        end
        @numero = numero
        @pinta = pinta
    end
end
