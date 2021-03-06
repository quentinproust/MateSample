package fr.mate.sample.services
{
	import fr.mate.sample.model.*;
	import fr.mate.sample.remboursement.model.*;
	import mx.collections.*;
	
	/**
	 * Un service simulant un appel à un service web avec BlazeDS.
	 * Ce sample se concentre sur le framework Mate donc je ne souhaite pas couvrir les appels distants pour le moment.
	 */
	public class RemboursementMockService
	{
		
		private var remboursements:Array = new Array();
		
		/**
		 * Constructeur.
		 * Initialisation du jeu de données.
		 */
		public function RemboursementMockService()
		{
			remboursements[51005] = new ArrayCollection();
			// 2012
			remboursements[51005].addItem(new RemboursementVo(1, "Accident de vélo", 33.3, new Date(2012, 06, 10), null, EtatRemboursement.EN_ATTENTE));
			remboursements[51005].addItem(new RemboursementVo(2, "Rendez-vous médecin", 25.20, new Date(2012, 02, 20), new Date(2012, 03, 01), EtatRemboursement.REMBOURSER));
			// 2011
			remboursements[51005].addItem(new RemboursementVo(3, "Rendez-vous médecin - correction", 25.20, new Date(2011, 03, 23), new Date(2011, 04, 01), EtatRemboursement.REMBOURSER));
			remboursements[51005].addItem(new RemboursementVo(4, "Rendez-vous médecin", 2520, new Date(2011, 03, 10), null, EtatRemboursement.INVALIDE));
			remboursements[51005].addItem(new RemboursementVo(5, "Dentiste", 45.15, new Date(2011, 02, 01), new Date(2011, 03, 01), EtatRemboursement.REMBOURSER));
			remboursements[51005].addItem(new RemboursementVo(6, "Ophtalmologiste", 31.20, new Date(2011, 02, 21), new Date(2011, 03, 01), EtatRemboursement.REMBOURSER));
		}
		
		/**
		 * Effectue une recherche dans le jeu de données de test.
		 * @param	criteres Criteres de recherche.
		 * @return Liste de remboursements trouvés.
		 */
		public function rechercher(criteres:CritereRemboursement):ArrayCollection
		{
			// On récupère les remboursements du contrat.
			var remboursementsContrat:ArrayCollection = this.remboursements[criteres.numeroContrat];
			
			var remboursementsTrouves:ArrayCollection = new ArrayCollection();
			
			// Pour les remboursement du contrat, on ne récupère que les remboursements de l'année demandée.
			for each (var rmb:RemboursementVo in remboursementsContrat)
			{
				if (rmb.dateReceptionDemande.fullYear == criteres.annee)
				{
					remboursementsTrouves.addItem(rmb);
				}
			}
			
			return remboursementsTrouves;
		}
		
		/**
		 * Récupération des remboursements en attente de validation pour un contrat.
		 * @param	numeroContrat Numéro du contrat.
		 * @return Liste de remboursements trouvés.
		 */
		public function rechercherInvalides(numeroContrat:Number):ArrayCollection {
			var remboursementsTrouves:ArrayCollection = new ArrayCollection();
			
			// On récupère les remboursements du contrat.
			var remboursementsContrat:ArrayCollection = this.remboursements[numeroContrat];
			
			// Pour les remboursement du contrat, on ne récupère que les remboursements de l'année demandée.
			for each (var rmb:RemboursementVo in remboursementsContrat)
			{
				if (rmb.etatRemboursement == EtatRemboursement.EN_ATTENTE)
				{
					remboursementsTrouves.addItem(rmb);
				}
			}
			
			return remboursementsTrouves;
		}
		
		/**
		 * Modification de l'état d'un remboursement.
		 * @param	remboursement Remboursement.
		 * @param	etat Nouvel état du remboursement.
		 */
		public function changerStatutRemboursement(remboursement:RemboursementVo, etat:String) :void {
			remboursement.etatRemboursement = etat;
		}
	}

}
