+!start <- 
	lookupArtifact("auction1",ArtId);
    .print("Auction artifact created for ",product(diamond_ring));
    focus(ArtId);
    .broadcast(achieve,focus(auction1)). 

+participants(N): total(NT) & N == NT <- !setOffer.
    
@p10[atomic] +!setOffer 
	 <- lookupArtifact(auction1,ArtId);
	?participants(N);
	if (N > 1) {
		?minOffer(P);
		setOffer(P+20);	
		!setOffer;
	}.
	
+winner(W) : W \== no_winner
   <- .print("Winner for ", product(diamond_ring), " is ", W);
	  .send(W, tell, winnerag).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }
