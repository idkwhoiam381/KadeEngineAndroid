package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;

class OutdatedSubState extends MusicBeatState
{
	public static var leftState:Bool = false;
	private var colorRotation:Int = 1;

	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('gayblack', 'shared'));
		bg.screenCenter();
		add(bg);
		
		var txt:FlxText = new FlxText(0, 0, FlxG.width,
			"Obrigada por instalar meu port!\n"
			+ "Esse port foi feito por muito carinho\n"
			+ "Espero que você goste disso kk\nProvavel que nao.\n"
			+ "para continuar, clique na tela!\n"
			+ "Nao, eu nao vou portar outras versoes!",
			32);
		
		txt.setFormat("VCR OSD Mono", 32, FlxColor.fromRGB(200, 200, 200), CENTER);
		txt.borderColor = FlxColor.BLACK;
		txt.borderSize = 3;
		txt.borderStyle = FlxTextBorderStyle.OUTLINE;
		txt.screenCenter();
		add(txt);
	}

	override function update(elapsed:Float)
	{
		#if mobile
        var jusTouched:Bool = false;

        for (touch in FlxG.touches.list)
          if (touch.justPressed)
            jusTouched = true;
        #end
		if (controls.ACCEPT #if mobile || jusTouched #end)
		{
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}
