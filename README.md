Rock Paper Scissors Game
=====================

Before playing run sinatra server: `ruby app/players_api.rb`

Create two players:
```
player_a = Player.new('http://127.0.0.1:1337/playerA_plays')
player_b = Player.new('http://127.0.0.1:1337/playerB_plays')
```

Then pass then to game server and it will return you the string result and add scores to players
```
GameServer.new(player_a, player_b).play`
```
