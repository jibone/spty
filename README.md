# Spty

Spotify Player Terminal Utility. CLI that lets you control your
[Spotify](http://spotify.com) player from the terminal. Only works on MacOSX as
it uses [AppleScript API](https://developer.spotify.com/applescript-api/)
to control the player.

## Installation

```
$ gem install spty
```

## Usage

Spotify player has to be running for these command to work.

Show gem version
```
$ spty version
```

Show current player state
```
$ spty player state
```

Toggle player play / pause
```
$ spty player toggle
```

Get track title and artist
```
$ spty track info
```

Skip track and play the next track
```
$ spty track skip
```

Replay previous track
```
$ spty track replay
```

Show current volume level
```
$ spty volume
```

Increase the volume level by 10
```
$ spty volume up
```

Decrease the volume level by 10
```
$ spty volume down
```

Set the volume level with given number
```
$ spty volume [number]
```

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/jibone/spty. This project is intended to be a safe, welcoming
space for collaboration, and contributors are expected to adhere to the
[Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Spty project’s codebases, issue trackers, chat rooms
and mailing lists is expected to follow the
[code of conduct](https://github.com/jibone/spty/blob/master/CODE_OF_CONDUCT.md).
