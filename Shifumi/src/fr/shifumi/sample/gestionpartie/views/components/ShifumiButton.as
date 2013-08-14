package fr.shifumi.sample.gestionpartie.views.components 
{
	
	import flash.events.MouseEvent;
	import fr.shifumi.sample.model.Choix;
	import mx.accessibility.ButtonAccImpl;
	import mx.controls.Button;
	import mx.controls.Alert;
			
	/**
	 * Bouton Pierre Feuille Ciseaux.
	 * @author Quentin PROUST
	 */
	public class ShifumiButton extends Button {
		
		private var _choix:Choix;
		public var isSelected:Boolean = false;
		
		public function ShifumiButton() 
		{
			this.addEventListener(MouseEvent.CLICK, function(event:MouseEvent):void {
				selectionnerBouton(!isSelected);
				this.dispatchEvent(new NouveauChoixEvent(_choix));
			});
			
			this.addEventListener(NouveauChoixEvent.EVENT_NAME, function(event:NouveauChoixEvent):void  {
				selectionnerBouton(_choix == event.choix);
			});
		}
			
		[Bindable]
		public function get choix():Choix {
			return _choix;
		}
		
		public function set choix(c:Choix):void {
			_choix = c;
			this.label = c.toString();
		}
		
		private function selectionnerBouton(select:Boolean):void {
			isSelected = select;
			// On désactive le bouton si le choix a été sélectionné
			enabled = !isSelected;
		}
	}

}