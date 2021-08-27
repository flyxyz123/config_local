//#r "D:\Program Files\Scoop\apps\workspacer\current\workspacer.Shared.dll"
//#r "D:\Program Files\Scoop\apps\workspacer\current\plugins\workspacer.Bar\workspacer.Bar.dll"
//#r "D:\Program Files\Scoop\apps\workspacer\current\plugins\workspacer.ActionMenu\workspacer.ActionMenu.dll"
//#r "D:\Program Files\Scoop\apps\workspacer\current\plugins\workspacer.FocusIndicator\workspacer.FocusIndicator.dll"

#r "G:\ComputerStudy\github\workspacer\src\workspacer\bin\Release\net5.0-windows\win10-x64\workspacer.Shared.dll"
#r "G:\ComputerStudy\github\workspacer\src\workspacer\bin\Release\net5.0-windows\win10-x64\plugins\workspacer.Bar\workspacer.Bar.dll"
#r "G:\ComputerStudy\github\workspacer\src\workspacer\bin\Release\net5.0-windows\win10-x64\plugins\workspacer.ActionMenu\workspacer.ActionMenu.dll"
#r "G:\ComputerStudy\github\workspacer\src\workspacer\bin\Release\net5.0-windows\win10-x64\plugins\workspacer.FocusIndicator\workspacer.FocusIndicator.dll"

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
		BarHeight = 22,
		FontSize = 10,
		DefaultWidgetForeground = Color.White,
		DefaultWidgetBackground = Color.Black,
		Background = Color.Black,
		LeftWidgets = () => new IBarWidget[] { new WorkspaceWidget(), new ActiveLayoutWidget(), new TitleWidget(){IsShortTitle = true} },
		RightWidgets = () => new IBarWidget[] { new TimeWidget(200, "ddd MM/dd HH:mm |"), new BatteryWidget() },
	});

	context.AddFocusIndicator();
	//var actionMenu = context.AddActionMenu();

	context.WindowRouter.AddFilter(w => !w.ProcessName.Contains("steam"));
	context.WindowRouter.AddFilter(w => !w.ProcessFileName.Equals("Zoom.exe"));
	context.WindowRouter.AddFilter(w => !w.Title.Contains("Picture-in-Picture"));
	context.WindowRouter.AddFilter(w => !w.Title.Contains("Wallpaper UI"));
	context.WindowRouter.AddFilter(w => !w.Title.Contains("VPN"));
	// https://github.com/Zweihander-Main/zweidotfiles/blob/master/dot_workspacer/workspacer.config.csx
	context.WindowRouter.AddFilter(w => !w.Class.Equals("#32770")); // Deletion dialog
	context.WindowRouter.AddFilter(w => !w.Class.Equals("OperationStatusWindow")); // Copying dialog

	context.WorkspaceContainer.CreateWorkspaces("1","2","3","4","5","6","7","8","9");
	context.WindowRouter.AddRoute(
		w => w.Title.Contains("VLC media player") ? 
		context.WorkspaceContainer["4"] : null);
	context.WindowRouter.AddRoute(
		w => w.Title.Contains("qBittorrent") ? 
		context.WorkspaceContainer["4"] : null);
	context.WindowRouter.AddRoute(
		w => w.ProcessFileName.Equals("cloudmusic.exe") ?
		context.WorkspaceContainer["4"] : null);
	context.WindowRouter.AddRoute(
		w => w.ProcessFileName.Equals("TTKService.exe") ?
		context.WorkspaceContainer["4"] : null);
	context.WindowRouter.AddRoute(
		w => w.Title.Equals("netease cloud music unblocked") ?
		context.WorkspaceContainer["5"] : null);

	//KeyModifiers mod = KeyModifiers.Alt;
	//context.Keybinds.Unsubscribe(mod | KeyModifiers.LShift, Keys.C);
	//context.Keybinds.Subscribe(mod, Keys.C, 
	//	() => context.Workspaces.FocusedWorkspace.CloseFocusedWindow(),
	//	"close focused window");

};
return doConfig;
