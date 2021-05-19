package;

import flixel.FlxState;
import flixel.FlxG;

import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import flixel.system.FlxSound;
import openfl.utils.Assets;

import openfl.Lib;

using StringTools;

class VideoState extends FlxSprite
{
	public var leSource:String = "";
	//public var transClass:FlxState;
	public var transFunction:Void->Void;
	public var notDone:Bool = true;
	public var prevSoundMultiplier:Float = 1;
	public var videoFrames:Int = 0;
	public var defaultText:String = "";
	public var doShit:Bool = false;

	public function new(source:String, frames:Int)
	{
		super();
		//transClass = toTrans;
		FlxG.autoPause = false;
		doShit = false;
		
		videoFrames = frames;
		
		var isHTML:Bool = false;
		#if web
		isHTML = true;
		#end

		GlobalVideo.get().source(source);
		GlobalVideo.get().clearPause();
		GlobalVideo.get().updatePlayer();
		GlobalVideo.get().show();
		GlobalVideo.get().restart();
		GlobalVideo.get().togglePause();
		
		/*if (useSound)
		{*/
			//vidSound = FlxG.sound.play(leSource.replace(".webm", ".ogg"));
		
			/*new FlxTimer().start(0.1, function(tmr:FlxTimer)
			{*/
				/*new FlxTimer().start(1.2, function(tmr:FlxTimer)
				{
					if (useSound)
					{
						vidSound.time = vidSound.length * soundMultiplier;
					}
				}, 0);*/
				doShit = true;
			//}, 1);
		//}
	}
	
	override function update(elapsed:Float)
	{
		super.update(elapsed);
		
		GlobalVideo.get().update(elapsed);
		
		if (GlobalVideo.get().ended || GlobalVideo.get().stopped)
		{
			GlobalVideo.get().stop();
		}
		
		if (GlobalVideo.get().ended)
		{
			notDone = false;
		}
		
		GlobalVideo.get().restarted = false;
		GlobalVideo.get().stopped = false;
		GlobalVideo.get().ended = false;
	}
}