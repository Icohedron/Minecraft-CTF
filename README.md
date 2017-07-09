# Minecraft-CTF
Capture the Flag for Minecraft

# Instructions
Have at least one of each from icohedron:ctf/markers/items in your map.
Only one of each flag may be in a map.

Modify [User Input 1] in icohedron:ctf/main if you plan to have multiple arenas in the same Minecraft map.
Change the selector as stated so that it encapsulates the entire area of your map. 
Every armor stand (including the lobby and spectator spawn points) must be found with the selector you chose.

Don't bother with [User Input 2] and [User Input 3] unless you're running it on the EdgeGamers Minecraft server.

The person who controls/starts the game must have their score in the scoreboard objective 'MCTeams' equal to 8.
Create the 'MCTeams' scoreboard objective if it does not exist. It is a dummy. 
```
scoreboard objectives add MCTeams dummy
scoreboard players set @p MCTeams 8
```

Instructions for running in 1.12
1. Follow the above steps
2. Run icohedron:ctf/install
3. Then keep icohedron:ctf/main on a loop
4. Run icohedron:ctf/uninstall when finished

Instructions for running in 1.10.2
It's... more complicated. Not recommended
I'm sure you can figure it out by reading the comments in the code though
Hint: complete.cbp
