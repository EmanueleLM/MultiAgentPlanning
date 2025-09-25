(define (problem schedule-meeting-monday)
  (:domain meeting-orchestration)
  (:objects
    ralph peter daniel - agent
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; Ralph: busy on Monday 13:30-14:00 (s1330) and 14:30-15:00 (s1430).
    ;; So Ralph is free at all other slots.
    (free-ralph s0900) (free-ralph s0930) (free-ralph s1000) (free-ralph s1030)
    (free-ralph s1100) (free-ralph s1130) (free-ralph s1200) (free-ralph s1230)
    (free-ralph s1300)               (free-ralph s1400)
    (free-ralph s1500) (free-ralph s1530) (free-ralph s1600) (free-ralph s1630)

    ;; Peter: busy on Monday 09:00-09:30 (s0900), 11:00-13:00 (s1100,s1130,s1200,s1230),
    ;; and 16:00-16:30 (s1600).
    ;; So Peter is free at the other slots.
    (free-peter s0930) (free-peter s1000) (free-peter s1030)
    (free-peter s1300) (free-peter s1330) (free-peter s1400) (free-peter s1430)
    (free-peter s1500) (free-peter s1530) (free-peter s1630)

    ;; Daniel: busy on Monday 09:00-10:00 (s0900,s0930), 10:30-15:30 (s1030,s1100,s1130,s1200,s1230,s1300,s1330,s1400,s1430,s1500),
    ;; and 16:00-17:00 (s1600,s1630).
    ;; Therefore Daniel is free only at s1000 (10:00-10:30) and s1530 (15:30-16:00).
    (free-daniel s1000) (free-daniel s1530)

    ;; Daniel's preference: "avoid meetings on Monday after 13:30 if possible".
    ;; We mark as preferred the slots starting at or before 13:30. (We do not assume more complex fallback rules.)
    (preferred-daniel s0900) (preferred-daniel s0930) (preferred-daniel s1000)
    (preferred-daniel s1030) (preferred-daniel s1100) (preferred-daniel s1130)
    (preferred-daniel s1200) (preferred-daniel s1230) (preferred-daniel s1300)
    (preferred-daniel s1330)
  )

  ;; The goal is simply that a meeting is scheduled (the plan will need to select a concrete slot).
  (:goal (meeting-scheduled))
)