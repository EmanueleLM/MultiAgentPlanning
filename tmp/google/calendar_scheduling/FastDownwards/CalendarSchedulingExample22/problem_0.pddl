(define (problem monday-meeting)
  (:domain multi-agent-meeting)
  (:objects
     p1 p2 p3 p4 - person
     t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )
  (:init
     ; Theresa-like constraints: only 60-minute window via two consecutive 30-min slots: 12:30 and 13:00
     (consecutive t1230 t1300)
     (free_theresa p1 t1230) (free_theresa p1 t1300)
     (free_theresa p2 t1230) (free_theresa p2 t1300)
     (free_theresa p3 t1230) (free_theresa p3 t1300)
     (free_theresa p4 t1230) (free_theresa p4 t1300)

     ; Second agent-like availability: 11:30, 14:00, 14:30 starts
     (free_second t1130)
     (free_second t1400)
     (free_second t1430)

     ; Third agent-like busy times (per the third agent's knowledge)
     (busy p1 t0900) (busy p1 t0930) (busy p1 t1000)
     (busy p2 t1200)
     (busy p3 t1300)
     (busy p4 t1500)

     ; Next-slot relations (as in the third agent)
     (next t0900 t0930) (next t0930 t1000) (next t1000 t1030) (next t1030 t1100)
     (next t1100 t1130) (next t1130 t1200) (next t1200 t1230) (next t1230 t1300)
     (next t1300 t1330) (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
     (next t1500 t1530) (next t1530 t1600) (next t1600 t1630)
  )
  (:goal
     (and
       ; We attempt to force a single window that satisfies Theresa and also exists in the third agent's frame
       (meeting_scheduled_theresa t1230 t1300)
       (meet_at t1230)
     )
  )
)