package fr.mate.sample.model 
{
	/**
	 * Contract.
	 */
	public class ContratVo 
	{
		
		/** Id. */
		private var id:Number;
		
		/** Type du contrat. */
		private var type:String;
		
		/** Date d'ouverture du contrat. */
		private var dateOuverture:Date;
		/** Date de cloture du contrat. Peut être null. */
		private var dateCloture:Date;
		
		public function ContractVo() 
		{
			
		}
		
	}

}