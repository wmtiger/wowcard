package com.wow.view.friend
{
	import com.wow.setting.Setting;
	
	import ext.wm.feathers.WmPanelScreen;
	
	import feathers.controls.Button;
	import feathers.controls.List;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.data.ListCollection;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.VerticalLayout;
	import feathers.system.DeviceCapabilities;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class FriendScreen extends WmPanelScreen
	{
		private var _backButton:Button;
		private var _list:List;
		
		public function FriendScreen()
		{
			super();
		}
		
		override protected function initializeHandler(event:Event):void
		{
			this.layout = new AnchorLayout();
			
			this.headerProperties.title = "Friend";
			
			if(!DeviceCapabilities.isTablet(Starling.current.nativeStage))
			{
				this._backButton = new Button();
				this._backButton.nameList.add(Button.ALTERNATE_NAME_BACK_BUTTON);
				this._backButton.label = "User";
				this._backButton.addEventListener(Event.TRIGGERED, backButton_triggeredHandler);
				
				this.headerProperties.leftItems = new <DisplayObject>
					[
						this._backButton
					];
				
				this.backButtonHandler = this.onBackButton;
			}
			
			var items:Array = [];
			for(var i:int = 0; i < 10; i++)
			{
				var item:Object = {text: "Friend " + (i + 1).toString()};
				items[i] = item;
			}
			items.fixed = true;
			
			_list = new List();
			this._list.dataProvider = new ListCollection(items);
			this._list.typicalItem = {text: "Friend 1000"};
			this._list.isSelectable = true;
			//			this._list.allowMultipleSelection = true;// 设置的时候可以多选来删除
			this._list.hasElasticEdges = true;
			this._list.clipContent = false;
			this._list.autoHideBackground = true;
			this._list.itemRendererFactory = function():IListItemRenderer
			{
				var renderer:DefaultListItemRenderer = new DefaultListItemRenderer();
				renderer.isQuickHitAreaEnabled = true;
				renderer.labelField = "text";
				return renderer;
			};
			this._list.addEventListener(Event.CHANGE, list_changeHandler);
			this._list.layoutData = new AnchorLayoutData(0, 0, 0, 0);
			this.addChild(this._list);
		}
		
		private function list_changeHandler(event:Event):void
		{
			const selectedIndices:Vector.<int> = this._list.selectedIndices;
			trace("List onChange:", selectedIndices.length > 0 ? selectedIndices : this._list.selectedIndex);
			this.dispatchEventWith(Setting.SHOW_ONE_FRIEND);
		}
		
		override protected function removeHeader():void {}
		
		private function backButton_triggeredHandler(event:Event):void
		{
			this.onBackButton();
		}
		
		private function onBackButton():void
		{
			this.dispatchEventWith(Setting.SHOW_USER);
		}
		
	}
}