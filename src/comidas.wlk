class Plato {
	var property peso = 0
	var property valoracion = 0
	
	method aptoVegetariano()
	method esAbundante() = self.peso() > 250
}

class Provoleta inherits Plato {
	var property tieneEspecias
	
	override method aptoVegetariano() = !tieneEspecias
	method esEspecial() = self.esAbundante() || tieneEspecias
	override method valoracion() = if(self.esEspecial()) 120 else 80
}

class HamburguesaDeCarne inherits Plato {
	const property pan
	
	override method aptoVegetariano() = false
	override method peso() = 250
	override method valoracion() = 60 + pan.valoracion()
}

class HamburguesaVegetariana inherits HamburguesaDeCarne {
	var property legumbre
	
	override method aptoVegetariano() = true
	method plusDeValoracion() = legumbre.size()
	override method valoracion() = super() + 17.min(self.plusDeValoracion()*2)
}

class Parrillada inherits Plato {
	var property cortesDeCarne = []
	
	method agregarCorte(corte) {cortesDeCarne.add(corte)}
	override method peso() = cortesDeCarne.sum({c => c.peso()})
	override method aptoVegetariano() = false
	method corteDeCalidadMaxima() = cortesDeCarne.map({c => c.calidad()}).max()
	method cantidadDeCortes() = cortesDeCarne.size()
	override method valoracion() = (15 * self.corteDeCalidadMaxima() - self.cantidadDeCortes()).max(0)
}

class CorteDeCarne {
	const property nombre
	const property peso
	const property calidad
	
}

object panIndustrial {
	const property valoracion = 0
}

object panCasero {
	const property valoracion = 20
}

object panMasaMadre {
	const property valoracion = 45
}
