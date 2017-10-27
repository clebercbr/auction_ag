+!start[scheme(Sch)] <- 
	?goalArgument(Sch,auction,"Id",Id);
	makeArtifact(Id, "auction.AuctionArtifactAEO", [], ArtId);
	focus(ArtId).

+!do_auction(Id,P) <- // creates a scheme to coordinate the auction
	.concat("sch_",Id,SchName);
    makeArtifact(SchName, "ora4mas.nopl.SchemeBoard",["src/org/auction-os.xml", doAuction], SchArtId);
    focus(SchArtId);
    setArgumentValue(auction,"Id",Id)[artifact_id(SchArtId)];
    setArgumentValue(auction,"Service",P)[artifact_id(SchArtId)];
    .my_name(Me); setOwner(Me)[artifact_id(SchArtId)];
    addScheme(SchName);
    commitMission(mAuctioneer)[artifact_id(SchArtId)].    

+participants(N): total(NT) & N == NT <- !setOffer.

@p10[atomic] +!setOffer <-    
	?goalArgument(Sch,auction,"Id",Id);
	lookupArtifact(Id,ArtId);
	focus(ArtId);
	?participants(N);
	if (N > 1) {
		?minOffer(P);
		setOffer(P+20);	
		!setOffer[scheme(Sch)];
	}.

+winner(W) : W \== no_winner
   <- .print("Winner for ", product(diamond_ring), " is ", W);
	  .send(W, tell, winnerag).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }
