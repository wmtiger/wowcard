package com.wow.mgr
{
	import com.wow.view.fight.BattleFieldScreen;

	public class BattleMgr
	{
		private static var _instance:BattleMgr;
		
		private var _battleField:BattleFieldScreen;
		private var _isMyTurn:Boolean = false;
		
		public function BattleMgr()
		{
		}

		public static function get instance():BattleMgr
		{
			if(_instance == null)
				_instance = new BattleMgr();
			return _instance;
		}

		public function get isMyTurn():Boolean
		{
			return _isMyTurn;
		}

		public function set isMyTurn(value:Boolean):void
		{
			_isMyTurn = value;
			_battleField.setNextRoundState();
		}

		public function set battleField(value:BattleFieldScreen):void
		{
			_battleField = value;
		}

	}
}