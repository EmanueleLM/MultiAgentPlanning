(define (problem calendar_scheduling_example29)
  (:domain calendar_scheduling)
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    ;; Sequence of 30-minute intervals from 09:00 to 17:00
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

    ;; Madison's busy schedule: 9:30-10:00, 11:30-12:00
    (busy madison s0930)
    (busy madison s1130)

    ;; Diana's busy schedule: 11:00-11:30, 13:00-13:30
    (busy diana s1100)
    (busy diana s1300)

    ;; Shirley's busy schedule: 9:00-12:00, 13:30-15:00, 15:30-17:00
    (busy shirley s0900)
    (busy shirley s0930)
    (busy shirley s1000)
    (busy shirley s1030)
    (busy shirley s1100)
    (busy shirley s1130)
    (busy shirley s1330)
    (busy shirley s1400)
    (busy shirley s1430)
    (busy shirley s1530)
    (busy shirley s1600)
    (busy shirley s1630)
  )
  (:goal
    (meeting_scheduled)
  )
)