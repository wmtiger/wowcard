package com.wow.view.comps
{
	import com.wow.common.constant.Constant;
	import com.wow.common.utils.NormalUtil;
	import com.wow.themes.UIAssets;
	
	import flash.geom.Rectangle;
	
	import ext.wm.feathers.FeaSprite;
	
	import feathers.controls.ImageLoader;
	
	import starling.display.Image;
	
	public class CardLarge extends FeaSprite
	{
		private var _imgContent:ImageLoader;
		protected var _bg:Image;
		protected var _data:Object;
		
		public function CardLarge()
		{
			super();
			_bg = new Image(UIAssets.instance.cardLargeFaceTexture);
			addChild(_bg);
		}
		
		override protected function initialize():void
		{
			_imgContent = new ImageLoader();
			addChild(_imgContent);
			_imgContent.x = 46;
			_imgContent.y = 98;
			_imgContent.clipRect = new Rectangle(0,0,230,230);
		}

		public function get data():Object
		{
			return _data;
		}

		public function set data(value:Object):void
		{
			_data = value;
			this.invalidate(INVALIDATION_FLAG_DATA);
		}
		
		override protected function draw():void
		{
			const dataInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_DATA);
			if(dataInvalid && _imgContent)
			{
				_imgContent.source = NormalUtil.getCardImgByTid(data.tid, Constant.CARD_SIZE_LARGE);
			}
			super.draw();
		}

	}
}