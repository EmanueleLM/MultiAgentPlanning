(define (problem schedule-monday)
  (:domain meeting-scheduling)

  ;; Objects: 30-minute slots from 09:00 to 17:00 (s1 = 09:00-09:30, s2 = 09:30-10:00, ..., s16 = 16:30-17:00)
  (:objects
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
    william - participant
  )

  (:init
    ;; Declare participant and slots
    (participant william)
    (slot s1) (slot s2) (slot s3) (slot s4) (slot s5) (slot s6) (slot s7) (slot s8)
    (slot s9) (slot s10) (slot s11) (slot s12) (slot s13) (slot s14) (slot s15) (slot s16)

    ;; Availability derived from inputs:
    ;; - The meeting must be Monday 09:00-17:00: modeled by the defined slots.
    ;; - William's natural-language preference "avoid meetings after 13:30" is treated as a hard constraint.
    ;;   Therefore William is available only for slots that end at or before 13:30.
    ;;   Slot mapping: s1=09:00-09:30 ... s9=13:00-13:30. (Slots s10+ are after 13:30 and thus unavailable.)
    (available william s1)
    (available william s2)
    (available william s3)
    (available william s4)
    (available william s5)
    (available william s6)
    (available william s7)
    (available william s8)
    (available william s9)
  )

  ;; Goal: schedule the meeting at the earliest slot that respects all constraints.
  ;; Given the provided availability (William available s1..s9 only) and the requirement to prioritise
  ;; the earliest feasible time, we require the meeting to be scheduled in s1 (09:00-09:30).
  (:goal (meeting-scheduled s1))
)