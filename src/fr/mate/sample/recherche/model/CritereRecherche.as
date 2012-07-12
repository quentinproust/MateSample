package fr.mate.sample.recherche.model 
{
	/**
	 * Information sur la recherche en cours.
	 * Contient les critères de la recherche : le type de recherche et le contenu des champs.
	 */
	[Bindable]
	public class CritereRecherche 
	{
		/** Type de la recherche. */
		public var typeRecherche:String;
		/** Nom de la personne recherche. */
		public var nomComplet:String;
		/** Identifiant du contrat. */
		public var identifiantContrat:String;
		
		/**
		 * Intialisation des informations. 
		 * On spécifie le type de recherche et on efface les autres informations.
		 * @param	typeRecherche Type de recherche.
		 */
		public function initialiser(typeRecherche:String):void {
			this.typeRecherche = typeRecherche;
			nomComplet = "";
			identifiantContrat = "";
		}
		
	}

}