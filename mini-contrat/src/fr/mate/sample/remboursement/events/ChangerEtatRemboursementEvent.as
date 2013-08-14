package fr.mate.sample.remboursement.events
{
	import flash.events.Event;
	import fr.mate.sample.model.RemboursementVo;
	import fr.mate.sample.remboursement.model.CritereRemboursement;
	
	/**
	 * Event de modification de l'état d'un remboursement.
	 */
	public class ChangerEtatRemboursementEvent extends Event
	{
		public static const GET:String = "fr.mate.sample.remboursement.events.ChangerEtatRemboursementEvent";
		
		private var _remboursement:RemboursementVo;
		private var _nouvelEtat:String;
		
		public function ChangerEtatRemboursementEvent(remboursement:RemboursementVo, nouvelEtat:String)
		{
			super(GET);
			this._remboursement = remboursement;
			this._nouvelEtat = nouvelEtat;
		}
		
		public function get remboursement():RemboursementVo
		{
			return _remboursement;
		}
		
		public function get nouvelEtat():String
		{
			return _nouvelEtat;
		}
		
		public override function clone():Event
		{
			return new ChangerEtatRemboursementEvent(this._remboursement, this._nouvelEtat);
		}
		
		public override function toString():String
		{
			return formatToString("ChangerEtatRemboursementEvent", "_remboursement");
		}
	
	}

}