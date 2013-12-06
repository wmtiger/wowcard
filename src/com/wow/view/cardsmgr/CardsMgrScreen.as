package com.wow.view.cardsmgr
{
	import com.wow.setting.Setting;
	
	import ext.wm.feathers.WmPanelScreen;
	
	import feathers.controls.Button;
	import feathers.controls.ButtonGroup;
	import feathers.controls.List;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.core.IFeathersControl;
	import feathers.data.ListCollection;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import feathers.system.DeviceCapabilities;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class CardsMgrScreen extends WmPanelScreen
	{
		private var _editCardButton:Button;
		private var _userButton:Button;
		private var _list:List;
		private var _buttonGroup:ButtonGroup;
		
		public var selectedCardGroup:Object;
		
		public function CardsMgrScreen()
		{
			super();
		}
		
		override protected function initializeHandler(event:Event):void
		{
			this.layout = new AnchorLayout();
			
			initHeader();
			initBody();
			initFooter();
			
		}
		
		private function initFooter():void
		{
			this._buttonGroup = new ButtonGroup();
			this._buttonGroup.dataProvider = new ListCollection(
				[
					{ label: "AddCardGroup", triggered: add_triggeredHandler },
					{ label: "SeeAllCard", triggered: seeAll_triggeredHandler },
					{ label: "Fight", triggered: fight_triggeredHandler }
				]);
			this._buttonGroup.direction = ButtonGroup.DIRECTION_HORIZONTAL;
			
			this.footerFactory = function ():IFeathersControl
			{
				return _buttonGroup;
			}
		}
		
		private function initBody():void
		{
			var items:Array = [];
			for(var i:int = 0; i < 4; i++)
			{
				var item:Object = {text: "CardGroup " + (i + 1).toString()};
				items[i] = item;
			}
			items.fixed = true;
			
			_list = new List();
			this._list.dataProvider = new ListCollection(items);
			this._list.typicalItem = {text: "CardGroup 1000"};
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
		
		private function initHeader():void
		{
			if(!DeviceCapabilities.isTablet(Starling.current.nativeStage))
			{
				this._userButton = new Button();
				this._userButton.nameList.add(Button.ALTERNATE_NAME_BACK_BUTTON);
				this._userButton.label = "User";
				this._userButton.addEventListener(Event.TRIGGERED, userButton_triggeredHandler);
				
				this.headerProperties.leftItems = new <DisplayObject>
					[
						this._userButton
					];
				
				this.backButtonHandler = this.onUserButton;
			}
			
			this.headerProperties.title = "CardMgr";
			
			this._editCardButton = new Button();
			this._editCardButton.label = "EditCardGroup";
			this._editCardButton.addEventListener(Event.TRIGGERED, editCardButton_triggeredHandler);
			
			this.headerProperties.rightItems = new <DisplayObject>
				[
					this._editCardButton
				];
			
		}
		
		private function add_triggeredHandler(event:Event):void
		{
			
		}
		
		private function seeAll_triggeredHandler(event:Event):void
		{
			
		}
		
		private function fight_triggeredHandler(event:Event):void
		{
			this.dispatchEventWith(Setting.SHOW_BATTLE_FIELD);
		}
		
		private function list_changeHandler(event:Event):void
		{
			const selectedIndices:Vector.<int> = this._list.selectedIndices;
			trace("List onChange:", selectedIndices.length > 0 ? selectedIndices : this._list.selectedIndex);
			selectedCardGroup.idx = _list.selectedIndex;
			selectedCardGroup.label = _list.selectedItem.text;
			this.dispatchEventWith(Setting.SHOW_EDIT_CARD_GROUP);
		}
		
		private function onUserButton():void
		{
			this.dispatchEventWith(Setting.SHOW_USER);
		}
		
		private function editCardButton_triggeredHandler(e:Event):void
		{
			
		}
		
		private function userButton_triggeredHandler(e:Event):void
		{
			onUserButton();
		}
		
		override protected function removeHeader():void {}
		
	}
}