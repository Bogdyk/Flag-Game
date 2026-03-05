import std.stdio;
import dlangui;
import core.main_widget;
import core.lobby_widget;

mixin APP_ENTRY_POINT;

extern (C) int UIAppMain(string[] args) {
	embeddedResourceList.addResources(embedResourcesFromList!("resource.list")());
	Window window = Platform.instance.createWindow(
		"Flag Game -- Bgdyk"d,
		null, WindowFlag.Modal | WindowFlag.ExpandSize, 500, 500

	);

	window.show();

	auto newGame = new LobbyGame();
	auto game = new MainWidget();

	window.mainWidget = newGame;

	newGame._newGame.click = delegate(Widget w) {
		window.mainWidget = game;
		game.startGame();
		return true;
	};

	return Platform.instance.enterMessageLoop();
}
