my_price(2000+math.random*200).
present.

+present <- .broadcast(tell,present).

+auction(D, P) : my_price(MP) & P > MP & present <-
	.broadcast(untell,present);
	-present.

+winnerag[source(Z)]: true <- 
	.print("I am so so Happy because I am the winner");
	.stopMAS.

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }
