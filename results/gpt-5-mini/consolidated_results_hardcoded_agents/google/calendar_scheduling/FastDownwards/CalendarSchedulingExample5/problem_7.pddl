(define (problem schedule-kcl-monday)
  (:domain calendar-meeting)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 - timeslot
  )
  (:init
    ;; allowed slots (Charlotte: do not meet after 13:30 -> latest start 13:00)
    (allowed t0900) (allowed t0930) (allowed t1000) (allowed t1030)
    (allowed t1100) (allowed t1130) (allowed t1200) (allowed t1230) (allowed t1300)

    ;; busy facts (half-open 30-min slots) -- smaller set restricted to relevant timeslots
    ;; Kathryn busy: 09:00, 10:30, 11:30
    (busy kathryn t0900) (busy kathryn t1030) (busy kathryn t1130)
    ;; Charlotte busy: 12:00
    (busy charlotte t1200)
    ;; Lauren busy: 09:00, 09:30, 12:00
    (busy lauren t0900) (busy lauren t0930) (busy lauren t1200)
  )
  (:goal (scheduled))
)