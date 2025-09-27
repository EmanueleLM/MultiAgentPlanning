(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    p-wayne p-edward p-lauren p-helen p-michael p-joseph p-vincent - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; Wayne: unavailable s1430, s1530 -> available all other slots
    (available p-wayne s0900) (available p-wayne s0930) (available p-wayne s1000) (available p-wayne s1030)
    (available p-wayne s1100) (available p-wayne s1130) (available p-wayne s1200) (available p-wayne s1230)
    (available p-wayne s1300) (available p-wayne s1330) (available p-wayne s1400) (available p-wayne s1500)
    (available p-wayne s1600) (available p-wayne s1630)

    ;; Edward: free entire work day
    (available p-edward s0900) (available p-edward s0930) (available p-edward s1000) (available p-edward s1030)
    (available p-edward s1100) (available p-edward s1130) (available p-edward s1200) (available p-edward s1230)
    (available p-edward s1300) (available p-edward s1330) (available p-edward s1400) (available p-edward s1430)
    (available p-edward s1500) (available p-edward s1530) (available p-edward s1600) (available p-edward s1630)

    ;; Lauren: free entire work day
    (available p-lauren s0900) (available p-lauren s0930) (available p-lauren s1000) (available p-lauren s1030)
    (available p-lauren s1100) (available p-lauren s1130) (available p-lauren s1200) (available p-lauren s1230)
    (available p-lauren s1300) (available p-lauren s1330) (available p-lauren s1400) (available p-lauren s1430)
    (available p-lauren s1500) (available p-lauren s1530) (available p-lauren s1600) (available p-lauren s1630)

    ;; Helen: free entire work day
    (available p-helen s0900) (available p-helen s0930) (available p-helen s1000) (available p-helen s1030)
    (available p-helen s1100) (available p-helen s1130) (available p-helen s1200) (available p-helen s1230)
    (available p-helen s1300) (available p-helen s1330) (available p-helen s1400) (available p-helen s1430)
    (available p-helen s1500) (available p-helen s1530) (available p-helen s1600) (available p-helen s1630)

    ;; Michael: unavailable 09:00-10:00 (s0900,s0930), 10:30-11:30 (s1030,s1100), 12:00-13:00 (s1200,s1230),
    ;; 13:30-14:30 (s1330,s1400), 16:00-17:00 (s1600,s1630)
    ;; Therefore available: s1000, s1130, s1300, s1430, s1500, s1530
    (available p-michael s1000) (available p-michael s1130) (available p-michael s1300)
    (available p-michael s1430) (available p-michael s1500) (available p-michael s1530)

    ;; Joseph: unavailable 09:00-12:00 (s0900,s0930,s1000,s1030,s1100,s1130), 14:00-14:30 (s1400), 15:30-16:00 (s1530)
    ;; Available: s1200, s1230, s1300, s1330, s1430, s1500, s1600, s1630
    (available p-joseph s1200) (available p-joseph s1230) (available p-joseph s1300) (available p-joseph s1330)
    (available p-joseph s1430) (available p-joseph s1500) (available p-joseph s1600) (available p-joseph s1630)

    ;; Vincent: unavailable 09:00-10:30 (s0900,s0930,s1000), 11:30-13:00 (s1130,s1200,s1230), 13:30-14:00 (s1330),
    ;; 14:30-17:00 (s1430,s1500,s1530,s1600,s1630)
    ;; Available: s1030, s1100, s1300, s1400
    (available p-vincent s1030) (available p-vincent s1100) (available p-vincent s1300) (available p-vincent s1400)

    ;; Slot-level consolidation: only s1300 is free for all participants
    (allfree s1300)
  )

  ;; Goal: schedule the single 30-minute meeting at the earliest feasible slot that works for everyone.
  (:goal (and (meeting-scheduled) (scheduled-at s1300)))
)