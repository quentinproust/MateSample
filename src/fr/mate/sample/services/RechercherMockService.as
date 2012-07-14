package fr.mate.sample.services 
{
	import fr.mate.sample.model.ContratVo;
	import fr.mate.sample.model.PersonneVo;
	import fr.mate.sample.recherche.model.*;
	import mx.collections.ArrayCollection;
	
	/**
	 * Un service simulant un appel à un service web avec BlazeDS.
	 * Ce sample se concentre sur le framework Mate donc je ne souhaite pas couvrir les appels distants pour le moment.
	 */
	public class RechercherMockService 
	{
		
		private var personnes:ArrayCollection = new ArrayCollection();
		
		/**
		 * Constructeur.
		 * Initialisation du jeu de données.
		 */
		public function RechercherMockService() 
		{
			// Personne Pierre Martin
			var pierre:PersonneVo = new PersonneVo(123, "Pierre MARTIN", new Date(1956, 05, 10));
			pierre.addContrat(new ContratVo(51005, "Assurance SuperSanté", new Date(2010, 01, 01)));
			pierre.addContrat(new ContratVo(16020, "Assurance PasTop", new Date(2000, 01, 01), new Date(2009, 12, 31)));
			personnes.addItem(pierre);
			
			// Personne Jean Dupont
			var jean:PersonneVo = new PersonneVo(250, "Jean DUPONT", new Date(1962, 10, 23));
			jean.addContrat(new ContratVo(51610, "Assurance SuperSanté", new Date(2006, 01, 01)));
			personnes.addItem(jean);
			
			// Personne Michel Dupont (ne possède aucun contrat)
			var michel:PersonneVo = new PersonneVo(511, "Michel Dupont", new Date(1949, 10, 02));
			personnes.addItem(michel);
			
			// Personne Elizabeth Durand
			var elizabeth:PersonneVo = new PersonneVo(1441, "Elizabeth Durand", new Date(1970, 01, 20));
			elizabeth.addContrat(new ContratVo(1561, "Assurance VIP", new Date(1980, 01, 01), new Date(2000, 12, 31)));
			elizabeth.addContrat(new ContratVo(1561, "Assurance Super VIP", new Date(2001, 01, 01)));
			personnes.addItem(elizabeth);
		}
		
		/**
		 * Effectue une recherche dans le jeu de données de test.
		 * @param	criteres Criteres de recherche.
		 * @return Liste de personnes trouvées.
		 */
		public function rechercher(criteres:CritereRecherche) : ArrayCollection {
			var personnesTrouvees:ArrayCollection;
			
			if (criteres.typeRecherche == TypeRecherche.PAR_NOM) {
				personnesTrouvees = rechercherPersonnes(criteres);
			}
			
			return personnesTrouvees;
			//this.dispatchEvent(ResultEvent.createEvent(personnesTrouvees));
		}
		
		private function rechercherPersonnes(criteres:CritereRecherche):ArrayCollection 
		{
			var personnesTrouvees:ArrayCollection = new ArrayCollection();
			
			for each (var personne:PersonneVo in personnes) {
				// On recherche les personnes.
				if (personne.nomComplet.toLowerCase().indexOf(criteres.nomComplet.toLowerCase()) > 0) {
					personnesTrouvees.addItem(personne);
				}
			}
			
			return personnesTrouvees;
		}
	}

}