# Pomo.fish

Basic pomodoro timer in fish :D

I wanted to make this just to familiarise myself further with fish, and it's been really fun!

## Installation

Install with fisher: 

```fish

fisher install Drawserqzez/pomo.fish 

```

## Usage

To start the work timer just type: 
```fish

pomo work

```

This will start the timer with the default time.
To change the default time you have to append the -d flag to the end of your command. 
See ` pomo --help ` for more information.

Break works in the same way as work. 


There is also support for changing the verbs to arbitrary values, but the tool doesn't have that implemented as of writing this.
Instead you have to adjust the POMO_WORK_CMD and POMO_BREAK_CMD env-variables.

## Credits

Credits to [z.fish](https://github.com/jethrokuan/z) for inspiration on how to structure my project.

Credits to [bashbunni's dotfiles](https://github.com/bashbunni/dotfiles/blob/90b3f14be7691e06ad45b6e4f81bfe7bdefd7234/.zshrc#L41)
for the inspiration to do this in the first place :)


## License

MIT
