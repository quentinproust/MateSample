package fr.mate.sample.model
{
	
	/**
	 * Contract.
	 */
	[RemoteClass(alias = "ContratVo")]
	[Bindable]
	public class ContratVo
	{
		
		/** Id. */
		public var id:Number;
		
		/** Type du contrat. */
		public var type:String;
		
		/** Date d'ouverture du contrat. */
		public var dateOuverture:Date;
		/** Date de cloture du contrat. Peut être null. */
		public var dateCloture:Date;
				
		public function ContratVo(id:Number = 0, type:String = null, dateOuverture:Date = null, dateCloture:Date = null)
		{
			this.id = id;
			this.type = type;
			this.dateOuverture = dateOuverture;
			this.dateCloture = dateCloture;
		}
	
	}

}