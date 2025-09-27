(define (problem schedule-monday-0900-1700)
  (:domain schedule-meeting)
  (:objects
    meeting1 - meeting
    slot-0900 slot-0930 slot-1000 slot-1030 slot-1100 slot-1130
    slot-1200 slot-1230 slot-1300 slot-1330 slot-1400 slot-1430
    slot-1500 slot-1530 slot-1600 slot-1630 - slot
    amy jonathan brittany matthew catherine carl - participant
  )
  (:init
    ; Precomputed availability facts for each participant (30-minute slots between 09:00 and 17:00)
    (available amy slot-0900) (available amy slot-0930) (available amy slot-1000)
    (available amy slot-1030) (available amy slot-1100) (available amy slot-1130)
    (available amy slot-1200) (available amy slot-1230) (available amy slot-1330)
    (available amy slot-1400) (available amy slot-1430) (available amy slot-1500)
    (available amy slot-1600) (available amy slot-1630)

    (available jonathan slot-0930) (available jonathan slot-1030) (available jonathan slot-1100)
    (available jonathan slot-1200) (available jonathan slot-1300) (available jonathan slot-1330)
    (available jonathan slot-1400) (available jonathan slot-1430) (available jonathan slot-1500)
    (available jonathan slot-1530) (available jonathan slot-1600) (available jonathan slot-1630)

    (available brittany slot-0900) (available brittany slot-1000) (available brittany slot-1030)
    (available brittany slot-1100) (available brittany slot-1130) (available brittany slot-1200)
    (available brittany slot-1230) (available brittany slot-1300) (available brittany slot-1330)
    (available brittany slot-1400) (available brittany slot-1430) (available brittany slot-1500)
    (available brittany slot-1530) (available brittany slot-1600)

    (available matthew slot-1000) (available matthew slot-1030) (available matthew slot-1100)
    (available matthew slot-1130) (available matthew slot-1200) (available matthew slot-1430)
    (available matthew slot-1530) (available matthew slot-1630)

    (available catherine slot-1030) (available catherine slot-1100) (available catherine slot-1130)
    (available catherine slot-1400) (available catherine slot-1430) (available catherine slot-1500)
    (available catherine slot-1530) (available catherine slot-1600)

    (available carl slot-0900) (available carl slot-0930) (available carl slot-1100)
    (available carl slot-1230) (available carl slot-1400) (available carl slot-1630)
  )
  (:goal (and (meeting-scheduled meeting1)))
  (:metric minimize (total-cost))
)