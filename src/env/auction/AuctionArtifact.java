package auction;

import java.util.ArrayList;
import java.util.List;

//CArtAgO artifact code for project versao_ae

import cartago.*;

public class AuctionArtifact extends Artifact {

	private List<String> participants;
	
	public void init() {
		participants = new ArrayList<String>();
		
		defineObsProperty("minOffer", 1980);
		defineObsProperty("participants", 0);
	}

	@OPERATION
	public void getIn() {
		ObsProperty opParticipants  = getObsProperty("participants");
		opParticipants.updateValue(opParticipants.intValue()+1);
		participants.add(getCurrentOpAgentId().getAgentName());
	}

	@OPERATION
	public void getOut() {
		ObsProperty opParticipants  = getObsProperty("participants");
		if (opParticipants.intValue() > 1) {
			opParticipants.updateValue(opParticipants.intValue()-1);
			System.out.println(getCurrentOpAgentId().getAgentName() + " is out!");
			participants.remove(getCurrentOpAgentId().getAgentName());
		}
		if (opParticipants.intValue() == 1) {
			System.out.println(participants.get(0) + " is the winner!");
		}
	}

	@OPERATION
	public void setOffer(double minValue) {
		ObsProperty opMinOffer  = getObsProperty("minOffer");
		opMinOffer.updateValue(minValue);			
		System.out.println("Minimum price set as " + minValue + " from " + getCurrentOpAgentId().getAgentName());
	}
}