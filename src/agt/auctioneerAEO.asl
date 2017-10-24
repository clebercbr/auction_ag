!do_auction("a1", "product(diamond_ring)").

+!do_auction(Id,P) <- // creates a scheme to coordinate the auction
	.concat("sch_",Id,SchName);
    makeArtifact(SchName, "ora4mas.nopl.SchemeBoard",["src/org/auction-os.xml", doAuction], SchArtId);
    debug(inspector_gui(on))[artifact_id(SchArtId)];
    setArgumentValue(auction,"Id",Id)[artifact_id(SchArtId)];
    setArgumentValue(auction,"Service",P)[artifact_id(SchArtId)];
    .my_name(Me); setOwner(Me)[artifact_id(SchArtId)];
    focus(SchArtId);
    addScheme(SchName);
    commitMission(mAuctioneer)[artifact_id(SchArtId)].

+!start[scheme(Sch)] <- 
	?goalArgument(Sch,auction,"Id",Id);
    ?goalArgument(Sch,auction,"Service",S);
    .print("Start scheme ",Sch," for ",S);
	makeArtifact(Id, "auction.AuctionArtifact", [], ArtId);
    .print("Auction artifact created for id:",Id , " name:", S);
    Sch::focus(ArtId);
    Sch::start(S);
    !setOffer[scheme(Sch)].
    
@p10[atomic] +!setOffer[scheme(Sch)] <-    
	?goalArgument(Sch,auction,"Id",Id);
	lookupArtifact(Id,ArtId);
	?NS::participants(N);
	if (N > 1) {
		?NS::minOffer(P);
		setOffer(P+20)[scheme(Sch)];	
		!!setOffer[scheme(Sch)];
	}.
	
+!setOffer[scheme(Sch)].

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }
