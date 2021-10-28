class Usuario
    attr_accessor :cuentas
    def initialize(nombre, cuentas)
        @nombre = nombre
        @cuentas = cuentas
    end

    def saldo
        total = 0
        self.cuentas.each do |i|
            total += i.saldo
        end
        return total
    end
end

class CuentaBancaria
    attr_accessor :nombre_banco, :saldo, :numero_de_cuenta
    def initialize(nombre_banco, numero_de_cuenta, saldo = 0)
        @nombre_banco = nombre_banco
        @numero_de_cuenta = numero_de_cuenta
        @saldo = saldo
        raise ArgumentError, 'Numero incorrecto' if numero_de_cuenta.digits.length != 8

    end

    def transferir(monto, cuenta_destino)
        self.saldo -= monto
        cuenta_destino.saldo += monto
    end
end

cuenta1 = CuentaBancaria.new("Banco Bci", 12345669, 5000)
cuenta2 = CuentaBancaria.new("Banco Chino", 11111666, 5000)
cuenta3 = CuentaBancaria.new("Banco Nacional", 23409887, 20000)

cuenta1.transferir(5000, cuenta2)

puts cuenta1.saldo
puts cuenta2.saldo

usuario1 = Usuario.new("Rod", [cuenta1, cuenta2, cuenta3])

puts usuario1

total = usuario1.saldo

puts "El saldo total de Rod es #{total}"

