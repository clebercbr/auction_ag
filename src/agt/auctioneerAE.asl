// Agent leiloeiro in project versao_ae

/* Initial beliefs and rules */
inicial_price(math.random*4).

/* Initial goals */



/* Plans */

+!start(Id,P)
   <- makeArtifact(Id, "versao_ae.AuctionArtifact", [], ArtId);
      .print("Auction artifact created for ",P);
      Id::focus(ArtId);  // place observable properties of this auction in a particular name space
      Id::start(P);
      .broadcast(achieve,focus(Id));  // ask all others to focus on this new artifact
      .at("now + 5 seconds", {+!decide(Id)}).

+!decide(Id)
   <- Id::stop.

+NS::winner(W) : W \== no_winner
   <- ?NS::task(S);
      ?NS::best_bid(V);
      .print("O ganhador", S, " é ",W," com ", V, "reais").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }