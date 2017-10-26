product(diamond_ring).

!start.

+!start <- 
	makeArtifact(a1, "auctionAE.AuctionArtifact", [], ArtId);
    .print("Auction artifact created for ",product(diamond_ring));
    focus(ArtId);
    .broadcast(achieve,focus(a1)). 

+lets[source(L)]: true <- !setOffer.

    
@p10[atomic] +!setOffer 
	 <- lookupArtifact(a1,ArtId);
	?participants(N);
	if (N > 1) {
		?minOffer(P);
		setOffer(P+20);	
		!setOffer;
	}.
	
+winner(W) : W \== no_winner
   <- 
      .print("Winner for ", product(diamond_ring), " is ", W);
	  .send(W, tell, winnerag).


{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }
