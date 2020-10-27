import Barco_bis.*
import Mision_bis.*
import EspiaDeLaCorona_bis.*
import items.*

class Pirata {
	
	var property nivelEbriedad
	var property items = []
	var monedas
	
	method esUtil(unaMision) {
		return unaMision.tripulanteUtil(self)
	}
	
	method tieneItem(item) {
		return items.contains(item)
	}
	
	method tieneMenosDeXMonedas(cantidad) {
		return cantidad >= monedas
	}
	
	method cantidadItems() {
		return items.size()
	}
	
	method seAnimaASaquearVictima(unaVictima) {
		// ???
	}
	
	method puedeSerTripulanteDeBarco(unBarco) {
		return unBarco.tieneCapacidad() && self.esUtil(unBarco.mision())
	}
	
	method aumentarGrogXD(cantidad) {
		cantidad.times({_ => items.add(grogXD)})
	}
	
	method disminuirMonedas(cantidad) {
		monedas -= cantidad
	}
	
	method esEspiaDeLaCorona() {
		return !self.estaPasadoDeGrogXD()
	}

	method estaPasadoDeGrogXD() {
		return nivelEbriedad >= 90
	}
	
}