import Pirata_bis.*
import Mision_bis.*
import EspiaDeLaCorona_bis.*
import items.*

class Barco {
	
	const capacidad
	var tripulacion = []
	var property mision
	
	method agregarTripulante(unPirata) {
		if(unPirata.puedeSerTripulanteDeBarco(self)) {
			tripulacion.add(unPirata)
		}
	}
	
	method tieneCapacidad() {
		return capacidad > tripulacion.size()
	}
	
	method unTripulanteTiene(item) {
		return 1 <= self.tripulantesConItem(item).size()
	}
	
	method tripulantesConItem(item) {
		return tripulacion.filter({unTripulante => unTripulante.tieneItem(item)})
	}
	
	method victimaVulnerable(unaVictima) {
		// ???
	}
	
	method cambiarMision(otraMision) {
		tripulacion.removeAllSuchThat({unTripulante => not unTripulante.esUtil(otraMision)})
		mision = otraMision
	}
	
	method tripulanteMasEbrio() {
		return tripulacion.max({unTripulante => unTripulante.nivelEbriedad()})
	}
	
	method anclarEnCiudadCostera(unaCiudadCostera) { 
		tripulacion = tripulacion.forEach({unTripulante => unTripulante.aumentarGrogXD(5)})
		tripulacion = tripulacion.forEach({unTripulante => unTripulante.disminuirMonedas(1)})
		if(! tripulacion.forEach({unTripulante => unTripulante.disminuirMonedas(1)})){
			throw new Exception(message = "Cantidad de monedas insuficientes")
		}
		unaCiudadCostera.agregarHabitante(self.tripulanteMasEbrio())
		tripulacion = tripulacion.remove(self.tripulanteMasEbrio())
	}
	
	method esTemible() {
		return self.barcoUtilParaMision()
	}
	
	method barcoUtilParaMision() {
		return self.tieneSuficienteTripulacionParaMision() &&
				tripulacion.map({unTripulante => unTripulante.esUtil(mision)}) &&
				mision.barcoUtil(self)
	}
	
	method tieneSuficienteTripulacionParaMision() {
		return tripulacion.size() >= capacidad * 0.9 
	}
	
	method cantidadDeTripulantesPasadosDeGrogXD() {
		return self.tripulantesPasadosDeGrogXD().size()
	}
	
	method tripulantesPasadosDeGrogXD() {
		return tripulacion.filter({unTripulante => unTripulante.estaPasadoDeGrogXD()})
	}
	
}
