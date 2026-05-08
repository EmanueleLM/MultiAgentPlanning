(define (problem calendar-scheduling-problem-15)
  (:domain calendar-scheduling-domain)
  (:objects
    joyce christine alexander - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_slot
  )
  (:init
    ;; Joyce's availability (Busy: 11:00-11:30, 13:30-14:00, 14:30-16:30)
    (available joyce t0900)
    (available joyce t0930)
    (available joyce t1000)
    (available joyce t1030)
    ; (busy joyce t1100) ; 11:00-11:30
    (available joyce t1130)
    (available joyce t1200)
    (available joyce t1230)
    (available joyce t1300)
    ; (busy joyce t1330) ; 13:30-14:00
    (available joyce t1400) ; 14:00-14:30 is free for Joyce. This fact was missing in the original problem.
    ; (busy joyce t1430) ; 14:30-16:30 starts here, covering t1430, t1500, t1530, t1600
    ; (busy joyce t1500)
    ; (busy joyce t1530)
    ; (busy joyce t1600)
    (available joyce t1630)

    ;; Christine's availability (Busy: before 12:00)
    ; (busy christine t0900) ; Cannot meet before 12:00
    ; (busy christine t0930)
    ; (busy christine t1000)
    ; (busy christine t1030)
    ; (busy christine t1100)
    ; (busy christine t1130)
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

    ;; Alexander's availability (Busy: 9:00-11:00, 12:00-12:30, 13:30-15:00, 15:30-16:00, 16:30-17:00)
    ; (busy alexander t0900) ; 9:00-11:00 covers t0900, t0930, t1000, t1030
    ; (busy alexander t0930)
    ; (busy alexander t1000)
    ; (busy alexander t1030)
    (available alexander t1100)
    (available alexander t1130)
    ; (busy alexander t1200) ; 12:00-12:30 covers t1200
    (available alexander t1230)
    (available alexander t1300)
    ; (busy alexander t1330) ; 13:30-15:00 covers t1330, t1400, t1430
    ; (busy alexander t1400)
    ; (busy alexander t1430)
    (available alexander t1500)
    ; (busy alexander t1530) ; 15:30-16:00 covers t1530
    (available alexander t1600)
    ; (busy alexander t1630) ; 16:30-17:00 covers t1630
  )
  (:goal (meeting_scheduled t1230))
)