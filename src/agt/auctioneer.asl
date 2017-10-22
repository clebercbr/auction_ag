price(2000).
total(6).
winner(null).

@b00 +present : .count(present[source(B)],N) & total(T) & N = T  <- !setOffer.

@b01 +present. //Failure plan

@g00[atomic] +!setOffer : .count(present[source(B)],N) & N > 0 <-
	?price(P);
	.broadcast(tell, auction(diamond_ring, P));
	.print("Asking for a 'diamond ring' for ", P);
	-+price(P*0.99);
	!!setOffer.

@g01 +!setOffer. //Failure plan

@p20[atomic] -present[source(A)] <-
	.count(present[source(B)],N);
	if (N = 0 & winner(null)) {
		.print(A," is the winner!");
		-+winner(A);	
	} else {
		.print(A," is out!");	
	}.

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }


					
