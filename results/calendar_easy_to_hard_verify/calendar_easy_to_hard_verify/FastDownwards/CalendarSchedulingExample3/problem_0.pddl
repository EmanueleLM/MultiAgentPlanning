(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )
  (:init
    ;; consecutive half-hour pairs (start -> next)
    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030) (next t1030 t1100)
    (next t1100 t1130) (next t1130 t1200) (next t1200 t1230) (next t1230 t1300)
    (next t1300 t1330) (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630)

    ;; free slots for Arthur (all slots between 09:00 and 16:30 except busy ones)
    ;; Arthur busy: 09:00, 10:30, 11:00, 11:30, 16:00, 16:30
    (free-arthur t0930) (free-arthur t1000)
    (free-arthur t1200) (free-arthur t1230)
    (free-arthur t1300) (free-arthur t1330)
    (free-arthur t1400) (free-arthur t1430)
    (free-arthur t1500) (free-arthur t1530)

    ;; free slots for Michael
    ;; Michael busy: 13:00, 14:00
    (free-michael t0900) (free-michael t0930) (free-michael t1000) (free-michael t1030)
    (free-michael t1100) (free-michael t1130) (free-michael t1200) (free-michael t1230)
    (free-michael t1330) (free-michael t1430) (free-michael t1500) (free-michael t1530)
    (free-michael t1600) (free-michael t1630)

    ;; free slots for Samantha
    ;; Samantha busy: 10:30, 12:00, 12:30, 13:00, 13:30, 14:00, 14:30, 15:30, 16:00, 16:30
    (free-samantha t0900) (free-samantha t0930) (free-samantha t1000)
    (free-samantha t1100) (free-samantha t1130)
    (free-samantha t1500)
  )
  ;; Goal: schedule the meeting at the earliest feasible start (09:30 -> 10:30)
  (:goal (scheduled t0930 t1000))
)