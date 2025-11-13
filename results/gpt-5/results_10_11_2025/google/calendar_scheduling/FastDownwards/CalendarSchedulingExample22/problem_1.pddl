(define (problem schedule-monday-meeting-example22)
  (:domain calendar-scheduling-30min)
  (:objects
    m1 - meeting
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - timeslot
  )
  (:init
    (next s0900 s0930)
    (next s0930 s1000)
    (next s1000 s1030)
    (next s1030 s1100)
    (next s1100 s1130)
    (next s1130 s1200)
    (next s1200 s1230)
    (next s1230 s1300)
    (next s1300 s1330)
    (next s1330 s1400)
    (next s1400 s1430)
    (next s1430 s1500)
    (next s1500 s1530)
    (next s1530 s1600)
    (next s1600 s1630)

    ; Theresa busy: 09:00-09:30, 12:30-13:30, 14:00-15:00, 16:30-17:00
    (busy theresa s0900)
    (busy theresa s1230)
    (busy theresa s1300)
    (busy theresa s1400)
    (busy theresa s1430)
    (busy theresa s1630)

    ; Charles busy: 10:00-10:30, 11:30-12:30, 14:00-15:30
    (busy charles s1000)
    (busy charles s1130)
    (busy charles s1200)
    (busy charles s1400)
    (busy charles s1430)
    (busy charles s1500)

    ; Betty busy: 09:00-10:30, 12:00-12:30, 13:00-14:00, 15:00-16:00
    (busy betty s0900)
    (busy betty s0930)
    (busy betty s1000)
    (busy betty s1200)
    (busy betty s1300)
    (busy betty s1330)
    (busy betty s1500)
    (busy betty s1530)
  )
  (:goal
    (and
      (scheduled m1)
    )
  )
)