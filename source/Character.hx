package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

using StringTools;

class Character extends FlxSprite {
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';
	public var barColor:FlxColor;

	public var holdTimer:Float = 0;

	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false) {
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;
		antialiasing = true;

		switch (curCharacter) {
			case 'gf':
				frames = Paths.getSparrowAtlas('characters/GF_assets', 'shared');
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');

				barColor = 0xFFA2044B;
			case 'san1':
				// THAT MF !!!!!!
				tex = Paths.getSparrowAtlas('characters/san1', 'san1');
				frames = tex;
				animation.addByPrefix('idle', 'idle', 24);
				animation.addByPrefix('singUP', 'up', 48);
				animation.addByPrefix('singRIGHT', 'right', 30);
				animation.addByPrefix('singDOWN', 'down', 30);
				animation.addByPrefix('singLEFT', 'left', 30);
	
				addOffset('idle', -25);
				addOffset("singUP", -38, 95);
				addOffset("singRIGHT", -73, -19);
				addOffset("singLEFT", 161, -30);
				addOffset("singDOWN", -47, -68);
				
				barColor = 0xFF86FF67;

				playAnim('idle');

				// tr5va: sequel of tr4va
			case 'sheopng':
				// sheo is a bitch !!!!!!
				tex = Paths.getSparrowAtlas('characters/sheorsivpng', 'san1');
				frames = tex;
				animation.addByPrefix('idle', 'Idle', 24);
				animation.addByPrefix('singUP', 'Up', 48);
				animation.addByPrefix('singRIGHT', 'Right', 30);
				animation.addByPrefix('singDOWN', 'Down', 30);
				animation.addByPrefix('singLEFT', 'Left', 30);
	
				addOffset('idle', -25);
				addOffset("singUP", -18, 55);
				addOffset("singRIGHT", -33, -19);
				addOffset("singLEFT", 48, -15);
				addOffset("singDOWN", -8, -55);
				
				barColor = 0xFF5C5C5C;

				playAnim('idle');
			case 'shyllpng':
				// dumbass
				tex = Paths.getSparrowAtlas('characters/shyllispng', 'san1');
				frames = tex;
				animation.addByPrefix('idle', 'Idle', 24);
				animation.addByPrefix('singUP', 'Up', 48);
				animation.addByPrefix('singRIGHT', 'Right', 30);
				animation.addByPrefix('singDOWN', 'Down', 30);
				animation.addByPrefix('singLEFT', 'Left', 30);
	
				addOffset('idle', -25);
				addOffset("singUP", -68, 35);
				addOffset("singRIGHT", -73, 21);
				addOffset("singLEFT", 19, 28);
				addOffset("singDOWN", -58, -18);
				
				barColor = 0xFFFCFCFC;

				playAnim('idle');
			case 'bf':
				frames = Paths.getSparrowAtlas('characters/BOYFRIEND', 'shared');

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);

				playAnim('idle');

				flipX = true;

				barColor = 0xFF31b0d1;
		}

		dance();

		if (isPlayer)
			flipX = !flipX;
	}

	override function update(elapsed:Float) {
		if (!curCharacter.startsWith('bf')) {
			if (animation.curAnim.name.startsWith('sing')) {
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001) {
				dance();
				holdTimer = 0;
			}
		}
		super.update(elapsed);
	}

	private var danced:Bool = false;

	public function dance() {
		switch (curCharacter) {
			case 'gf':
				if (!animation.curAnim.name.startsWith('hair')) {
					danced = !danced;

					if (danced)
						playAnim('danceRight');
					else
						playAnim('danceLeft');
				}
			default:
				playAnim('idle');
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void {
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName)) {
			offset.set(daOffset[0], daOffset[1]);
		} else
			offset.set(0, 0);

		if (curCharacter == 'gf') {
			if (AnimName == 'singLEFT') {
				danced = true;
			} else if (AnimName == 'singRIGHT') {
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN') {
				danced = !danced;
			}
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0) {
		animOffsets[name] = [x, y];
	}
}
