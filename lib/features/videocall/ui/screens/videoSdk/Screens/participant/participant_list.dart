import 'package:flutter/material.dart';
import 'package:halaqahqurania/features/videocall/ui/screens/videoSdk/Screens/participant/participant_list_item.dart';
import 'package:videosdk/videosdk.dart';

import '../../theme/AppColors.dart';

class ParticipantList extends StatefulWidget {
  final Room meeting;
  const ParticipantList({Key? key, required this.meeting}) : super(key: key);

  @override
  State<ParticipantList> createState() => _ParticipantListState();
}

class _ParticipantListState extends State<ParticipantList> {
  Map<String, Participant> _participants = {};

  @override
  void initState() {
    _participants.putIfAbsent(widget.meeting.localParticipant.id,
        () => widget.meeting.localParticipant);
    _participants.addAll(widget.meeting.participants);
    addMeetingListeners(widget.meeting);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.primaryColor,
      appBar: AppBar(
        flexibleSpace: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Participants (" +
                        (widget.meeting.participants.length + 1).toString() +
                        ")",
                    style:  TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 18,
                  color: Appcolors.fontcolor
                        
                        ),
                  ),
                ),
              ),
              IconButton(
                icon:  Icon(Icons.close,
                  color: Appcolors.fontcolor
                
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Appcolors.primaryColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _participants.values.length,
                  itemBuilder: (context, index) => ParticipantListItem(
                      participant: _participants.values.elementAt(index)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addMeetingListeners(Room meeting) {
    meeting.on(Events.participantJoined, (participant) {
      if (mounted) {
        final newParticipants = _participants;
        newParticipants[participant.id] = participant;
        setState(() => _participants = newParticipants);
      }
    });

    meeting.on(Events.participantLeft, (participantId) {
      if (mounted) {
        final newParticipants = _participants;
        newParticipants.remove(participantId);

        setState(() => _participants = newParticipants);
      }
    });
  }
}
