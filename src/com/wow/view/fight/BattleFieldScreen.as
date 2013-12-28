package com.wow.view.fight
{
	import com.wow.common.model.CardModel;
	import com.wow.mgr.BattleMgr;
	import com.wow.net.SocketCmd;
	import com.wow.net.SocketService;
	import com.wow.view.comps.SearchFighterPanel;
	
	import flash.utils.setTimeout;
	
	import ext.wm.feathers.WmPanelScreen;
	
	import feathers.controls.Button;
	import feathers.core.PopUpManager;
	import feathers.layout.AnchorLayout;
	
	import flashx.textLayout.tlf_internal;
	
	import starling.events.Event;
	
	public class BattleFieldScreen extends WmPanelScreen
	{
		private var _mbf:MyBattleField;
		private var _ebf:EnemyBattleField;
		
		private var _nextRound:Button;
				
		public function BattleFieldScreen()
		{
			super();
			BattleMgr.instance.battleField = this;
		}
		
		override protected function initializeHandler(event:Event):void
		{
			this.layout = new AnchorLayout();
			
			var sfp:SearchFighterPanel = new SearchFighterPanel();
			PopUpManager.addPopUp(sfp);
			SocketService.instance.send(SocketCmd.ROOM_JOIN, null, function (obj:Object):void 
			{
				if (obj.state == 1) 
				{
					PopUpManager.removePopUp(sfp);
					startFight();
				}
			});
		}
		
		public function startFight():void
		{
			
			initCard();
			
			_ebf = new EnemyBattleField();
			addChild(_ebf);
			
			_mbf = new MyBattleField();
			addChild(_mbf);
			_mbf.y = stage.stageHeight / 2;
			
			_nextRound = new Button();
			_nextRound.label = "NextRound";
			addChild(_nextRound);
			_nextRound.width = 160;
			_nextRound.height = 50;
			_nextRound.x = stage.stageWidth - 160;
			_nextRound.y = stage.stageHeight - 50 >> 1;
			_nextRound.addEventListener(Event.TRIGGERED, onTriRound);
			
			BattleMgr.instance.isMyTurn = true;
		}
		
		private function onTriRound():void
		{
			BattleMgr.instance.isMyTurn = !BattleMgr.instance.isMyTurn;
		}
		
		public function setNextRoundState():void
		{
			if(BattleMgr.instance.isMyTurn)
			{
				_nextRound.isEnabled = true;
				_nextRound.label = "OverRound";
			}
			else
			{
				_nextRound.isEnabled = false;
				_nextRound.label = "EnemyRound";
				
				setTimeout(enemyAI_1, 500);
			}
		}
		
		private function enemyAI_1():void
		{
			var r:Boolean = int(Math.random() * 100) > 40;
//			trace(r);
			if(r)
			{
				_ebf.addToHands(1);
				setTimeout(enemyAI_3, 1000);
			}
			else
				setTimeout(enemyAI_2, 1000);
		}
		
		private function enemyAI_2():void
		{
			var arr:Array = CardModel.instance.getOtherHands();
//			trace(arr.length);
			if(arr.length <= 0)
			{
				BattleMgr.instance.isMyTurn = true;
				return;
			}
			var id:int = arr[0].id;
			_ebf.addToArmyField(id);
			setTimeout(enemyAI_3, 1000);
		}
		
		private function enemyAI_3():void
		{
			BattleMgr.instance.isMyTurn = true;
		}
		
		private function initCard():void
		{
//			CardModel.instance.addMyHand(4);
//			CardModel.instance.addOtherHand(4);
		}
		
	}
}