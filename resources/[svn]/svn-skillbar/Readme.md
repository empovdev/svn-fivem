# Skillbar

## Description
Skillbar is a FiveM resource designed to create a skill-based minigame. Inspried by nopixel 4.0

## Usage
### Registering a Command
To incorporate the skillbar into your FiveM server, follow these steps:

1. Register a command that triggers the skill-based minigame.
2. Call the `Start` function provided by the `svn-skillbar` resource, passing in the required parameters.

### Example - Registering a Command
```lua 
RegisterCommand('testskill', function()
    exports['svn-skillbar']:Start(40, 3, function(result)
        if result then
            print("Success")
        else
            print("Failed")
        end
    end)
end)
```

### Function Parameters
- **`first`**: Specifies the moving speed of the skillbar.
- **`second`**: Specifies the number of attempts allowed for the player.

## Example
```lua 
-- Moving speed 40 and 3 Attempts.  *Please don't incress moving speed over 100*
exports['svn-skillbar']:Start(40, 3, function(result)
    if result then
        print("Success")
    else
        print("Failed")
    end
end)
```

In this example, the skillbar is started with a moving speed of 40 and three attempts allowed. The result of the challenge is printed in the console.

## Notes
- Ensure that the `svn-skillbar` resource is properly installed and configured on your FiveM server.
```
  ensure svn-skillbar
```
- Adjust the parameters according to you.
- Don't incress the move speed over 100.

## Credits
Skillbar is developed by svn. For support and inquiries, please visit [Discord](https://discord.gg/rZxCjaQ8).