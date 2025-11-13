(define (problem andrew-105min-from-presidio)
  (:domain day-planning)
  (:objects
    presidio unionsquare - location
    andrew - friend

    ; discrete minute points
    t0900 t0922
    t1115 t1130 t1145 t1200 t1215 t1230 t1245 t1300
    t1315 t1330 t1345 t1400 t1415 t1430 t1445 t1500
    t1515 t1530 t1545 t1600 t1615 t1630 t1645 t1700 t1715
    t1739
    - minute
  )
  (:init
    ; start state
    (current_location presidio)
    (friend_at andrew unionsquare)
    (time t0900)

    ; meeting-progress initial token
    (p0)

    ; Andrew's availability window (11:15–17:15) on all used minutes
    (at_window andrew t1115)
    (at_window andrew t1130)
    (at_window andrew t1145)
    (at_window andrew t1200)
    (at_window andrew t1215)
    (at_window andrew t1230)
    (at_window andrew t1245)
    (at_window andrew t1300)
    (at_window andrew t1315)
    (at_window andrew t1330)
    (at_window andrew t1345)
    (at_window andrew t1400)
    (at_window andrew t1415)
    (at_window andrew t1430)
    (at_window andrew t1445)
    (at_window andrew t1500)
    (at_window andrew t1515)
    (at_window andrew t1530)
    (at_window andrew t1545)
    (at_window andrew t1600)
    (at_window andrew t1615)
    (at_window andrew t1630)
    (at_window andrew t1645)
    (at_window andrew t1700)
    (at_window andrew t1715)

    ; directed travel-time edges (asymmetry encoded)
    (add22 t0900 t0922)   ; Presidio -> UnionSquare: 22 minutes
    (add24 t1715 t1739)   ; UnionSquare -> Presidio: 24 minutes (post-meeting example)

    ; allowed waiting jump to align arrival with Andrew's window
    (waitedge t0922 t1115)

    ; 15-minute ticks covering 11:15–17:15 (24 steps)
    (next15 t1115 t1130)
    (next15 t1130 t1145)
    (next15 t1145 t1200)
    (next15 t1200 t1215)
    (next15 t1215 t1230)
    (next15 t1230 t1245)
    (next15 t1245 t1300)
    (next15 t1300 t1315)
    (next15 t1315 t1330)
    (next15 t1330 t1345)
    (next15 t1345 t1400)
    (next15 t1400 t1415)
    (next15 t1415 t1430)
    (next15 t1430 t1445)
    (next15 t1445 t1500)
    (next15 t1500 t1515)
    (next15 t1515 t1530)
    (next15 t1530 t1545)
    (next15 t1545 t1600)
    (next15 t1600 t1615)
    (next15 t1615 t1630)
    (next15 t1630 t1645)
    (next15 t1645 t1700)
    (next15 t1700 t1715)
  )
  (:goal
    (and
      (met andrew)  ; ensures at least 105 minutes of meeting within Andrew's window
    )
  )
)