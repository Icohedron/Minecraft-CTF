# Teleport all players back to spawn and clear inventories
execute @a[score_CTFActive_min=1,score_CTFActive=1] ~ ~ ~ tp @p @r[score_CTFActive_min=1,type=armor_stand,tag=CTFLobbySpawnPoint]
execute @a[tag=CTFSpectator] ~ ~ ~ tp @p @r[score_CTFActive_min=1,type=armor_stand,tag=CTFLobbySpawnPoint]
clear @a[score_CTFActive_min=1,score_CTFActive=1]

# Gets rid of all scoreboard objectives, entities, and resets gamerules to vanilla defaults
kill @e[type=armor_stand,tag=CTFGame]
kill @e[type=armor_stand,tag=CTFRedMarker]
kill @e[type=armor_stand,tag=CTFBlueMarker]
kill @e[type=armor_stand,tag=CTFTeamBalancer]
kill @e[type=armor_stand,tag=CTFExists]
kill @e[type=armor_stand,tag=CTFFlag]
kill @e[type=area_effect_cloud,tag=CTFStartTimer]
scoreboard objectives remove CTFGameState
scoreboard objectives remove CTFActive
scoreboard objectives remove CTFScore
scoreboard objectives remove CTFScoreKeeper
scoreboard objectives remove CTFTeamCounter
scoreboard objectives remove CTFFlagTracker
scoreboard objectives remove CTFDeathCount
scoreboard objectives remove CTFDisconnect
scoreboard objectives remove CTFRoundTime
scoreboard objectives remove CTFTrigger
scoreboard objectives remove CTFSpectate
scoreboard objectives remove CTFExists
scoreboard objectives remove CTFResupply
scoreboard teams remove CTFRed
scoreboard teams remove CTFBlue
scoreboard teams remove CTFEC
scoreboard teams remove CTFVRed
scoreboard teams remove CTFVBlue
gamerule naturalRegeneration true

# Configure event server spawn point system
scoreboard players set @e[type=armor_stand,tag=SpawnStand] SPtp 33
scoreboard players set @e[type=armor_stand,tag=SpawnStand] SPsat 1
scoreboard players set @e[type=armor_stand,tag=SpawnStand] SPpvp 0
