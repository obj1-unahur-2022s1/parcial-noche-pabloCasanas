import comidas.*
import comensales.*

object cocina {
	const property comidasPreparadas = []
	
	method prepararComida(unaComida) {comidasPreparadas.add(unaComida)}
	method comidasVegetarianas() = comidasPreparadas.filter({c => c.aptoVegetariano()})
	method comidadasNoVegetarianas() = comidasPreparadas.filter({c => not c.aptoVegetariano()})
	method tieneBuenaOfertaVegetariana() = (self.comidasVegetarianas().size() - self.comidadasNoVegetarianas().size()).abs() <= 2
	method platoFuerteCarnivoro() = self.comidadasNoVegetarianas().max({c => c.valoracion()})
	method comidasQueLeGustan(unComensal) = comidasPreparadas.filter({e => unComensal.leGusta(e)})
	method elegirPlatoPara(unComensal) = comidasPreparadas.anyOne()
}

