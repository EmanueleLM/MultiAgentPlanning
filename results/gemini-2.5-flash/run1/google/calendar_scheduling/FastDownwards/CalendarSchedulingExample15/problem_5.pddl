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
    ; (available joyce t1100) ; Busy
    (available joyce t1130)
    (available joyce t1200)
    (available joyce t1230)
    (available joyce t1300)
    ; (available joyce t1330) ; Busy
    (available joyce t1400)
    ; (available joyce t1430) ; Busy
    ; (available joyce t1500) ; Busy
    ; (available joyce t1530) ; Busy
    ; (available joyce t1600) ; Busy
    (available joyce t1630)

    ;; Christine's availability (Cannot meet before 12:00)
    ; (available christine t0900) ; Busy
    ; (available christine t0930) ; Busy
    ; (available christine t1000) ; Busy
    ; (available christine t1030) ; Busy
    ; (available christine t1100) ; Busy
    ; (available christine t1130) ; Busy
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
    ; (available alexander t0900) ; Busy
    ; (available alexander t0930) ; Busy
    ; (available alexander t1000) ; Busy
    ; (available alexander t1030) ; Busy
    (available alexander t1100)
    (available alexander t1130)
    ; (available alexander t1200) ; Busy
    (available alexander t1230)
    (available alexander t1300)
    ; (available alexander t1330) ; Busy
    ; (available alexander t1400) ; Busy
    ; (available alexander t1430) ; Busy
    (available alexander t1500)
    ; (available alexander t1530) ; Busy
    (available alexander t1600)
    ; (available alexander t1630) ; Busy
  )
  (:goal (meeting_scheduled t1230))
)