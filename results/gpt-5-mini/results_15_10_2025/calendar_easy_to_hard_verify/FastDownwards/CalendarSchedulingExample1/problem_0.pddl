(define (problem schedule-monday)
  (:domain meeting-scheduling)

  (:objects
    raymond billy donald - agent
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )

  (:init
    ;; Raymond: busy at 09:00, 11:30, 13:00, 15:00 -> those slots are NOT declared free.
    ;; Mark Raymond free at all other work slots.
    (free raymond t0930)
    (free raymond t1000)
    (free raymond t1030)
    (free raymond t1100)
    (free raymond t1200)
    (free raymond t1230)
    (free raymond t1330)
    (free raymond t1400)
    (free raymond t1430)
    (free raymond t1530)
    (free raymond t1600)
    (free raymond t1630)

    ;; Billy: busy at 10:00, 12:00-13:00 (t1200,t1230), 16:30.
    ;; Preference "avoid meetings after 15:00" treated as hard constraint -> disallow t1530,t1600,t1630.
    ;; Mark Billy free at remaining allowed slots (within work hours and respecting preference).
    (free billy t0900)
    (free billy t0930)
    (free billy t1030)
    (free billy t1100)
    (free billy t1130)
    (free billy t1300)
    (free billy t1330)
    (free billy t1400)
    (free billy t1430)
    (free billy t1500)

    ;; Donald: busy at 09:00, 10:00-11:00 (t1000,t1030), 12:00-13:00 (t1200,t1230), 14:00, 16:00-17:00 (t1600,t1630).
    ;; Mark Donald free at remaining work slots.
    (free donald t0930)
    (free donald t1100)
    (free donald t1130)
    (free donald t1300)
    (free donald t1330)
    (free donald t1430)
    (free donald t1500)
    (free donald t1530)
  )

  ;; Goal: schedule the 30-minute meeting at the earliest feasible slot that satisfies all constraints.
  ;; Based on the inputs and hard constraints, the earliest feasible slot is 09:30 (t0930).
  (:goal (meeting-scheduled t0930))
)