package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite {
	public var sprTracker:FlxSprite;

	public function new(char:String = 'bf', isPlayer:Bool = false) {
		super();
		
		loadGraphic(Paths.image('iconGrid'), true, 150, 150);

		antialiasing = true;
		animation.add('bf', [0, 1], 0, false, isPlayer);
		animation.add('bf-old', [2, 3], 0, false, isPlayer);
		animation.add('gf', [4], 0, false, isPlayer);
		animation.add('dad', [5, 6], 0, false, isPlayer);
		animation.add('san1-old', [7, 8], 0, false, isPlayer);
		animation.add('san1', [9, 10], 0, false, isPlayer);
		animation.add('sheopng', [12], 0, false, isPlayer);
		animation.add('shyllpng', [11], 0, false, isPlayer);
		animation.play(char);

		scrollFactor.set();
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
