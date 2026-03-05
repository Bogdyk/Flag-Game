module core.lobby_widget;

import dlangui;
import std.conv;

class LobbyGame : VerticalLayout {
    Button _newGame;

    this() {
        super("lobby_widget");

        this.layoutWidth(FILL_PARENT).layoutHeight(FILL_PARENT);
        this.alignment = Align.Center;
        this.padding = Rect(30, 50, 30, 50);
        this.backgroundColor = 0x1A1A2E; // Цвет "Deep Space"

        auto title = new TextWidget(null, "FLAGS QUIZ"d);
        title.fontSize = 80;
        title.fontWeight = FontWeight.Bold;
        title.textColor = 0xE94560; // Яркий малиново-красный
        title.alignment = Align.Center;
        title.layoutWidth(FILL_PARENT);
        title.margins = Rect(0, 20, 0, 10);
        this.addChild(title);

        auto subTitle = new TextWidget(null, "Испытай свою интуицию!"d);
        subTitle.fontSize = 28;
        subTitle.textColor = 0x0F3460; // Контрастный синий
        subTitle.textColor = 0xE0E0E0; // Светло-серый
        subTitle.alignment = Align.Center;
        subTitle.layoutWidth(FILL_PARENT);
        subTitle.margins = Rect(0, 0, 0, 80);
        this.addChild(subTitle);

        auto btnContainer = new HorizontalLayout();
        btnContainer.layoutWidth(FILL_PARENT).layoutHeight(WRAP_CONTENT);
        btnContainer.alignment = Align.Center;

        _newGame = new Button("btn_new_game", "ИГРАТЬ"d);
        _newGame.layoutWidth(FILL_PARENT).layoutHeight(110);
        _newGame.fontSize = 40;
        _newGame.fontWeight = FontWeight.Bold;

        _newGame.textColor = 0xFFFFFF;
        _newGame.backgroundColor = 0x27AE60; // Сочный зеленый

        btnContainer.addChild(_newGame);
        this.addChild(btnContainer);

        auto infoBox = new TextWidget(null, "7 СЕКУНД НА ОТВЕТ"d);
        infoBox.fontSize = 20;
        infoBox.textColor = 0xFFD700; // Золотой
        infoBox.alignment = Align.Center;
        infoBox.layoutWidth(FILL_PARENT);
        infoBox.margins = Rect(0, 100, 0, 0);
        this.addChild(infoBox);

        auto footerLine = new Widget();
        footerLine.layoutWidth(200).layoutHeight(4);
        footerLine.backgroundColor = 0xE94560;
        footerLine.alignment = Align.Center;
        footerLine.margins = Rect(0, 20, 0, 0);
        this.addChild(footerLine);
    }
}
