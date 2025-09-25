(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
    ben hann brenda - person
  )

  (:init
    ;; Slot and person declarations
    (slot s0900) (slot s0930) (slot s1000) (slot s1030)
    (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    (person ben) (person hann) (person brenda)

    ;; Benjamin is free the entire day (all slots)
    (free ben s0900) (free ben s0930) (free ben s1000) (free ben s1030)
    (free ben s1100) (free ben s1130) (free ben s1200) (free ben s1230)
    (free ben s1300) (free ben s1330) (free ben s1400) (free ben s1430)
    (free ben s1500) (free ben s1530) (free ben s1600) (free ben s1630)

    ;; Benjamin prefers not to meet after 09:30 (we model preferred slots as those starting at or before 09:30)
    (preferred-by-benjamin s0900)
    (preferred-by-benjamin s0930)

    ;; Hannah is free the entire day (all slots)
    (free hann s0900) (free hann s0930) (free hann s1000) (free hann s1030)
    (free hann s1100) (free hann s1130) (free hann s1200) (free hann s1230)
    (free hann s1300) (free hann s1330) (free hann s1400) (free hann s1430)
    (free hann s1500) (free hann s1530) (free hann s1600) (free hann s1630)

    ;; Brenda's busy / free schedule on Monday (30-minute slots):
    ;; Brenda has meetings 09:30-10:00 -> slot s0930 is busy (NOT free)
    ;; Brenda has meetings 11:30-12:30 -> slots s1130 and s1200 are busy
    ;; Brenda has meetings 14:00-16:30 -> slots s1400, s1430, s1500, s1530, s1600 are busy
    ;; Therefore Brenda is free for the remaining slots:
    (free brenda s0900)
    (free brenda s1000) (free brenda s1030) (free brenda s1100)
    (free brenda s1230) (free brenda s1300) (free brenda s1330)
    (free brenda s1630)
  )

  ;; Goal: have the meeting scheduled. Given all constraints and preferences,
  ;; the only feasible slot that satisfies Benjamin's preference and Brenda's availability is 09:00-09:30 (s0900).
  (:goal (meeting-scheduled s0900))
)