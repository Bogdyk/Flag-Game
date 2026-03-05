module core.main_widget;

import dlangui;
import core.countries;
import std.conv;
import std.random;

class MainWidget : VerticalLayout {
    private MyProgressBar _timerBar;
    private ImageWidget _flagImage;
    private TextWidget _feedbackText;
    private TextWidget _scoreText;
    int step = 0;
    private int _timeLeft = 7000;
    private bool _timerRunning = false;
    private ulong _timerHandle = 0;

    this() {
        super("main_widget");

        this.padding = Rect(10, 10, 10, 10);

        auto text = new TextWidget(null, "Flags Game"d);
        text.layoutWidth(FILL_PARENT);
        text.alignment = Align.Center;
        this.addChild(text);

        _timerBar = new MyProgressBar();
        this.addChild(_timerBar);

        auto textDescript = new TextWidget(null, "Угадай страну по флагу"d);
        textDescript.fontSize = 24;
        textDescript.layoutWidth(FILL_PARENT);
        textDescript.alignment = Align.Center;
        this.addChild(textDescript);

        auto flagContainer = new TableLayout();
        flagContainer.colCount = 3;
        flagContainer.backgroundColor = 0xDCDCDC;
        flagContainer.layoutWidth(FILL_PARENT);
        flagContainer.alignment = Align.Center;

        flagContainer.addChild(new Widget().layoutWidth(FILL_PARENT).layoutWeight(1));

        _flagImage = new ImageWidget(null);
        _flagImage.drawable = drawableCache.get("ua");
        _flagImage.layoutWidth(320);
        _flagImage.layoutHeight(215);
        _flagImage.alignment = Align.Center;
        flagContainer.addChild(_flagImage);

        flagContainer.addChild(new Widget().layoutWidth(FILL_PARENT).layoutWeight(1));

        this.addChild(flagContainer);

        auto btnGrid = new TableLayout();
        btnGrid.colCount = 2;
        btnGrid.layoutWidth(FILL_PARENT).layoutHeight(WRAP_CONTENT);
        btnGrid.padding = Rect(10, 20, 10, 10);

        for (int i = 0; i < 4; i++) {
            auto btn = new Button();
            btn.layoutWidth(FILL_PARENT).layoutHeight(80);
            btn.fontSize = 20;

            btn.id = "btn_answer_" ~ i.to!string;

            _answerButtons ~= btn;
            btnGrid.addChild(btn);
        }

        this.addChild(btnGrid);

        _feedbackText = new TextWidget(null, "");
        _feedbackText.fontSize = 18;
        _feedbackText.layoutWidth(FILL_PARENT);
        _feedbackText.alignment = Align.Center;
        this.addChild(_feedbackText);

        _scoreText = new TextWidget(null, "");
        _scoreText.fontSize = 18;
        _scoreText.textColor = 0x008000;
        _scoreText.layoutWidth(FILL_PARENT);
        _scoreText.alignment = Align.Center;
        this.addChild(_scoreText);
    }

    void startGame() {
        this._currentTier = 0;
        this._countryIndex = 0;
        this._scoreText.text = "";

        this.prepareTier();
    }

    void prepareTier() {
        ++this._currentTier;
        this._countryIndex = 0;

        switch (this._currentTier) {
        case 1:
            this._currentPool = randomShuffle(tier1.dup);
            break;
        case 2:
            this._currentPool = randomShuffle(tier2.dup);
            break;
        case 3:
            this._currentPool = randomShuffle(tier3.dup);
            break;
        case 4:
            this._currentPool = randomShuffle(tier4.dup);
            break;
        default:
            break;

        }
        nextQuestion();
    }

    void nextQuestion() {
        this._timeLeft = 7000;
        if (_timerHandle != 0) {
            cancelTimer(_timerHandle);
        }
        _timerRunning = true;
        _timerHandle = setTimer(10);

        if (this._countryIndex >= this._currentPool.length) {
            this.prepareTier();
            return;
        }

        _feedbackText.text = ""d;
        Country correctCountry = this._currentPool[this._countryIndex];
        _flagImage.drawable = drawableCache.get(correctCountry.code);

        Country[] choices;
        choices ~= correctCountry;

        while (choices.length < 4) {
            int rndIdx = uniform(0, cast(int) _currentPool.length);
            Country candidate = _currentPool[rndIdx];
            bool isDuplicate = false;
            foreach (c; choices) {
                if (c.code == candidate.code)
                    isDuplicate = true;
            }
            if (!isDuplicate)
                choices ~= candidate;
        }

        randomShuffle(choices);

        // Кнопка 0
        _answerButtons[0].text = choices[0].name;
        _answerButtons[0].click = delegate(Widget w) {
            this.handleAnswer(choices[0].code, correctCountry.code, correctCountry.name);
            return true;
        };

        // Кнопка 1
        _answerButtons[1].text = choices[1].name;
        _answerButtons[1].click = delegate(Widget w) {
            this.handleAnswer(choices[1].code, correctCountry.code, correctCountry.name);
            return true;
        };

        // Кнопка 2
        _answerButtons[2].text = choices[2].name;
        _answerButtons[2].click = delegate(Widget w) {
            this.handleAnswer(choices[2].code, correctCountry.code, correctCountry.name);
            return true;
        };

        // Кнопка 3
        _answerButtons[3].text = choices[3].name;
        _answerButtons[3].click = delegate(Widget w) {
            this.handleAnswer(choices[3].code, correctCountry.code, correctCountry.name);
            return true;
        };

        ++this.step;
        this._scoreText.text = "Счёт: "d ~ this.step.to!dstring;

        this.requestLayout();
    }

    void handleAnswer(string selected, string correct, dstring name) {
        _timerRunning = false;
        import std.utf : toUTF32;

        Log.d("Selected: " ~ selected ~ " Correct: " ~ correct); // Проверка в консоли
        if (selected == correct) {
            Log.d("Correct answer!");
            _feedbackText.text = "Правильный ответ!";
            this._countryIndex++;
            this.nextQuestion();
            this.requestLayout();
        } else {
            Log.d("Wrong answer!");
            _feedbackText.text = "Неправильный ответ. Правильный был: "d ~ name;

            foreach (btn; _answerButtons) {
                btn.text = "ПОПРОБОВАТЬ СНОВА"d;
                btn.click = delegate(Widget w) { this.startGame(); return true; };
            }
        }
    }

    override bool onTimer(ulong timerId) {
        if (!_timerRunning)
            return false;
        _timerRunning = true;
        if (_timeLeft <= 0) {
            _timerRunning = false;
            Country correctCountry = this._currentPool[this._countryIndex];
            handleAnswer("TIMEOUT", correctCountry.code, correctCountry.name);
            return false;
        }
        this.invalidate();

        _timeLeft -= 10;
        _timerBar.setProgress(_timeLeft);

        return true;
    }

private:
    int _currentTier = 0;
    int _countryIndex = 0;
    Country[] _currentPool;
    Button[] _answerButtons;
}

class MyProgressBar : HorizontalLayout {
    private int _max = 7000;
    private int _maxWidth = 446;

    HorizontalLayout _barData;
    TextWidget _textTic;

    this() {
        super("timer_pb");
        this.layoutHeight(40).layoutWidth(FILL_PARENT);

        auto container = new HorizontalLayout();
        container.layoutHeight(40).layoutWidth(450);
        container.backgroundColor = 0xDCDCDC;
        container.padding = Rect(2, 2, 2, 2);
        this.addChild(container);

        _barData = new HorizontalLayout();
        _barData.layoutHeight(36).layoutWidth(_maxWidth);
        _barData.backgroundColor = "red";
        container.addChild(_barData);

        _textTic = new TextWidget(null, "7"d);
        _textTic.fontSize = 40;
        _textTic.fontWeight = FontWeight.Bold;
        _textTic.layoutWidth(FILL_PARENT).layoutWeight(1);
        _textTic.alignment = Align.Center;
        this.addChild(_textTic);
    }

    // Этот метод будет вызывать MainWidget
    void setProgress(int value) {
        if (value < 0)
            value = 0;
        int newWidth = cast(int)((cast(float) value / _max) * _maxWidth);
        _barData.layoutWidth(newWidth);

        int seconds = (value + 999) / 1000;
        _textTic.text = seconds.to!dstring;
        this.requestLayout();
    }
}
