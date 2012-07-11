package fr.mate.sample.model 
{
	import mx.collections.ArrayCollection;
	/**
	 * Personne.
	 */
	public class PersonneVo 
	{
		/** Id. */
		private var id:Number;
		
		/** Nom de la personne. */
		private var nomComplet:String;
		/** Date de naissance */
		private var dateNaissance:Date;
		
		/** Liste des contrats. */
		private var contrats:ArrayCollection = new ArrayCollection();
				
	}

}