package com.wow.view.fight
{
	import com.wow.common.constant.Constant;
	import com.wow.view.comps.CardInField;
	import com.wow.view.comps.CardSmall;
	
	import ext.wm.feathers.FeaSprite;
	
	import starling.display.Quad;
	
	public class BattleField extends FeaSprite implements IBattleField
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
			
			_field = new ArmyField(width, 80);
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
		
		protected function addHands(num:int = 1, from:int = 0, id:int = -1):void
		{
		}
		
		protected function getHands():Array
		{
			return null;
		}
		
		protected function addField(id:int, from:int = 1):void
		{
		}
		
		protected function createCardSmall():CardSmall
		{
			return new CardSmall(this, 0);
		}
		
		/*IBattleField*/
		
		public function addToArmyField(id:int, from:int = 1):void{
			addField(id, from);
			
			if(from == Constant.FROM_HAND)
			{
				var d:Object = (_hands.removeCardById(id) as CardSmall).data;
				var cf:CardInField = new CardInField(this);
				cf.data = d;
				_field.addCard(cf);
			}
			flushHands();
			flushArmy();
		}
		public function removeFromArmyField(id:int):void{
		}
		public function addToHands(num:int = 1, from:int = 0, id:int = -1):void{
			addHands(num, from,id);
			
			var arr:Array = getHands();
			var l:int = arr.length;
			for(var i:int = 0;i < l; i++)
			{
				if(!_hands.chkHasCard(arr[i].id))
				{
					var cs:CardSmall = createCardSmall();
					cs.data = arr[i];
					_hands.addCard(cs);
				}
			}
			
			flushHands();
		}
		public function removeFromHands(id:int):void{
		}
		
	}
}