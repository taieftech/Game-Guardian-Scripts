
function MainMenu()
    local menuChoice = gg.choice({
        '💰 MODIFY VALUE (AUTO Search)',
        '⚡ CHANGE GAME SPEED',
        '📢 HELP / INSTRUCTIONS',
        '🚪 EXIT'
    }, nil, '🎮 UNIVERSAL GG HACK by TAIEF - Select Mode:')
    
    -- Handle menu choice
    if menuChoice == nil then return end -- Exit if cancelled
    if menuChoice == 1 then ValueModifier() end
    if menuChoice == 2 then SpeedHack() end
    if menuChoice == 3 then ShowHelp() end
    if menuChoice == 4 then 
        gg.toast("Script closed!")
        return 
    end
end


function ValueModifier()
    -- Ask user for input
    local oldValue = gg.prompt({"🔍 Enter value to search and change:"}, {[1]="100"}, {"number"})
    if not oldValue then gg.toast("❌ Cancelled!"); MainMenu(); return end
    
    local newValue = gg.prompt({"✨ Enter new value:"}, {[1]="9999"}, {"number"})
    if not newValue then gg.toast("❌ Cancelled!"); MainMenu(); return end
    
    local freezeChoice = gg.alert("❄️ Freeze this value?", "✅ YES", "❌ NO")
    
    
    gg.searchNumber(oldValue[1], gg.TYPE_AUTO)
    if gg.getResultsCount() == 0 then
        gg.alert("⚠️ No results found!\nTry a different value.")
        MainMenu()
        return
    end
    
    local results = gg.getResults(100)
    for i, v in ipairs(results) do
        v.value = newValue[1]
        v.freeze = (freezeChoice == 1) -- Freeze if YES
    end
    gg.setValues(results)
    gg.toast("✅ Modified " .. #results .. " values!")
    MainMenu() -- Return to menu
end


function SpeedHack()
    local speed = gg.prompt({
        "⚡ Enter game speed multiplier:",
        "Example: 2.0 = 2x speed, 0.5 = slow-mo"
    }, {[1]="1.0"}, {"number"})
    
    if not speed then 
        gg.toast("❌ Cancelled!")
        MainMenu()
        return 
    end
    
    gg.setSpeed(speed[1])
    gg.toast("✅ Speed set to: " .. speed[1] .. "x")
    MainMenu() -- Return to menu
end


function ShowHelp()
    gg.alert([[
📢 UNIVERSAL GG HACK - INSTRUCTIONS:

1. 💰 MODIFY VALUE:
   - Enter the ORIGINAL value that currently u see (e.g., 100 gold/gems).
   - Enter NEW value to replace (e.g., 9999).
   - Freeze to lock changes. (Optional)

2. ⚡ SPEED HACK:
   Note: Turn on it immediately after clicking the game to ensure no crash! 100% works👽
   - 1.0 = Normal speed
   - 2.0 = 2x faster
   - 0.5 = Slow motion
   - Your choice! But keep that sensible ☺️

⚠️ WARNINGS:
- May not work on all games, specially server sided games.
 - If value remained unchanged, play some games,earn something then try again. It must work if value is decrypted!
- Freezing too many values can crash the game.
- Online games may BAN you!]])
    MainMenu()
end


gg.toast("🚀 Universal GG Hack Loaded!")
MainMenu() -- Start menu
gg.setVisible(true)