Okay so here is whats going on.

I decided that for my next machine it would run Nix for the simple reason that I have been doing this whole linux thing for awhile. That and with periodic upgrades or with how I interact with a machine has made me have to install all of my packages and configuration about 2 times too many. So I decided to hop into a vm and get all of my configuration done on a declarative system ahead of time.

Now I have come to realize there is a catch. While Nix can provide this the up front investment is heavy if I want to deploy this the way my mind says makes sense.

For context I have a little experience with nix in the past because I decided to put it on an intel compute stick in the past just to see what it was about. There is a difference between that experience and this one in one major way. There I only used the normal configuration.nix file. Flakes is a whole other monster.

What I can see is that with Flakes (and home-manager) I can configure almost everything on a machine before I even have a machine in hand with a little bit of forethought. This can also be consistently backed up by using git (through github, forgejo, gitlab, etc...). All of this is what I want, be able to have a machine be reproduced with everything I want and need with one command because I put in the hours beforehand and during the use of a current machine so when the time comes for a new one to join the party I don't actively have to configure anything.

However there is one glaring issue I am realizing during this process. I was, and still am, woefully unprepared for the complexity of this endevor.

I have been using the book at https://nixos-and-flakes.thiscute.world for learing and reference. That and the authors personal nix-config github. One is much more simple than the other.

As of writing this readme I am essentially stuck on making things modular and I am unsure (no scratch that certain) that I am overcomplicating things by seeing what is possible for others while not exactly thinking about my own skill level. With that in mind I am going to make things uncomplicated for my dumb dumb brain and just get something working even if it is essentially just copying what is in the book so I can understand the modular system and tinker later.

Quick update same day, got flakes as modules working. Next step is figuring out how to make nix look in whatever git directory being used so I don't have to constantly copy/paste the files from etc/ (well also figuring out all the things I said there were a better way to do)
    Also possibly found the solution to my complaining about better way to do both desktop and server config
        lib.mkForce along with using imports allows for overlapping configs (setup server conf as basic then import into desktop and add options [maybe this might still have the default.nix issue])
            EITHER WAY BEST COURSE OF ACTION IS TO TINKER WHILE REFERENCING THE CREATORS PERSONAL CONFIG (now that i understand a bit more after completing the flake properly I may be able to make it more complex but proper for deployment of more than 1 type of system)

-B (03-16-26)


Took a break but got around to making the host config for what will eventually be the bare metal machine. Still gonna do some tinkering.

Need to look into: 
-how the host knows which nix file to look at for rebuild switch
-proper way to make a networking file so that i don't have to constantly write that section out in the hosts default (will have to have different rules for server and desktop)
-make sure there is nothing else to add to the flake.nix
-look into system architecture stuff (might be worthwhile)

GET NIX TO USE A NIX FILE OUTSIDE OF NIXOS/ SO THAT YOU CAN JUST USE THE GIT FOLDER FOR EASY PROGRESS SAVING

-B (03-25-26)

Added steam stuff to desktop module, still gotta find a better way to impliment it (did this after finding out a few things related to the normal package vs the flatpak)
thinking of doing it through its own nix file in modules that a host could point to so it isn't always installed on desktop image

-B (03-26-26)


Looking to add yt-x to the new machine, while thinking of the best way to add it while following what it says on the github I looked back to the book creators current flake.nix file
    something of note is i think the best way for me to do it is gonna be to just add an iputs section to the bottom of the file for anything similar (on the fly correction i can just leave it at the top for now if it gets cluttered then i'll religate it to the bottom with a quick copy and paste)
    
    more importantly because this will have to make me rewrite stuff
        now that i have had time to actually look at what they were doing i believe i can fix my self inflicted problem of not knowing how to differntiate between server and desktop images and it is done in the flake.nix
            so my brain hurts but the long and short of it is I just need to be pointing to more files using imports in other files, that is of course if i am reading this correctly. i think what is going on in the book is in the flak the host is definied (and pointed to its folder in hosts which imports system modules specifically from modules folder), then the home-manager module is pointed to specific home.nix file depending on the system type (which has its own imports so that the user programs can be different if need be)
            [I do have to say i am confused about the syntax, on theirs it is written as "home-module = import" but i don't see anything like that on mine nor do i see what is written in mine on theirs which is said to allow reuild switch to update; anyway i guess that just means what is always does "Read The Man", lame]

            hiccup yt-x declarative install isn't working for me and I am unsure what I am doing wrong
                currently says "undefined variable 'inputs'" specifically in the home manager file 
                for the time being i did a profile install and am going to mess around with it declarativley later

    for now keep in mind making a bash.nix for alias stuff (also having its own nix file might be the answer to above dunno)

-B (03-30-26)
 

Dunno what was happening with yt-x but couldn't get it to work, not gonna stress about it more rn

I was able to
    - stop overthinking the seperation of server and desktop home configs by making 2 different nix files under the user for each (there is probably a more elegant solution than that but hey that is what i could think of and it works)
    - make a hyprland folder so the hyprland config is stored within the flake instead of outside of it needing to be copied over into the config after

Still have to
    - Make a bash.nix for alias stuff (either in home or modules but might just be able to put it in core.nix dunno try it out later)

-B (03-31-26)

Decided to try and move everything from flatpak to home-manager so no thinking in the future
    - some pacakges didn't exist and some will be tested on nix instead but progress

Still have to do bash.nix

Also really might need to make the network folder so Sunshine can be installed

-B (04-01-26)
