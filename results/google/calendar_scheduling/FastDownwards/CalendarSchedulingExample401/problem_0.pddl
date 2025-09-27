(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    meeting1 - meeting
    william - participant
    ; 30-minute start slots between 09:00 and 16:30 (meeting must be between 09:00 and 17:00)
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )
  (:init
    ; domain facts
    (meeting meeting1)
    (unscheduled meeting1)
    (participant william)

    (slot s09_00) (slot s09_30) (slot s10_00) (slot s10_30)
    (slot s11_00) (slot s11_30) (slot s12_00) (slot s12_30)
    (slot s13_00) (slot s13_30) (slot s14_00) (slot s14_30)
    (slot s15_00) (slot s15_30) (slot s16_00) (slot s16_30)

    ; Availability facts derived from inputs:
    ; - Public constraint: meeting must be on Monday between 09:00 and 17:00 (modeled by available slot set)
    ; - William's natural-language preference "avoid meetings after 13:30" is treated as a hard constraint:
    ;   therefore William is available only for 30-minute starts that end by or at 13:30.
    ;   That gives allowed start slots: 09:00, 09:30, 10:00, 10:30, 11:00, 11:30, 12:00, 12:30, 13:00.
    (available william s09_00)
    (available william s09_30)
    (available william s10_00)
    (available william s10_30)
    (available william s11_00)
    (available william s11_30)
    (available william s12_00)
    (available william s12_30)
    (available william s13_00)
  )
  ; Prioritise the earliest feasible start time that respects all constraints.
  ; The earliest allowed start given constraints above is 09:00, so the goal is scheduling meeting1 at s09_00.
  (:goal (scheduled meeting1 s09_00))
)