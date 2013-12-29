package com.wow.common.vo
{
	public class CardVO
	{
		/**
		 * 当前卡牌的唯一id
		 */		
		public var id:int;
		/**
		 * 当前卡牌的模板id
		 */		
		public var tid:int;
		/**
		 * 当前卡牌的消耗
		 */		
		public var cost:int;
		/**
		 * 当前卡牌的攻击力
		 */		
		public var atk:int;
		/**
		 * 当前卡牌的生命值
		 */		
		public var hp:int;
		/**
		 * 当前状态列表，手牌或者场上的卡，都会有影响，等同于增减益效果列表
		 */		
		public var buffs:Array;
		
		public function CardVO()
		{
		}
	}
}