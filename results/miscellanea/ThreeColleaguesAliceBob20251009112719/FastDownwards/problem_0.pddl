(define (problem schedule-meeting-oct21)
  (:domain meeting-scheduling)
  (:objects
    alice bob carol - person

    t0900 t0915 t0930 t0945 t1000 t1015 t1030 t1045
    t1100 t1115 t1130 t1145 t1200 t1215 t1230 t1245
    t1300 t1315 t1330 t1345 t1400 t1415 t1430 t1445
    t1500 t1515 t1530 t1545 t1600 t1615 t1630 t1645 - time
  )

  (:init
    ;; next relations (15-minute granularity)
    (next t0900 t0915) (next t0915 t0930) (next t0930 t0945) (next t0945 t1000)
    (next t1000 t1015) (next t1015 t1030) (next t1030 t1045) (next t1045 t1100)
    (next t1100 t1115) (next t1115 t1130) (next t1130 t1145) (next t1145 t1200)
    (next t1200 t1215) (next t1215 t1230) (next t1230 t1245) (next t1245 t1300)
    (next t1300 t1315) (next t1315 t1330) (next t1330 t1345) (next t1345 t1400)
    (next t1400 t1415) (next t1415 t1430) (next t1430 t1445) (next t1445 t1500)
    (next t1500 t1515) (next t1515 t1530) (next t1530 t1545) (next t1545 t1600)
    (next t1600 t1615) (next t1615 t1630) (next t1630 t1645)

    ;; Bob's preference treated as a hard constraint: avoid scheduling start times before 11:00
    (bob_avoid t0900) (bob_avoid t0915) (bob_avoid t0930) (bob_avoid t0945)
    (bob_avoid t1000) (bob_avoid t1015) (bob_avoid t1030) (bob_avoid t1045)

    ;; Availability facts (15-minute blocks). A block 'tXXXX' means that 15-minute block starting at that time is free.
    ;; Alice: Available 09:00-11:00 -> blocks starting 09:00 .. 10:45
    (available alice t0900) (available alice t0915) (available alice t0930) (available alice t0945)
    (available alice t1000) (available alice t1015) (available alice t1030) (available alice t1045)
    ;; Alice: Available 13:00-16:00 -> blocks starting 13:00 .. 15:45
    (available alice t1300) (available alice t1315) (available alice t1330) (available alice t1345)
    (available alice t1400) (available alice t1415) (available alice t1430) (available alice t1445)
    (available alice t1500) (available alice t1515) (available alice t1530) (available alice t1545)

    ;; Bob: Available 10:30-12:00 -> blocks starting 10:30 .. 11:45
    (available bob t1030) (available bob t1045) (available bob t1100) (available bob t1115)
    (available bob t1130) (available bob t1145)
    ;; Bob: Available 14:00-15:30 -> blocks starting 14:00 .. 15:15
    (available bob t1400) (available bob t1415) (available bob t1430) (available bob t1445)
    (available bob t1500) (available bob t1515)

    ;; Carol: Available 09:30-10:30 -> blocks starting 09:30 .. 10:15
    (available carol t0930) (available carol t0945) (available carol t1000) (available carol t1015)
    ;; Carol: Available 11:00-12:30 -> blocks starting 11:00 .. 12:15
    (available carol t1100) (available carol t1115) (available carol t1130) (available carol t1145)
    (available carol t1200) (available carol t1215)
    ;; Carol: Available 15:00-17:00 -> blocks starting 15:00 .. 16:45
    (available carol t1500) (available carol t1515) (available carol t1530) (available carol t1545)
    (available carol t1600) (available carol t1615) (available carol t1630) (available carol t1645)
  )

  ;; Goal: a single meeting must be scheduled (the planner will pick a time that satisfies all hard constraints).
  (:goal (and (scheduled)))
)