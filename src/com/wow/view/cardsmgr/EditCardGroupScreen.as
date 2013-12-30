package com.wow.view.cardsmgr
{
	import com.wow.common.model.CardModel;
	import com.wow.setting.Setting;
	import com.wow.utils.CardMgrUtil;
	
	import ext.wm.feathers.WmPanelScreen;
	
	import feathers.controls.Button;
	import feathers.controls.ButtonGroup;
	import feathers.controls.List;
	import feathers.core.IFeathersControl;
	import feathers.data.ListCollection;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import feathers.system.DeviceCapabilities;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class EditCardGroupScreen extends WmPanelScreen
	{
		private var _leftList:List;
		private var _rightList:List;
		
		public var selectedCardGroup:Object;
		private var _backButton:Button;
		private var _friendButton:Button;
		private var _buttonGroup:ButtonGroup;
		
		public function EditCardGroupScreen()
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
		
		private function initBody():void
		{
			_leftList = new List();
			this._leftList.dataProvider = new ListCollection(CardMgrUtil.getAllCardObjList(CardModel.instance.getCardGroups()[0].cards));
			this._leftList.isSelectable = true;
			this._leftList.hasElasticEdges = true;
			this._leftList.clipContent = false;
			this._leftList.autoHideBackground = true;
			this._leftList.itemRendererProperties.labelField = "text";
			this._leftList.itemRendererProperties.iconSourceField = "icon";
			this._leftList.itemRendererProperties.iconPosition = Button.ICON_POSITION_LEFT;
			this._leftList.itemRendererProperties.height = 90;
			this._leftList.addEventListener(Event.CHANGE, list_changeHandler);
			this._leftList.layoutData = new AnchorLayoutData(0, 0, 0, 0);
			this.addChild(this._leftList);
		}
		
		private function list_changeHandler(event:Event):void
		{
			const selectedIndices:Vector.<int> = this._leftList.selectedIndices;
			trace("List onChange:", selectedIndices.length > 0 ? selectedIndices : this._leftList.selectedIndex);
			selectedCardGroup.idx = _leftList.selectedIndex;
		}
		
		private function initHeader():void
		{
			if(!DeviceCapabilities.isTablet(Starling.current.nativeStage))
			{
				this._backButton = new Button();
				this._backButton.nameList.add(Button.ALTERNATE_NAME_BACK_BUTTON);
				this._backButton.label = "BackCardMgr";
				this._backButton.addEventListener(Event.TRIGGERED, backButton_triggeredHandler);
				
				this.headerProperties.leftItems = new <DisplayObject>
					[
						this._backButton
					];
				
				this.backButtonHandler = this.onBackButton;
			}
			
			this.headerProperties.title = "" + selectedCardGroup.label;
		}
		
		private function initFooter():void
		{
			this._buttonGroup = new ButtonGroup();
			this._buttonGroup.dataProvider = new ListCollection(
				[
					{ label: "编辑卡组", triggered: editCardGroup_triggeredHandler }
				]);
			this._buttonGroup.direction = ButtonGroup.DIRECTION_HORIZONTAL;
			
			this.footerFactory = function ():IFeathersControl
			{
				return _buttonGroup;
			}
		}
		
		private function editCardGroup_triggeredHandler(e:Event):void
		{
			
		}
		
		private function backButton_triggeredHandler(e:Event):void
		{
			onBackButton();
		}
		
		private function onBackButton():void
		{
			this.dispatchEventWith(Setting.SHOW_CARD_MGR);
		}
		
		override protected function removeHeader():void {}
		
	}
}