package com.wow.common.template
{
	import com.wow.common.cfg.CardConfig;

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
		 * 牌类型，分为：仆从(1)；技能(2)；装备(3)
		 */		
		public var type:int;
		/**
		 * 阵营，分为：1：魏，2：蜀，3：吴，4：黄巾，5：群英
		 */		
		public var camp:int;
		/**
		 * 卡牌图片id
		 */		
		public var imgId:int;
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
		 * 品质，分为：免费0；普通1；精良2；稀有3；传说4；史诗5
		 */		
		public var quality:int;
		/**
		 * 关键字，用于检索
		 */		
		public var keywords:String;
		/**
		 * 生产此牌需要的金币
		 */		
		public var creation:int;
		/**
		 * 拆分此牌得到的金币
		 */		
		public var split:int;
		/**
		 * 牌技能id列表（int）
		 */
		public var skillIds:Array;
		/**
		 * 卡牌图片特效id，没有则为0
		 */		
		public var imgEffectId:int;
		/**
		 * 卡牌攻击音效id，没有则为0
		 */		
		public var atkSndId:int;
		/**
		 * 卡牌死亡音效id，没有则为0
		 */		
		public var deadSndId:int;
		/**
		 * 卡牌加入战场音效id，没有则为0
		 */		
		public var joinFieldSndId:int;
		/**
		 * 卡牌加入战场特效id，没有则为0
		 */
		public var joinFieldEffectId:int;
		
		public function CardTemplate()
		{
		}
		
		public static function getTemp(tid:int):CardTemplate
		{
			return CardConfig.instance.dict[tid];
		}
	}
}