(define (problem schedule-kcl-monday)
  (:domain calendar-meeting)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )
  (:init
    ;; busy facts (more compact than enumerating all free facts)
    ;; Kathryn busy: 09:00-09:30, 10:30-11:00, 11:30-12:00, 13:30-14:30, 16:30-17:00
    (busy kathryn t0900) (busy kathryn t1030) (busy kathryn t1130) (busy kathryn t1330) (busy kathryn t1400) (busy kathryn t1630)

    ;; Charlotte busy: 12:00-12:30, 16:00-16:30
    (busy charlotte t1200) (busy charlotte t1600)

    ;; Lauren busy: 09:00-10:00, 12:00-12:30, 13:30-14:30, 15:00-16:00, 16:30-17:00
    (busy lauren t0900) (busy lauren t0930) (busy lauren t1200) (busy lauren t1330) (busy lauren t1400)
    (busy lauren t1500) (busy lauren t1530) (busy lauren t1630)

    ;; allowed slots reflecting Charlotte's preference (no meeting starting after 13:00)
    (allowed t0900) (allowed t0930) (allowed t1000) (allowed t1030)
    (allowed t1100) (allowed t1130) (allowed t1200) (allowed t1230) (allowed t1300)
  )
  (:goal (scheduled))
)