package com.wow.common.model
{
	import com.wow.common.vo.CardGroupVO;
	import com.wow.common.vo.CardVO;

	public class CardModel
	{
		private static var _instance:CardModel;
		
		private var _allCards:Array;//玩家所有的卡
		private var _cardGroups:Array;//玩家所有的卡组
		
		public function CardModel()
		{
			_allCards = [];
			_cardGroups = [];
		}

		public static function get instance():CardModel
		{
			if(_instance == null)
				return _instance = new CardModel();
			return _instance;
		}
		
		public function addCardInAll(vo:CardVO):void
		{
			_allCards.push(vo);
		}
		
		public function resetAllCards(arr:Array):void
		{
			_allCards = arr;
		}
		
		public function getAllCards():Array
		{
			return _allCards;
		}
		
		public function addCardGroup(vo:CardGroupVO):void
		{
			_cardGroups.push(vo);
		}
		
		public function resetCardGroups(arr:Array):void
		{
			_cardGroups = arr;
		}
		
		public function getCardGroups():Array
		{
			return _cardGroups;
		}

	}
}