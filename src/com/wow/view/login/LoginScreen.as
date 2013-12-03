package com.wow.view.login
{
	import ext.wm.feathers.WmPanelScreen;
	
	import feathers.controls.Button;
	import feathers.layout.VerticalLayout;
	
	import starling.events.Event;
	
	public class LoginScreen extends WmPanelScreen
	{
		private var _normalButton:Button;
		private var _backButton:Button;
		
		public function LoginScreen()
		{
			super();
		}
		
		override protected function initializeHandler(event:Event):void
		{
			this.headerProperties.title = "Login";
			
			const verticalLayout:VerticalLayout = new VerticalLayout();
			verticalLayout.horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_CENTER;
			verticalLayout.verticalAlign = VerticalLayout.VERTICAL_ALIGN_TOP;
			verticalLayout.padding = 20 * this.dpiScale;
			verticalLayout.gap = 16 * this.dpiScale;
			verticalLayout.manageVisibility = true;
			this.layout = verticalLayout;
			
			this._normalButton = new Button();
			this._normalButton.label = "Login";
			this._normalButton.addEventListener(Event.TRIGGERED, normalButton_triggeredHandler);
			this.addChild(this._normalButton);
		}
		
		private function normalButton_triggeredHandler(e:Event):void
		{
			this.dispatchEventWith("showCreateRole");
		}
	}
}