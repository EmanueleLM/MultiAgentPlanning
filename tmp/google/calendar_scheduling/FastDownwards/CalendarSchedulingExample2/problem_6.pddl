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
    (blocked slot930-10)
    (blocked slot10-1030)
    (blocked slot14-1430)
    (blocked slot1430-15)
    (blocked slot1530-16)
    (blocked slot16-1630)
    (preferred slot14-1430)
    (preferred slot15-1530)
  )
  
  (:goal
    (and 
      (meeting-scheduled ?slot - time-slot)
      (scheduled ?t - time-slot)
      (meeting-scheduled ?slot)
    )
  )
)