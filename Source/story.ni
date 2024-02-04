"Get out" by Dora

Use no scoring.
Release along with the "Parchment" interpreter.
The display banner rule is listed before the when play begins stage rule in the startup rules.

When play begins:
	say "You woke up on the cold floor of dark room. You don't know how you got here or where you are. All you can see are two doors and a few items scattered on the floor aorund around you. You look up, there is a mirror on one of the walls and next to it is an old broken clock. Above each door it says where they lead. The red door leads to the exit and the blue one leads to the attic. You don't know if the time is right but it says it's almost 2."; now the time of day is 1:48 pm; now the left hand status line is "Time: [time of day] 2nd October"; now the printed name of Rex is "Unknown animal"; now the description of Rex is "Ask it something!"

Understand "Unknown animal" as Rex when the printed name of Rex is "Unknown animal".
Understand "sleep in [something]" as sleeping in. Sleeping in is an action applying to one thing.
Player is in Chamber.

[ROOMS]
The Chamber is a room. "Moody dark room with things scattered on the floor."

Attic is a room. "The attic is filled with nothing but spiderwebs and dust."
Attic is north of the Attic door.

Hallway is a room. "The hallway leads to your freedom."
Hallway is east of the Exit door.

Green Field is a room. 
The description of Green Field is "The sun shines brightly and the grass is lush and green. It's peaceful here."
Green Field is north of Passage.

Street is a room. "You find yourself on the street your home is at. Your house looms in front of you, its door locked."

House is a room.
House is west of Street. "It's your cozy home, familiar and welcoming. Your bed is here, you just want to rest now."

Home is a room.
Home is north of the house door.

[DOORS]
The Exit door is a door. 
It is openable. 
It is east of The Chamber. 
It is locked. 
It is closed.
The description of the Exit door is "This sturdy door leads to the exit. It seems to be locked. You can unlock it with the red key."

The Attic door is a door. 
It is openable. 
It is west of The Chamber. 
It is locked. 
It is closed.
The description of the Attic door is "You unlock the attic door with the blue key.". 

Passage is a door. 
It is open. 
The description of Passage is "Through the passage, you can see the bright light. It is so bright you can't see anything else."
Passage is north of Hallway.

The house door is a door. 
The house door is north of the House. 
The house door is locked. 
The description of the house door is "Your front door, currently locked."

[THINGS]
Scattered things is in The Chamber. "If you go through them, you could find something of value."

Blue Key is in Scattered things.

Red Key is a thing.
Red Key is nowhere.

Mirror is a thing.
It is in The Chamber.
Mirror is fixed in place.

Old broken clock is a thing.
It is in The Chamber.

Note is a thing in Attic.

Picture is a thing. "In the picture, you can see yourself having fun in an open green field. You have never been there so it must be the future."
Picture is in Hallway.

Lockpick is a thing. 
Lockpick is nowhere.

Big Fruity Tree is a thing.
It is in Green Field.

The apple is a thing in the Big Fruity Tree. 
The apple is edible. 
The description of the apple is "A juicy, red apple hanging from the tree."

The bed is a thing in Home. The description of the bed is "Your bed, looking more comfortable than ever."

[ANIMALS]
Rex is an animal in the Attic. Rex can be knowledgeable about the red key or unknowledgeable about the red key. Rex is knowledgeable about the red key.


[SPEECH]
After asking Rex about "Something to say":
	if the player does not have the Red Key:
		now the player has the Red Key;
		continue the action;
		
Table of Rex Responses
Topic	Response	Index
"Who are you"	"My name is Rex. What am i doing in the attic? How did i get here?"	"Who are you?"
"What are you"	"I'm a talking dog."	"What are you?"
"Something to say"	"I have a red key for you!"	"Something to say"

After asking Rex about something:
	if the topic understood is a topic listed in the Table of Rex Responses:
		say "[Response entry]";
	if the topic is "Who are you":
		now the printed name of Rex is "Rex";
		
list-asking is an action applying to one thing.
understand "ask [thing]" as list-asking.
understand "ask [thing] about" as list-asking.

instead of list-asking a person:
	if the noun is Rex:
		let T be the Table of Rex Responses;
		list options from T;
	otherwise:
		say "You can't ask any questions!"
		
To list options from (t - a table name):
	let N be the number of rows in T;
	if N is 0:
		say "There is nothing to ask about.";
	otherwise:
		say "You can ask about ";
		repeat with X running from 1 to N minus 1:
			say "[index in row X of T][if N is greater than 2], [end if]";
		if N is greater than 1:
			say "or ";
		say "[index in row N of T]."

[ACTIONS]
After examining the Scattered things:
	if the player does not have the Blue Key:
		now the player has the Blue Key;
		continue the action;

After taking the Note:
	say "Rex has something for you.";
	continue the action;

After unlocking the Exit door with The Red Key:
	say "With the door unlocked, you can now open it.";
	
After pushing the Picture:
	if the player does not have the Lockpick:
		now the player has the Lockpick;
		say "Good thing I moved the picture. Now i have a lockpick, it might come in handy someday.";
		continue the action.
		
After examining the Big Fruity Tree:
	if the apple is in the Big Fruity Tree:
		move the apple to the player;
		say "I'm so hungry, even an apple looks delicious.";

After eating the apple:
	say "As you finish the apple, a drowsy feeling overcomes you, and your surroundings start to blur...";
	move the player to Street;
	continue the action.
		
Instead of going east in The Chamber when the Exit door is closed:
	say "The exit door blocks your way east. Perhaps you should try opening it if you can."

Instead of unlocking The Exit door with The Red Key:
	now The Exit door is unlocked;
	say "You unlock the exit door with the red key."

Instead of unlocking The Attic door with The Blue Key:
	now The Attic door is unlocked;
	say "You unlock the attic door with the blue key."

Instead of going north from the Hallway when the player does not have the Lockpick:
	say "You can't go there yet, you must find something first.";
		
Instead of going north from the Hallway when the player has the Lockpick and the Passage is not locked:
	say "As you step through the passage, you're enveloped by a bright light, and when your vision clears, you find yourself standing in an open green field.";
	move the player to Green Field;
	now the Passage is locked; 
	say "This is it, freedom finally!.";
	
Instead of going south from the Green Field:
	say "You've found your freedom, and there's no going back now.";
	
Instead of unlocking the house door with the Lockpick:
	if the player has the Lockpick:
		now the house door is unlocked;
		say "You barely know how to use the lockpick but you manage to unlock your house door.";
	else:
		say "You need something to pick the lock with."
		
Check sleeping in:
	if the noun is not the bed:
		say "You can only sleep in the bed.";
		stop the action.

Instead of sleeping in the bed:
	say "You tuck yourself into bed, and sleep comes easily after such a long journey. This is the rest you've desperately needed.";
	end the story finally saying "You have won!";