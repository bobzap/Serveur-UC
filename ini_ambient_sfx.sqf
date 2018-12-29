// by ALIAS

=================================================
============ FIREFLIES
[object_name] execvm "AL_ambient_SFX\firefly.sqf";

object_name - string, the name of the object you use as a source for the SFX

============ EXAMPLE
[fly] execvm "AL_ambient_SFX\firefly.sqf";


=================================================
============ AURORA BOREALIS
[object_name] execvm "AL_ambient_SFX\aurora.sqf";

object_name - string, the name of the object you use as a source for the SFX

============ EXAMPLE
[aurora_1] execvm "AL_ambient_SFX\aurora.sqf";


=================================================
============ SPACE-TIME RUPTURE
[object_name] execvm "AL_ambient_SFX\rupture.sqf";

object_name - string, the name of the object you use as a source for the SFX

============ EXAMPLE
[aurora_2] execvm "AL_ambient_SFX\rupture.sqf";


=================================================
============ SPARKS
[object_name] execvm "AL_ambient_SFX\sparky.sqf";

object_name - string, the name of the object you use as a source for the SFX

============ EXAMPLE
[broken] execvm "AL_ambient_SFX\sparky.sqf";


=================================================
============ LOCAL SOUND
[object_name, soundname, delayinsoundplayloop, howfarsoundistobeheard] execvm "AL_ambient_SFX\local_sound.sqf";

object_name				- string, the name of the object you use as a source for the SFX
soundname				- string, the name of the sound as you defined it in your description.ext
delayinsoundplayloop	- number, delay in seconds before the sound is played again
							if is negative the sound will only be played once
howfarsoundistobeheard	- number, maximum distance in meters the sound is audible from

============ EXAMPLE
[pond,"broasca_3",9,100] execvm "AL_ambient_SFX\local_sound.sqf";