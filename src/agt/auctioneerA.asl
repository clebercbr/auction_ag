price(1980).
winner(no_winner).

@b00 +present : .count(present[source(B)],N) & total(T) & N == T  <- !setOffer.

@b01 +present. //Failure plan

@g00[atomic] +!setOffer : .count(present[source(B)],N) & N > 0 <-
	if (N > 1) {
		?price(P);
		-+price(P+20);
		.broadcast(tell, auction(diamond_ring, P+20));
		//.print("Who pay $", P+20, " for this 'diamond ring'?");
		!!setOffer;
	} else { //There is only one present
		?present[source(S)];
		-+winner(S);
		.print("(a)Winner for ", product(diamond_ring), " is ", S);
		.send(S, tell, winnerag);
	}.

@g01 +!setOffer. //Failure plan

@p20[atomic] -present[source(A)] : winner(no_winner) <-
	.count(present[source(B)],N);
	if (N <= 1) { //There is one or none present, so the last should be the winner
		-+winner(A);	
		.print("(b)Winner for ", product(diamond_ring), " is ", A);
		.send(A, tell, winnerag);
	}.

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }


					
