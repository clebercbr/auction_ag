my_price(2000+math.random*200).

+!focus[scheme(Sch)] <- 
	?goalArgument(Sch,auction,"Id",Id);
	lookupArtifact(Id,ToolId);
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