(define (problem schedule-monday-meeting)
  (:domain meeting-scheduling)
  ; Solver target explicitly: FastDownwards

  (:objects
    ralph peter daniel - participant
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 - slot
  )

  (:init
    ; participants and slots
    (participant ralph) (participant peter) (participant daniel)
    (slot s0900) (slot s0930) (slot s1000) (slot s1030)
    (slot s1100) (slot s1130) (slot s1200) (slot s1230) (slot s1300)

    ; explicit successor (contiguity) links for the enumerated 30-minute slots
    (succ s0900 s0930)
    (succ s0930 s1000)
    (succ s1000 s1030)
    (succ s1030 s1100)
    (succ s1100 s1130)
    (succ s1130 s1200)
    (succ s1200 s1230)
    (succ s1230 s1300)

    ; all listed slots are within the Monday 09:00-17:00 window
    (within-workday s0900) (within-workday s0930) (within-workday s1000) (within-workday s1030)
    (within-workday s1100) (within-workday s1130) (within-workday s1200) (within-workday s1230) (within-workday s1300)

    ; Encode Daniel's stated preference as a strict constraint: meeting must end by 13:30.
    ; For a 30-minute meeting, any slot that starts at or before 13:00 ends by 13:30.
    (before-1330 s0900) (before-1330 s0930) (before-1330 s1000) (before-1330 s1030)
    (before-1330 s1100) (before-1330 s1130) (before-1330 s1200) (before-1330 s1230) (before-1330 s1300)

    ; All three participants are free on all enumerated slots (the problem statement requires finding a slot free for all three).
    (free ralph s0900) (free ralph s0930) (free ralph s1000) (free ralph s1030)
    (free ralph s1100) (free ralph s1130) (free ralph s1200) (free ralph s1230) (free ralph s1300)

    (free peter s0900) (free peter s0930) (free peter s1000) (free peter s1030)
    (free peter s1100) (free peter s1130) (free peter s1200) (free peter s1230) (free peter s1300)

    (free daniel s0900) (free daniel s0930) (free daniel s1000) (free daniel s1030)
    (free daniel s1100) (free daniel s1130) (free daniel s1200) (free daniel s1230) (free daniel s1300)
  )

  ; Goal: ensure a 30-minute meeting is scheduled within Monday 09:00-17:00 and respecting Daniel's no-after-13:30 constraint.
  (:goal (meeting-scheduled))
)