{
# So there has to be a better way to do this, I want to be able to point to either file automatically depending on what I am setting up. None of this comment uncomment business. Look into others configs to see if there is a better solution.
#(my best guess is gonna have to have 2 different folders depending on which I am setting up, then instead of pointing here with users instead have it be host determinite)
	imports = [
		./desktop.nix
		#./server.nix 
	];
}
