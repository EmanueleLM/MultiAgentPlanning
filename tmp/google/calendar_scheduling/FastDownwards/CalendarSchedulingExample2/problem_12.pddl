(define (problem integrated_meeting_schedule)
  (:domain integrated_meeting_scheduler)
  
  (:objects
    slot9-930 slot930-10 slot10-1030 slot1030-11 slot11-1130
    slot1130-12 slot12-1230 slot1230-13 slot13-1330 slot1330-14
    slot14-1430 slot1430-15 slot15-1530 slot1530-16 slot16-1630 - time-slot
  )
  
  (:init 
    (blocked-agent1 slot9-930)
    (blocked-agent1 slot10-1030)
    (blocked-agent1 slot11-1130)
    (blocked-agent1 slot1230-13)
    
    (blocked-agent2 slot930-10)
    (blocked-agent2 slot16-1630)

    (blocked-agent3 slot9-930)
    (blocked-agent3 slot930-10)
    (blocked-agent3 slot10-1030)
    (blocked-agent3 slot11-1130)
    (blocked-agent3 slot1130-12)
    (blocked-agent3 slot12-1230)
    (blocked-agent3 slot1230-13)
    (blocked-agent3 slot13-1330)
    (blocked-agent3 slot15-1530)
    (blocked-agent3 slot1530-16)
    (blocked-agent3 slot16-1630)

    (preferred-agent3 slot14-1430)
    (available slot1330-14)
    (available slot14-1430)
  )
  
  (:goal
    (exists (?slot - time-slot) 
      (meeting-scheduled ?slot))
  )
)