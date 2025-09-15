object rolando {
    const mochila = []
    var capacidadDeLaMochila = 2
    var estaEnCastillo = null
    var hogarActual = castilloDePiedra
    const historialDeArtefactosVistos = []

    method encontreUnArtefacto(artefacto) {
        historialDeArtefactosVistos.add(artefacto)
        self.validarRecolectarArtefacto()
        mochila.add(artefacto)
    }

    method validarRecolectarArtefacto() {
        if (mochila.size() >= capacidadDeLaMochila)
        {self.error("No puedo recolectar mas artefactos")}
    }

    method artefactosEncima() {
        return mochila  
    }

    method llegarAlCastillo() {
        estaEnCastillo = true
        hogarActual.guardarArtefactos(mochila)
        mochila.clear()
    }

    method tengoEsteArtefacto(artefacto) {
        return self.artefactosEnMochilaYCastillo().contains(artefacto)
    }

    method artefactosEnMochilaYCastillo() {
        return hogarActual.queTengoEnElCastillo() + (mochila)
    }

    method historialDeArtefactos() {
        return historialDeArtefactosVistos 
      
    }

}


object espadaDelDestino {

}

object libroDeHechizos {
  
}

object collarDivino {
  
}

object armaduraDeAceroValyrio {
  
}

object castilloDePiedra {
    const espacioEnElCastilloDePiedra = []

    method guardarArtefactos(listaDeArtefactos) {
      espacioEnElCastilloDePiedra.addAll(listaDeArtefactos)
    }

    method queTengoEnElCastillo() {
        return espacioEnElCastilloDePiedra
    }
}

