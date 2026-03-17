Okay so here is whats going on.

I decided that for my next machine it would run Nix for the simple reason that I have been doing this whole linux thing for awhile. That and with periodic upgrades or with how I interact with a machine has made me have to install all of my packages and configuration about 2 times too many. So I decided to hop into a vm and get all of my configuration done on a declarative system ahead of time.

Now I have come to realize there is a catch. While Nix can provide this the up front investment is heavy if I want to deploy this the way my mind says makes sense.

For context I have a little experience with nix in the past because I decided to put it on an intel compute stick in the past just to see what it was about. There is a difference between that experience and this one in one major way. There I only used the normal configuration.nix file. Flakes is a whole other monster.

What I can see is that with Flakes (and home-manager) I can configure almost everything on a machine before I even have a machine in hand with a little bit of forethought. This can also be consistently backed up by using git (through github, forgejo, gitlab, etc...). All of this is what I want, be able to have a machine be reproduced with everything I want and need with one command because I put in the hours beforehand and during the use of a current machine so when the time comes for a new one to join the party I don't actively have to configure anything.

However there is one glaring issue I am realizing during this process. I was, and still am, woefully unprepared for the complexity of this endevor.

I have been using the book at https://nixos-and-flakes.thiscute.world for learing and reference. That and the authors personal nix-config github. One is much more simple than the other.

As of writing this readme I am essentially stuck on making things modular and I am unsure (no scratch that certain) that I am overcomplicating things by seeing what is possible for others while not exactly thinking about my own skill level. With that in mind I am going to make things uncomplicated for my dumb dumb brain and just get something working even if it is essentially just copying what is in the book so I can understand the modular system and tinker later.

Quick update same day, got flakes as modules working. Next step is figuring out how to make nix look in whatever git directory being used so I don't have to constantly copy/paste the files from etc/ (well also figuring out all the things I said there were a better way to do)

-B (03-16-26)
