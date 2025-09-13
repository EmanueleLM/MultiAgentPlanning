(define (problem integrated_meeting_schedule)
  (:domain integrated_meeting_scheduler)
  
  (:objects
    slot9-930 slot930-10 slot10-1030 slot1030-11 slot11-1130
    slot1130-12 slot12-1230 slot1230-13 slot13-1330 slot1330-14
    slot14-1430 slot1430-15 slot15-1530 slot1530-16 slot16-1630
  )
  
  (:init 
    ;; Agent 1 available slots
    (available slot930-10) 
    (available slot1030-11) 
    (available slot1130-12)
    (available slot12-1230)
    (available slot13-1330)
    (available slot1330-14)
    (available slot14-1430)
    (available slot1430-15)
    (available slot15-1530)
    (available slot1530-16)
    (available slot16-1630)
    
    ;; Agent 2 available slots
    (available slot930-10)
    (available slot1030-11) 
    (available slot11-1130)
    (available slot12-1230)
    (available slot1230-13)
    (available slot13-1330)
    (available slot1330-14)
    (available slot14-1430)
    (available slot1430-15)
    (available slot15-1530)
    (available slot1530-16)
    (available slot16-1630)

    ;; Agent 3 slots, setting preference and blocks
    (blocked slot9-930) ;; 9:00 - 9:30
    (blocked slot930-10) ;; 9:30 - 10:00
    (blocked slot10-1030) ;; 10:00 - 10:30
    (free slot14-1430) ;; 14:30 - 15:00
    (free slot15-1530) ;; 15:00 - 15:30
    (preferred slot14-1430)
    (preferred slot15-1530)
  )
  
  (:goal
    (or 
      (exists (?slot - time-slot) (meeting-scheduled ?slot))
      (exists (?t - time-slot) (scheduled ?t))
      (exists (?slot - time-slot)
        (and (free ?slot) (preferred ?slot) (not (blocked ?slot)))
      )
    )
  )
)