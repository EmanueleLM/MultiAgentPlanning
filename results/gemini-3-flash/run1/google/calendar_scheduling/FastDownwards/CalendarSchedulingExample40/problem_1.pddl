(define (problem schedule_jacob_gabriel_matthew)
  (:domain calendar_scheduling)
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - timeslot
  )
  (:init
    ;; Jacob's busy times: 10:00-11:00, 11:30-12:00, 16:00-16:30
    (busy jacob s1000)
    (busy jacob s1030)
    (busy jacob s1130)
    (busy jacob s1600)

    ;; Gabriel's busy times: 9:30-11:30, 13:00-13:30, 15:00-15:30
    (busy gabriel s0930)
    (busy gabriel s1000)
    (busy gabriel s1030)
    (busy gabriel s1100)
    (busy gabriel s1300)
    (busy gabriel s1500)

    ;; Matthew's busy times: 9:00-9:30, 10:30-11:00, 11:30-12:00, 12:30-14:00, 15:30-16:30
    (busy matthew s0900)
    (busy matthew s1030)
    (busy matthew s1130)
    (busy matthew s1230)
    (busy matthew s1300)
    (busy matthew s1330)
    (busy matthew s1530)
    (busy matthew s1600)

    ;; Adjacency of 30-minute intervals
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
  )
  (:goal (meeting_scheduled))
)