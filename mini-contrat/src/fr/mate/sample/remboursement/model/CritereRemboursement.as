package fr.mate.sample.remboursement.model 
{
	/**
	 * Critère pour la récupération des remboursements d'une personne.
	 */
	public class CritereRemboursement 
	{
		/** Numéro du contrat. */
		public var numeroContrat:Number;
		
		/** Année */
		public var annee:Number;
		
		/**
		 * Critère pour la récupération des remboursements d'un contrat.
		 * On recherche les remboursements pour un contrat et une année donnée.
		 * @param	numeroContrat Numéro du contrat.
		 * @param	annee Année recherchée.
		 */
		public function CritereRemboursement(numeroContrat:Number, annee:Number) 
		{
			this.numeroContrat = numeroContrat;
			this.annee = annee;
		}
		
	}

}