import Pirata_bis.*
import Barco_bis.*
import EspiaDeLaCorona_bis.*
import items.*

object busquedaDelTesoro {
	
	method tripulanteUtil(unTripulante) {
		return (unTripulante.tieneItem(brujula) || unTripulante.tieneItem(mapa) || unTripulante.tieneItem(grogXD)) &&
		unTripulante.tieneMenosDeXMonedas(5)
	}
	
	method barcoUtil(unBarco) {
		return unBarco.unTripulanteTiene(llaveDeCofre)
	}
	
}

object convertirseEnLeyenda {
	
	var itemObligatorio
	
	method tripulanteUtil(unTripulante) {
		return unTripulante.cantidadItems() >= 10 && unTripulante.tieneItem(itemObligatorio)
	}
	
	method barcoUtil(unBarco) { 
		return true
	}
	
}

object saqueo {
	
	var victima
	var limiteDeMonedas
	
	method cambiarLimiteDeMonedas(cantidad) {
		limiteDeMonedas = cantidad
	}
	
	method tripulanteUtil(unTripulante) {
		return unTripulante.tieneMenosDeXMonedas() && unTripulante.seAnimaASaquearVictima(victima)
	}
	
	method barcoUtil(unBarco) {
		return unBarco.victimaVulnerable(victima)
	}
	
}