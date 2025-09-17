object rolando {
    const mochila = []
    var property capacidadDeLaMochila = null 
    var estaEnCastillo = null
    const hogarActual = castilloDePiedra
    const historialDeArtefactosVistos = []
    var property poderBase = 0
    var property historialDeBatalla = 0

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

    method seLuchaUnaBatalla() {
        historialDeBatalla += 1
        poderBase = poderBase + 1
        mochila.forEach({artefacto => artefacto.incrementarUso()})
    }

    method poderDePelea() {
        return poderBase + mochila.map({artefacto => artefacto.poderDelArtefacto()}).sum()
    }

    method artefactoMasPoderosoEnMiHogar() {
        return hogarActual.espacioEnElCastilloDePiedra().map({artefacto => artefacto.poderDelArtefacto()}).max()
      
    }

    method enemigosQuePuedoVencer() {
        const enemigos = [caterina, archibaldo, astra]
        return enemigos.filter({enemigo => self.poderDePelea() > enemigo.poderDePelea()})
    }

    method moradasConquistables() {
        const enemigosQueVenci = self.enemigosQuePuedoVencer()
        return enemigosQueVenci.map({enemigo => enemigo.morada()})
      
    }

    method soyPoderoso() {
        return self.enemigosQuePuedoVencer().size() >= 3
      
    }

    method esArtefactoFatal(artefacto, enemigo) {
        return artefacto.poderDelArtefacto() + self.poderBase() > enemigo.poderDePelea()
    }

    method tengoUnArtefactoFatalPara(enemigo) {
        return mochila.any({artefacto => self.esArtefactoFatal(artefacto, enemigo)})
    
    }

    method artefactoFatalPara(enemigo) {
        return mochila.find({artefacto => self.esArtefactoFatal(artefacto, enemigo) })
    }


}

object caterina {
    var property poderDePelea = 28
    var property morada = fortalezaDeAcero 
}

object archibaldo {
    var property poderDePelea = 16
    var property morada = palacioDeMarmol  
  
}

object astra {
    var property poderDePelea = 14
    var property morada = torreDeMarfil
  
}

object fortalezaDeAcero {
  
}

object palacioDeMarmol {
  
}

object torreDeMarfil {
  
}
object espadaDelDestino {
    const dueño = rolando
    var vecesQueSeUso = 0

    method poderDelArtefacto() {
      if (dueño.historialDeBatalla() == 1) {
        return dueño.poderBase() / 2
    } else { 
        return dueño.poderBase() 
    } 
   }

    method incrementarUso() {
    vecesQueSeUso = vecesQueSeUso + 1
     
   }
   
}

object libroDeHechizos {
    var property poder = 0 
    var vecesQueSeUso = 0
    var property hechizos = []

    method incrementarUso() {
        vecesQueSeUso = vecesQueSeUso + 1
        hechizos = hechizos.drop(1)

    }

    method poderDelArtefacto () {
        if (hechizos.isEmpty())
            {return 0}
        else { return hechizos.head().poderQueAporta() }
    }
  
}

object hechizoBendicion {

    method poderQueAporta() {
        return 4 
    } 
}

object hechizosInvisibilidad {
    const personajeQueLoUsa = rolando 

    method poderQueAporta() {
        return personajeQueLoUsa.poderBase()
    }
}

object hechizoInvocacion {
    const personajeQueLoUsa = rolando

    method poderQueAporta() {
        return personajeQueLoUsa.artefactoMasPoderosoEnMiHogar()
    }
  
}

object collarDivino { 
    var property poder = 3
    const dueño = rolando
    var vecesQueSeUso = 0 

    method poderDelArtefacto() {
        if (dueño.poderBase() > 6) 
            {return poder + vecesQueSeUso}
        else {return 3 }
    } 

    method incrementarUso() {
        vecesQueSeUso = vecesQueSeUso + 1
     
   }
}

object armaduraDeAceroValyrio {
    var vecesQueSeUso = 0

    method incrementarUso() {
        vecesQueSeUso = vecesQueSeUso + 1
   }

    method poderDelArtefacto() {
        return 6
     
   }

}

object castilloDePiedra {
    const property espacioEnElCastilloDePiedra = []

    method guardarArtefactos(listaDeArtefactos) {
      espacioEnElCastilloDePiedra.addAll(listaDeArtefactos)
    }

    method queTengoEnElCastillo() {
        return espacioEnElCastilloDePiedra
    }



}

