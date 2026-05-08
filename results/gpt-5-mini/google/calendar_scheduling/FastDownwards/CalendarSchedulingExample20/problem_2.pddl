(define (problem schedule-monday-meeting)
  (:domain meeting_scheduling)
  ; Solver: FastDownwards

  (:objects
    ralph peter daniel - participant

    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; Mark slots that satisfy "before 13:30" (slot starts at or before 13:00)
    (before_1330 s0900) (before_1330 s0930) (before_1330 s1000) (before_1330 s1030)
    (before_1330 s1100) (before_1330 s1130) (before_1330 s1200) (before_1330 s1230)
    (before_1330 s1300)

    ;; Participants' availability (30-minute resolution) derived from provided busy blocks.

    ;; Ralph: busy 13:30-14:00 (s1330), 14:30-15:00 (s1430)
    (available ralph s0900) (available ralph s0930) (available ralph s1000) (available ralph s1030)
    (available ralph s1100) (available ralph s1130) (available ralph s1200) (available ralph s1230)
    (available ralph s1300)
    (available ralph s1400) (available ralph s1500) (available ralph s1530)
    (available ralph s1600) (available ralph s1630)

    ;; Peter: busy 09:00-09:30 (s0900), 11:00-13:00 (s1100,s1130,s1200,s1230), 16:00-16:30 (s1600)
    (available peter s0930) (available peter s1000) (available peter s1030)
    (available peter s1300) (available peter s1330) (available peter s1400)
    (available peter s1430) (available peter s1500) (available peter s1530) (available peter s1630)

    ;; Daniel: busy 09:00-10:00 (s0900,s0930), 10:30-15:30 (s1030..s1500), and 16:00-17:00 (s1600,s1630)
    ;; Therefore Daniel is available only at s1000 (10:00-10:30) and s1530 (15:30-16:00).
    (available daniel s1000) (available daniel s1530)

    ;; Preferred slots: those before 13:30 that are free for all participants.
    ;; Compute and encode explicitly for the instance: s1000 is free for ralph, peter, and daniel and is before 13:30.
    (preferred_slot s1000)
    (preferred_exists)
  )

  ;; Goal: schedule a single 30-minute meeting free for all three participants.
  (:goal (meeting_scheduled))
)