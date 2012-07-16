package fr.mate.sample.model
{
	
	/**
	 * Remboursement dû à une personne suite à un accident, une maladie ...
	 */
	public class RemboursementVo
	{
		/** Motif du remboursement. */
		public var motif:String;
		
		/** Montant du remboursement. */
		public var montant:Number;
		
		/** Date de réception de la demande de remboursement */
		public var dateReceptionDemande:Date;
		
		/** Date du remboursement. */
		public var dateRemboursement:Date;
		
		/** Etat du remboursement. */
		public var etatRemboursement:String;
		
		/**
		 * Contructeur du remboursement.
		 * @param	motif Motif du remboursement.
		 * @param	montant Montant du remboursement.
		 * @param	dateRemboursement Date du remboursement.
		 */
		public function RemboursementVo(motif:String = null, montant:Number = 0, dateReceptionDemande:Date = null, dateRemboursement:Date = null, etat:String = null)
		{
			this.motif = motif;
			this.montant = montant;
			this.dateRemboursement = dateRemboursement;
			this.dateReceptionDemande = dateReceptionDemande;
			this.etatRemboursement = etat;
		}
	
	}

}