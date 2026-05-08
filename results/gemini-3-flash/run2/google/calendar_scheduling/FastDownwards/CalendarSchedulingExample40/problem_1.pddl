(define (problem calendar_problem)
  (:domain calendar_scheduling)
  (:objects
    jacob gabriel matthew - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )
  (:init
    (next t0900 t0930)
    (next t0930 t1000)
    (next t1000 t1030)
    (next t1030 t1100)
    (next t1100 t1130)
    (next t1130 t1200)
    (next t1200 t1230)
    (next t1230 t1300)
    (next t1300 t1330)
    (next t1330 t1400)
    (next t1400 t1430)
    (next t1430 t1500)
    (next t1500 t1530)
    (next t1530 t1600)
    (next t1600 t1630)

    ; Jacob's availability (Busy: 10:00-11:00, 11:30-12:00, 16:00-16:30)
    (available jacob t0900)
    (available jacob t0930)
    ; 10:00-11:00 busy
    (available jacob t1100)
    ; 11:30-12:00 busy
    (available jacob t1200)
    (available jacob t1230)
    (available jacob t1300)
    (available jacob t1330)
    (available jacob t1400)
    (available jacob t1430)
    (available jacob t1500)
    (available jacob t1530)
    ; 16:00-16:30 busy
    (available jacob t1630)

    ; Gabriel's availability (Busy: 9:30-11:30, 13:00-13:30, 15:00-15:30)
    (available gabriel t0900)
    ; 9:30-11:30 busy
    (available gabriel t1130)
    (available gabriel t1200)
    (available gabriel t1230)
    ; 13:00-13:30 busy
    (available gabriel t1330)
    (available gabriel t1400)
    (available gabriel t1430)
    ; 15:00-15:30 busy
    (available gabriel t1530)
    (available gabriel t1600)
    (available gabriel t1630)

    ; Matthew's availability (Busy: 9:00-9:30, 10:30-11:00, 11:30-12:00, 12:30-14:00, 15:30-16:30)
    ; 9:00-9:30 busy
    (available matthew t0930)
    (available matthew t1000)
    ; 10:30-11:00 busy
    (available matthew t1100)
    ; 11:30-12:00 busy
    (available matthew t1200)
    ; 12:30-14:00 busy
    (available matthew t1400)
    (available matthew t1430)
    (available matthew t1500)
    ; 15:30-16:30 busy
    (available matthew t1630)
  )
  (:goal (meeting_scheduled))
)