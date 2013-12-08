package com.wow.view.fight
{
	import feathers.controls.LayoutGroup;
	import feathers.layout.HorizontalLayout;
	
	public class ArmyField extends LayoutGroup
	{
		public function ArmyField()
		{
			super();
			var layout:HorizontalLayout = new HorizontalLayout();
			layout.horizontalAlign = HorizontalLayout.HORIZONTAL_ALIGN_CENTER;
			layout.gap = 5;
			layout.padding = 20;
			this.layout = layout;
		}
	}
}