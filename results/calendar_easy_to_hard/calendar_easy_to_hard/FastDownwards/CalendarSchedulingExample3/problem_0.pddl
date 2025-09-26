(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )

  (:init
    ;; consecutive pairs (30-min steps)
    (consecutive t0900 t0930)
    (consecutive t0930 t1000)
    (consecutive t1000 t1030)
    (consecutive t1030 t1100)
    (consecutive t1100 t1130)
    (consecutive t1130 t1200)
    (consecutive t1200 t1230)
    (consecutive t1230 t1300)
    (consecutive t1300 t1330)
    (consecutive t1330 t1400)
    (consecutive t1400 t1430)
    (consecutive t1430 t1500)
    (consecutive t1500 t1530)
    (consecutive t1530 t1600)
    (consecutive t1600 t1630)

    ;; Earliest-start constraint encoded explicitly: allow only t0930 as start (earliest feasible)
    (allowed-start t0930)

    ;; Arthur: free in slots not listed as busy
    ;; Arthur busy: t0900, t1030, t1100, t1130, t1600, t1630
    (free-arthur t0930)
    (free-arthur t1000)
    (free-arthur t1200)
    (free-arthur t1230)
    (free-arthur t1300)
    (free-arthur t1330)
    (free-arthur t1400)
    (free-arthur t1430)
    (free-arthur t1500)
    (free-arthur t1530)

    ;; Michael: busy t1300, t1400
    (free-michael t0900)
    (free-michael t0930)
    (free-michael t1000)
    (free-michael t1030)
    (free-michael t1100)
    (free-michael t1130)
    (free-michael t1200)
    (free-michael t1230)
    (free-michael t1330)
    (free-michael t1430)
    (free-michael t1500)
    (free-michael t1530)
    (free-michael t1600)
    (free-michael t1630)

    ;; Samantha: busy t1030, t1200, t1230, t1300, t1330, t1400, t1430, t1530, t1600, t1630
    (free-samantha t0900)
    (free-samantha t0930)
    (free-samantha t1000)
    (free-samantha t1100)
    (free-samantha t1130)
    (free-samantha t1500)
  )

  (:goal (meeting-scheduled))
)