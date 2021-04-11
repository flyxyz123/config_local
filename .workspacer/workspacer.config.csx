#r "D:\Program Files\Scoop\apps\workspacer\current\workspacer.Shared.dll"
#r "D:\Program Files\Scoop\apps\workspacer\current\plugins\workspacer.Bar\workspacer.Bar.dll"
#r "D:\Program Files\Scoop\apps\workspacer\current\plugins\workspacer.ActionMenu\workspacer.ActionMenu.dll"
#r "D:\Program Files\Scoop\apps\workspacer\current\plugins\workspacer.FocusIndicator\workspacer.FocusIndicator.dll"

using System;
using workspacer;
using workspacer.Bar;
using workspacer.ActionMenu;
using workspacer.FocusIndicator;
using workspacer.Bar.Widgets;

Action<IConfigContext> doConfig = (context) =>
{
	// Uncomment to switch update branch (or to disable updates)
	//context.Branch = Branch.None

	context.AddBar(new BarPluginConfig()
	{
		BarTitle = "workspacer.Bar",
		BarHeight = 18,
		FontSize = 10,
		DefaultWidgetForeground = Color.White,
		DefaultWidgetBackground = Color.Black,
		Background = Color.Black,
		LeftWidgets = () => new IBarWidget[] { new WorkspaceWidget(), new TextWidget(": "), new TitleWidget(){IsShortTitle = true} },
		RightWidgets = () => new IBarWidget[] { new TimeWidget(1000, "ddd, M/dd/yyyy | h:mm tt"), new ActiveLayoutWidget() },
	});	

	context.AddFocusIndicator();

	var actionMenu = context.AddActionMenu();
	
	//context.WindowRouter.AddFilter(
	//	(window) => !window.Title.Contains("VPN"));
	context.WindowRouter.AddFilter(
		(window) => !window.Title.Contains("Snip"));
	context.WindowRouter.AddFilter(
		(window) => !window.Title.Contains("Steam"));
	context.WindowRouter.AddFilter(
		(window) => !window.Title.Contains("Zoom"));
	context.WindowRouter.AddFilter(
		(window) => !window.Title.Contains("Picture-in-Picture"));

	context.WorkspaceContainer.CreateWorkspaces("1", "2", "3", "4", "5");
	context.WindowRouter.AddRoute(
		(window) => window.Title.Contains("VLC media player") ? 
		context.WorkspaceContainer["5"] : null);
	context.WindowRouter.AddRoute(
		(window) => window.Title.Contains("qBittorrent") ? 
		context.WorkspaceContainer["5"] : null);
	context.WindowRouter.AddRoute(
		(window) => window.Title.Contains("netease cloud music") ?
		context.WorkspaceContainer["5"] : null);
	
	KeyModifiers mod = KeyModifiers.Alt;	
	context.Keybinds.Unsubscribe(mod | KeyModifiers.LShift, Keys.C);
	context.Keybinds.Subscribe(mod, Keys.C, 
		() => context.Workspaces.FocusedWorkspace.CloseFocusedWindow(),
		"close focused window");
};
return doConfig;
