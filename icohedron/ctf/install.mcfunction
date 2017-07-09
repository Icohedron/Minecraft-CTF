# Info
# Entities used
# xp_orb, armor_stand, fireworks_rocket, item, arrow, area_effect_cloud
# 1.10 versions
# XPOrb, ArmorStand, FireworksRocketEntity, Item, Arrow, AreaEffectCloud

# Summon armor stands
summon armor_stand ~ ~0.0 ~ {CustomName:"CTF Game",Tags:["CTFGame"],Invulnerable:1,Marker:1,NoGravity:1}
summon armor_stand ~ ~0.1 ~ {CustomName:"CTF Red Marker",Tags:["CTFRedMarker","CTFTeamMarker"],Invulnerable:1,Marker:1,NoGravity:1}
summon armor_stand ~ ~0.2 ~ {CustomName:"CTF Blue Marker",Tags:["CTFBlueMarker","CTFTeamMarker"],Invulnerable:1,Marker:1,NoGravity:1}
summon armor_stand ~ ~0.3 ~ {CustomName:"CTF Team Balancer",Tags:["CTFTeamBalancer"],Invulnerable:1,Marker:1,NoGravity:1}
summon armor_stand ~ ~0.4 ~ {CustomName:"CTF Existance Checker",Tags:["CTFExists"],Invulnerable:1,Marker:1,NoGravity:1}

# Scoreboard objectives
scoreboard objectives add CTFGameState dummy Game State
scoreboard objectives add CTFActive dummy Active
scoreboard objectives add CTFScore dummy Score
scoreboard objectives add CTFScoreKeeper dummy Score Keeper
scoreboard objectives add CTFTeamCounter dummy Team Count
scoreboard objectives add CTFRoundTime dummy Round Time
scoreboard objectives add CTFExists dummy Existance
scoreboard objectives add CTFTrigger trigger Context Trigger
scoreboard objectives add CTFSpectate trigger Spectate
scoreboard objectives add CTFDeathCount deathCount Death Count
scoreboard objectives add CTFDisconnect stat.leaveGame Disconnect Counter

# Entities with CTFFlagTracker == 1 are the holder of a flag
# Exception is for the armor stands CTFRed and CTFBlue which count score
scoreboard objectives add CTFFlagTracker dummy Flag Tracker

# Teams
scoreboard teams add CTFRed Red Team
scoreboard teams option CTFRed color red
scoreboard teams option CTFRed friendlyfire false
scoreboard teams option CTFRed nametagVisibility hideForOtherTeams

scoreboard teams add CTFBlue Blue Team
scoreboard teams option CTFBlue color blue
scoreboard teams option CTFBlue friendlyfire false
scoreboard teams option CTFBlue nametagVisibility hideForOtherTeams

# Teams not for players
scoreboard teams add CTFVRed Red Team
scoreboard teams option CTFVRed color red
scoreboard teams add CTFVBlue Blue Team
scoreboard teams option CTFVBlue color blue
scoreboard teams join CTFVRed Red
scoreboard teams join CTFVBlue Blue
scoreboard teams join CTFVRed Red_Score
scoreboard teams join CTFVBlue Blue_Score
scoreboard teams join CTFVRed Red_Players
scoreboard teams join CTFVBlue Blue_Players

# Set constants and defaults
scoreboard players set Red CTFScore 0
scoreboard players set Blue CTFScore 0
scoreboard players set TicksPerSecond CTFRoundTime 20
scoreboard players set TicksPerMinute CTFRoundTime 1200
scoreboard players set @e[type=armor_stand,tag=CTFExists] CTFExists 0

scoreboard players set TimeInTicks CTFRoundTime 12000
scoreboard players set Winning_Score CTFScore 3

scoreboard players operation @e[type=armor_stand,tag=CTFGame] CTFRoundTime = TimeInTicks CTFRoundTime
scoreboard objectives setdisplay sidebar CTFScore

# Initial game state
scoreboard players set @e[type=armor_stand,tag=CTFGame] CTFGameState 0

# Turn off natural regeneration
gamerule naturalRegeneration false

# Configure event server spawn point system
scoreboard players set @e[type=armor_stand,tag=SpawnStand] SPtp 33
scoreboard players set @e[type=armor_stand,tag=SpawnStand] SPsat 0
scoreboard players set @e[type=armor_stand,tag=SpawnStand] SPpvp 1
