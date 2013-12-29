package com.wow.common.model
{
	import com.wow.common.constant.Constant;
	import com.wow.common.utils.NormalUtil;

	public class BattleCardModel
	{
		private static var _instance:BattleCardModel;
		
		private var _myCardGroup:Array;// 战斗中所有的卡（我的）
		private var _myHandCard:Array;// 手牌中的卡（我的）
		private var _myFieldCard:Array;// 战场上的卡（我的）
		
		private var _otherCardGroup:Array;// 战斗中所有的卡（对方的）
		private var _otherHandCard:Array;// 手牌中的卡（对方的）
		private var _otherFieldCard:Array;// 战场上的卡（对方的）
		
		public function BattleCardModel()
		{
			init();
		}
		
		private function init():void
		{
			_myCardGroup = [];
			_myHandCard = [];
			_myFieldCard = [];
			//test
			var i:int;
			for(i = 0; i < 30; i++)
			{
				var obj:Object = {id:i,tid:int(Math.random() * 8)+1 };
				_myCardGroup.push(obj);
			}
			
			_otherCardGroup = [];
			_otherHandCard = [];
			_otherFieldCard = [];
			//test
			for(i = 100; i < 130; i++)
			{
				var obj1:Object = {id:i,tid:int(Math.random() * 8)+1};
				_otherCardGroup.push(obj1);
			}
		}
		
		public static function get instance():BattleCardModel
		{
			if(_instance == null)
				_instance = new BattleCardModel();
			return _instance;
		}
		
		/*以下是我的卡牌方法*/
		
		public function getMyHands():Array
		{
			return _myHandCard;
		}
		
		public function getMyFields():Array
		{
			return _myFieldCard;
		}
		
		public function getMyGroup():Array
		{
			return _myCardGroup;
		}
		
		/**
		 * 加入我的手牌，num为具体加入几张，from为从哪个列表取卡，id指知道具体卡的id时才用（一般是从场上移回手牌）
		 */
		public function addMyHand(num:int = 1, from:int = 0, id:int = -1):void
		{
			var arr:Array;
			if(from == Constant.FROM_GROUP)
				arr = _myCardGroup;
			else if(from == Constant.FROM_FIELD)
				arr = _myFieldCard;
			for(var i:int = 0; i < num; i++)
				_myHandCard.push(arr.shift());
		}
		
		/**
		 * 加入我的战场，id指具体卡id，from为从哪个列表取卡
		 */
		public function addMyField(id:int, from:int = 1):void
		{
			var arr:Array;
			if(from == Constant.FROM_GROUP)
				arr = _myCardGroup;
			else if(from == Constant.FROM_HAND)
				arr = _myHandCard;
			var idx:int = NormalUtil.getCardObjectIdxById(arr, id);
			if(idx >= 0)
			{
				_myFieldCard.push(arr.splice(idx,1)[0]);
			}
		}
		
		/**
		 * 获取卡牌数据，id指知道具体卡的id，from为从哪个列表取卡
		 */
		public function getMyCardById(id:int, from:int = 0):Object
		{
			if(from == Constant.FROM_GROUP)
				return NormalUtil.searchCardById(_myCardGroup, id);
			return null;
		}
		
		/*以下是对方的卡牌方法*/
		
		public function getOtherHands():Array
		{
			return _otherHandCard;
		}
		
		public function addOtherHand(num:int = 1, from:int = 0, id:int = -1):void
		{
			var arr:Array;
			if(from == Constant.FROM_GROUP)
				arr = _otherCardGroup;
			else if(from == Constant.FROM_FIELD)
				arr = _otherFieldCard;
			for(var i:int = 0; i < num; i++)
				_otherHandCard.push(arr.shift());
		}
		
		public function addOtherField(id:int, from:int = 1):void
		{
			var arr:Array;
			if(from == Constant.FROM_GROUP)
				arr = _otherCardGroup;
			else if(from == Constant.FROM_HAND)
				arr = _otherHandCard;
			var idx:int = NormalUtil.getCardObjectIdxById(arr, id);
			if(idx >= 0)
			{
				_otherFieldCard.push(arr.splice(idx,1)[0]);
			}
		}
		
		public function getOtherCardById(id:int, from:int = 0):Object
		{
			if(from == Constant.FROM_GROUP)
				return NormalUtil.searchCardById(_otherCardGroup, id);
			return null;
		}

	}
}