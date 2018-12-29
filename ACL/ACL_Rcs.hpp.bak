/*------------------------------------------------------------------------
=ATM= AMBIENT CIVILIAN LIFE

by Mercier
http://atmarma.fr/forum/portal.php
------------------------------------------------------------------------*/

#define FontM "PuristaMedium"

#define ST_LEFT  					0
#define ST_RIGHT 					1
#define ST_CENTER   				2
#define ST_FRAME 					64
#define ST_PICTURE 				48

#define CT_STATIC   				0
#define CT_BUTTON   				1
#define CT_EDIT 						2
#define CT_COMBO   				4
#define CT_LISTBOX   				5
#define CT_ACTIVETEXT 			11
#define CT_STRUCTURED_TEXT 	13

class ACL_RcsButton
{
	idc = -1;
	type = 1;
	style = 2;
	font = "PuristaMedium";
	sizeEx = 0.03;
	colorText[] = {1,1,1,1}; //COULEUR TEXTE (BLANC)
	colorFocused[] = {0.51765,0.18431,0.18431,0}; //CLIGNOTE (ROUGE)
	colorShadow[] = {0.8,0.8,0.8,0}; //COULEUR OMBRES
	colorBorder[] = {0.5,0.5,0.5,0}; //COULEUR BORDURES
	colorBackground[] = {0,0,0,1};
	colorBackgroundActive[] = {0,0,0,1};
	colorDisabled[] = {0,0,0,1};
	colorBackgroundDisabled[] = {0,0,0,1};
	borderSize = 0;
	offsetX = 0;
	offsetY = 0;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	soundEnter[] = {"",0,1};
	soundPush[] = {"",0,1};
	soundClick[] = {"",0,1};
	soundEscape[] = {"",0,1};
};
class ACL_RcsPicture
{
	idc = -1;
	moving = 1;
	sizeEx = 0.023;
	type = CT_STATIC;
	style = ST_PICTURE;
	colorText[] = {1,1,1,1};
	colorBackground[] = {1,1,1,0};
	font = "PuristaMedium";
};
class ACL_RscStructuredText
{
	access = 0;
	type = CT_STRUCTURED_TEXT;
	idc = -1;
	style = 0;
	text = "";
	font = "PuristaMedium";
	shadow = 2;
	sizeEx = 0.03;
	colorBackground[] = {1,1,1,0}; 
	colorText[] = {1,1,1,1};
	class Attributes
	{
		font = "PuristaMedium";
		color = "#111";
		align = "Left";
		shadow = 1;
	};
};
class ACL_RcsFrame
{
	idc = -1;
	type = CT_STATIC; 
	style = ST_LEFT;	
	font = "PuristaMedium";
	text = "";
	sizeEx = 0.03; 		
	colorText[] = {0,0,0,0};		
	colorBackground[] = {1,1,1,0};
};

// =============================== CADRE ===============================
class RcsDialog_ACL
{
	idd = 1500;
	movingEnable = 1;
	onLoad = "uiNamespace setVariable ['ACL_Display', (_this select 0)]";
	controlsBackground[] = {};
	objects[] = {};
	class Controls
	{
		class RcsPicture_CARD : ACL_RcsPicture
		{
			idc = 1200;
			text = "ACL\id_card.paa";
			size = 0.03;
			x = 0.37 * safezoneW + safezoneX;
			y = 0.35 * safezoneH + safezoneY;
			w = 0.32 * safezoneW;
			h = 0.27 * safezoneH;
		};
		class RcsText_1 : ACL_RscStructuredText
		{
			idc = 1201;
			style = ST_LEFT;
			text = "NATIONAL IDENTITY CARD";
			font = "PuristaBold";
			shadow = 0.3;
			size = 0.03;
			x = 0.41 * safezoneW + safezoneX;
			y = 0.365 * safezoneH + safezoneY;
			w = 0.27 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class RcsText_2 : ACL_RscStructuredText
		{
			idc = 1202;
			style = ST_LEFT;
			text = "COUNTRY";
			font = "PuristaBold";
			shadow = 0.3;
			size = 0.03;
			x = 0.48 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class RcsText_INTEL_1 : ACL_RscStructuredText
		{
			idc = 1203;
			style = ST_LEFT;
			text = "INTEL 1";
			font = "PuristaBold";
			shadow = 0.3;
			size = 0.03;
			x = 0.48 * safezoneW + safezoneX;
			y = 0.47 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.135 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RcsText_INTEL_2 : ACL_RscStructuredText
		{
			idc = 1204;
			style = ST_LEFT;
			text = "INTEL 2";
			font = "PuristaBold";
			shadow = 0.3;
			size = 0.03;
			x = 0.57 * safezoneW + safezoneX;
			y = 0.47 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.135 * safezoneH;
			colorBackground[] = {1,1,1,0};
		};
	};
};