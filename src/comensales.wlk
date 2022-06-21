import comidas.*

class Comensales {
	const property peso
	const property comidasQueComio = []
	
	method leAgrada(unaComida)
	method comer(unaComida) {comidasQueComio.add(unaComida)}
	method pesoDeLasComidasIngeridas() = comidasQueComio.sum({c => c.peso()})
	method estaSatisfecho() = self.pesoDeLasComidasIngeridas() >= peso * 0.01 && self.condicionAdicional()
	method condicionAdicional()
}

class Vegetariano inherits Comensales {
	override method leAgrada(unaComida) = unaComida.aptoVegetariano() && unaComida.valoracion() > 85
	override method condicionAdicional() = comidasQueComio.all({c => not c.esAbundante()})
}

class HambrePopular inherits Comensales {
	override method leAgrada(unaComida) = unaComida.esAbundante()
	override method condicionAdicional(){}
}

class PaladarFino inherits Comensales {
	override method leAgrada(unaComida) = unaComida.peso().between(150, 300) 
										&& unaComida.valoracion() > 100
	override method condicionAdicional() = comidasQueComio.size().even()
}
