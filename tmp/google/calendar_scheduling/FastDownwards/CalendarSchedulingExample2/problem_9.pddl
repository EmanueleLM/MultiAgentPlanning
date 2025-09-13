(define (problem integrated_meeting_schedule)
  (:domain integrated_meeting_scheduler)
  
  (:objects
    slot9-930 slot930-10 slot10-1030 slot1030-11 slot11-1130
    slot1130-12 slot12-1230 slot1230-13 slot13-1330 slot1330-14
    slot14-1430 slot1430-15 slot15-1530 slot1530-16 slot16-1630 - time-slot
  )
  
  (:init 
    ;; Agent 1 blocked slots
    (blocked slot9-930)
    (blocked slot10-1030)
    (blocked slot11-1130)
    (blocked slot1230-13)
    
    ;; Agent 2 blocked slots
    (blocked slot930-10)
    (blocked slot16-1630)

    ;; Agent 3 blocked and preferred slots
    (blocked slot9-930)
    (blocked slot15-1530)
    (blocked slot1530-16)
    (preferred slot14-1430)
    (preferred slot15-1530)

    ;; Free slots
    (free slot1330-14)
    (free slot14-1430)
  )
  
  (:goal
    (exists (?slot - time-slot) (meeting-scheduled ?slot))
  )
)