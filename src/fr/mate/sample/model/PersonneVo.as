package fr.mate.sample.model 
{
	import mx.collections.ArrayCollection;
	/**
	 * Personne.
	 */
	[RemoteClass(alias="PersonneVo")]
	public class PersonneVo 
	{
		/** Id. */
		public var id:Number;
		
		/** Nom de la personne. */
		public var nomComplet:String;
		/** Date de naissance */
		public var dateNaissance:Date;
		
		/** Liste des contrats. */
		public var contrats:ArrayCollection = new ArrayCollection();
				
		/**
		 * Constructeur.
		 * @param	id Identifiant de la personne
		 * @param	nomComplet Nom complet
		 * @param	dateNaissance Date de naissance
		 */
		public function PersonneVo(id:Number, nomComplet:String, dateNaissance:Date) 
		{
			this.id = id;
			this.nomComplet = nomComplet;
			this.dateNaissance = dateNaissance;
		}
		
		/**
		 * Ajoute un contrat à la personne.
		 * @param	contrat Contrat
		 */
		public function addContrat(contrat:ContratVo) : void {
			contrats.addItem(contrat);
		}
	}

}