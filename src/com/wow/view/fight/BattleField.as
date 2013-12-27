package com.wow.view.fight
{
	import ext.wm.feathers.FeaSprite;
	
	import starling.display.Quad;
	
	public class BattleField extends FeaSprite
	{
		protected var _hands:HandCards;
		protected var _field:ArmyField;
		
		public function BattleField()
		{
			super();
		}
		
		protected function createQuad():void
		{
			var q:Quad = new Quad(width, height, 0x7fa45f);
			q.alpha = 0.2;
			addChild(q);
		}
		
		override protected function initialize():void
		{
			this.width = stage.stageWidth;
			this.height = stage.stageHeight / 2;
			createQuad();
			
			_hands = new HandCards(width, 120);
			addChild(_hands);
			
			_field = new ArmyField(width, 120);
			addChild(_field);
		}
		
		protected function flushHands():void
		{
			_hands.flush();
		}
		
		protected function flushArmy():void
		{
			_field.flush();
		}
		
	}
}