// Agent participante in project versao_ae

/* Initial beliefs and rules */
my_price(math.random*48320840).

/* Initial goals */

/* Plans */


+!focus(A) // goal sent by the auctioneer
   <- lookupArtifact(A,ToolId);
      focus(ToolId).

+task(D)[artifact_id(AId)] : 
						running("yes")[artifact_id(AId)] &
						my_price(P) 
   <- bid(P)[artifact_id(AId)].

+winner(W) : .my_name(W) <- .print("I Won!").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }