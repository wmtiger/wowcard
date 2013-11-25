package com.wow.common.template
{
	public class CardTemplate
	{
		/**
		 * 此牌的tid，即：模板id
		 */		
		public var tid:int;
		/**
		 * 牌名字
		 */		
		public var name:String;
		/**
		 * 牌描述
		 */		
		public var desc:String;
		/**
		 * 牌类型，分为：技能(1)；仆从(2)；装备(3)
		 */		
		public var type:int;
		/**
		 * 种族，分为：人类1；精灵2；兽人3；亡灵4；(动物5；鱼人6；纳珈7...)
		 */		
		public var race:int;
		/**
		 * 关键字，用于检索
		 */		
		public var keywords:String;
		/**
		 * 生产此牌需要的金币
		 */		
		public var creation:int;
		/**
		 * 来源，分为：基本牌1；专家牌2
		 */		
		public var from:int;
		/**
		 * 品质，分为：免费0；普通1；精良2；传说3；史诗4
		 */		
		public var quality:int;
		/**
		 * 默认使用费用
		 */		
		public var cost:int;
		/**
		 * 默认攻击力
		 */		
		public var atk:int;
		/**
		 * 默认生命值
		 */		
		public var hp:int;
		/**
		 * 牌技能id
		 */
		public var skillId:int;
		/**
		 * 卡牌图片id
		 */		
		public var imgId:int;
		/**
		 * 卡牌特效id，没有则为0
		 */		
		public var effectId:int;
		/**
		 * 卡牌音效id，没有则为0
		 */		
		public var sndId:int;
		
		public function CardTemplate()
		{
		}
	}
}