(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    gerald roy barbara - person
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )
  (:init
    (participant gerald) (participant roy) (participant barbara)

    (slot s09_00) (slot s09_30) (slot s10_00) (slot s10_30)
    (slot s11_00) (slot s11_30) (slot s12_00) (slot s12_30)
    (slot s13_00) (slot s13_30) (slot s14_00) (slot s14_30)
    (slot s15_00) (slot s15_30) (slot s16_00) (slot s16_30)

    ;; Roy: free all day (09:00-17:00)
    (free-slot roy s09_00) (free-slot roy s09_30) (free-slot roy s10_00) (free-slot roy s10_30)
    (free-slot roy s11_00) (free-slot roy s11_30) (free-slot roy s12_00) (free-slot roy s12_30)
    (free-slot roy s13_00) (free-slot roy s13_30) (free-slot roy s14_00) (free-slot roy s14_30)
    (free-slot roy s15_00) (free-slot roy s15_30) (free-slot roy s16_00) (free-slot roy s16_30)

    ;; Gerald private constraints: busy 09:00-09:30, 13:00-14:00, 15:00-15:30, 16:00-17:00
    ;; therefore free slots are: 09:30,10:00,10:30,11:00,11:30,12:00,12:30,14:00,14:30,15:30
    (free-slot gerald s09_30) (free-slot gerald s10_00) (free-slot gerald s10_30)
    (free-slot gerald s11_00) (free-slot gerald s11_30) (free-slot gerald s12_00)
    (free-slot gerald s12_30) (free-slot gerald s14_00) (free-slot gerald s14_30)
    (free-slot gerald s15_30)

    ;; Barbara private constraints: busy 09:30-10:00, 11:30-14:00, 14:30-15:00, 15:30-17:00
    ;; therefore free slots are: 09:00,10:00,10:30,11:00,14:00,15:00
    (free-slot barbara s09_00) (free-slot barbara s10_00) (free-slot barbara s10_30)
    (free-slot barbara s11_00) (free-slot barbara s14_00) (free-slot barbara s15_00)
  )
  (:goal (and
    (meeting-scheduled)
    (meeting-with gerald)
    (meeting-with roy)
    (meeting-with barbara)
  ))
)