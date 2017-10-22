//!start.
!do_action("a1", "product(diamond_ring)").

+!do_auction(Id,P) <- // creates a scheme to coordinate the auction
	.concat("sch_",Id,SchName);
    makeArtifact(SchName, "ora4mas.nopl.SchemeBoard",["src/org/auction-os.xml", doAuction], SchArtId);
    debug(inspector_gui(on))[artifact_id(SchArtId)];
    setArgumentValue(auction,"Id",Id)[artifact_id(SchArtId)];
    setArgumentValue(auction,"Service",P)[artifact_id(SchArtId)];
    .my_name(Me); setOwner(Me)[artifact_id(SchArtId)];  // I am the owner of this scheme!
    focus(SchArtId);
    addScheme(SchName);  // set the group as responsible for the scheme
    commitMission(mAuctioneer)[artifact_id(SchArtId)].

+!start[scheme(Sch)] <- 
	?goalArgument(Sch,auction,"Id",Id);
    ?goalArgument(Sch,auction,"Service",S);
    .print("Start scheme ",Sch," for ",S);
	makeArtifact(a1, "auction.AuctionArtifact", [], ArtId);
    .print("Auction artifact created for ",product(diamond_ring));
    focus(ArtId);
    .broadcast(achieve,focus(a1));
    .wait(500);
    !setOffer.
    
@p10[atomic] +!setOffer <-    
	lookupArtifact(a1,ArtId);
	?participants(N);
	if (N > 1) {
		?minOffer(P);
		setOffer(P+20);	
		!!setOffer;
	}.
	
+!setOffer.

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }