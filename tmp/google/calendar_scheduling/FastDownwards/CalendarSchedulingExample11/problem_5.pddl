(define (problem schedule-meeting-monday-integrated)
  (:domain meeting-scheduling)

  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )

  (:init
    ;; Alexander busy: 09:30-10:00, 10:30-11:00, 12:30-13:00, 14:30-15:00, 16:00-17:00
    (busy alexander t0930)
    (busy alexander t1030)
    (busy alexander t1230)
    (busy alexander t1430)
    (busy alexander t1600)
    (busy alexander t1630)

    ;; Elizabeth busy: 09:00-09:30, 11:30-12:30, 13:00-14:30
    (busy elizabeth t0900)
    (busy elizabeth t1130)
    (busy elizabeth t1200)
    (busy elizabeth t1300)
    (busy elizabeth t1330)
    (busy elizabeth t1400)

    ;; Walter busy: 09:00-14:30, 15:30-17:00
    (busy walter t0900)
    (busy walter t0930)
    (busy walter t1000)
    (busy walter t1030)
    (busy walter t1100)
    (busy walter t1130)
    (busy walter t1200)
    (busy walter t1230)
    (busy walter t1300)
    (busy walter t1330)
    (busy walter t1400)
    (busy walter t1430)
    (busy walter t1530)
    (busy walter t1600)
    (busy walter t1630)
  )

  (:goal (meeting-scheduled))
)