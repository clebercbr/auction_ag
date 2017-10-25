price(1980).
winner(null).

@b00 +present : .count(present[source(B)],N) & total(T) & N = T  <- !setOffer.

@b01 +present. //Failure plan

@g00[atomic] +!setOffer : .count(present[source(B)],N) & N > 0 <-
	if (N > 1) {
		?price(P);
		-+price(P+20);
		.broadcast(tell, auction(diamond_ring, P+20));
		.print("Who pay $", P+20, " for this 'diamond ring'?");
		!!setOffer;
	} else { //There is only one present
		?present[source(S)];
		-+winner(S);
		.print(S," is the winner!");
		.stopMAS;
	}.

@g01 +!setOffer. //Failure plan

@p20[atomic] -present[source(A)] <-
	.count(present[source(B)],N);
	if (N = 0 & winner(null)) {
		-+winner(A);	
		.print(A," was chosen as the winner!");
		.stopMAS;
	} else {
		.print(A," is out!");	
	}.

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }


					
