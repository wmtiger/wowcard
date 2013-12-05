package com.wow.view.craeterole
{
	import com.wow.setting.Setting;
	
	import ext.wm.feathers.WmPanelScreen;
	
	import feathers.controls.Button;
	import feathers.controls.TextInput;
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.VerticalLayout;
	
	import starling.events.Event;
	
	public class CreateRoleScreen extends WmPanelScreen
	{
		private var _normalButton:Button;
		private var _input:TextInput;
		
		public function CreateRoleScreen()
		{
			super();
		}
		
		override protected function initializeHandler(event:Event):void
		{
			const verticalLayout:VerticalLayout = new VerticalLayout();
			verticalLayout.horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_CENTER;
			verticalLayout.verticalAlign = VerticalLayout.VERTICAL_ALIGN_MIDDLE;
			verticalLayout.padding = 20 * this.dpiScale;
			verticalLayout.gap = 16 * this.dpiScale;
			verticalLayout.manageVisibility = true;
			this.layout = verticalLayout;
			
			this._input = new TextInput();
			this._input.prompt = "Type Something";
			this._input.isEditable = true;
			const inputLayoutData:AnchorLayoutData = new AnchorLayoutData();
			inputLayoutData.horizontalCenter = 0;
			inputLayoutData.verticalCenter = 0;
			this._input.layoutData = inputLayoutData;
			this.addChild(this._input);
			
			this._normalButton = new Button();
			this._normalButton.label = "Submit";
			this._normalButton.addEventListener(Event.TRIGGERED, normalButton_triggeredHandler);
			this.addChild(this._normalButton);
		}
		
		private function normalButton_triggeredHandler(e:Event):void
		{
			this.dispatchEventWith(Setting.SHOW_USER);
		}
	}
}