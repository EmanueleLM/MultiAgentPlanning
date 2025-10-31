(define (problem schedule-monday-meeting)
  (:domain meeting-scheduling)

  (:objects
    joyce christine alexander - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )

  (:init
    ;; Joyce availability (busy: 11:00-11:30 (t1100), 13:30-14:00 (t1330), 14:30-16:30 (t1430 t1500 t1530 t1600))
    (available joyce t0900)
    (available joyce t0930)
    (available joyce t1000)
    (available joyce t1030)
    (available joyce t1130)
    (available joyce t1200)
    (available joyce t1230)
    (available joyce t1300)
    (available joyce t1400)
    (available joyce t1630)

    ;; Christine availability (no meetings, but cannot meet before 12:00)
    (available christine t1200)
    (available christine t1230)
    (available christine t1300)
    (available christine t1330)
    (available christine t1400)
    (available christine t1430)
    (available christine t1500)
    (available christine t1530)
    (available christine t1600)
    (available christine t1630)

    ;; Alexander availability (busy: 09:00-11:00 (t0900 t0930 t1000 t1030), 12:00-12:30 (t1200), 13:30-15:00 (t1330 t1400 t1430), 15:30-16:00 (t1530), 16:30-17:00 (t1630))
    (available alexander t1100)
    (available alexander t1130)
    (available alexander t1230)
    (available alexander t1300)
    (available alexander t1500)
    (available alexander t1600)
  )

  (:goal (and
    (meeting-scheduled)
  ))
)