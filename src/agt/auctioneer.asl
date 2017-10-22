price(2000).
total(6).
winner(null).

@b00 +present : .count(present[source(B)],N) & total(T) & N = T  <- !setOffer.

@b01 +present. //Failure plan

@g00[atomic] +!setOffer : .count(present[source(B)],N) & N > 0 <-
	?price(P);
	.broadcast(tell, auction(diamond_ring, P));
	.print("Who pay ", P, " for this 'diamond ring'?");
	-+price(P*1.01);
	if (N > 1) {
		!!setOffer;
	} else {
		?present[source(S)];
		.print(S," is the winner!");
	}.

@g01 +!setOffer. //Failure plan

@p20[atomic] -present[source(A)] <-
	.count(present[source(B)],N);
	if (N = 0 & winner(null)) {
		.print(A," was chosen as the winner!");
		-+winner(A);	
	} else {
		.print(A," is out!");	
	}.

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }


					
