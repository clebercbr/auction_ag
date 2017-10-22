my_price(2000+math.random*200).

+!focus(A) <- 
	lookupArtifact(A,ToolId);
    focus(ToolId);
    +present;
    getIn.

+minOffer(N) : my_price(MP) & present <-
	if (N > MP) {
		-present;
		getOut;
	}.

+minOffer(N).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }