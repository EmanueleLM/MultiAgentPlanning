(define (problem andrew-105min-from-presidio)
  (:domain day-planning)
  (:objects
    presidio unionsquare - location
    andrew - friend

    ; discrete minute points used by the chosen schedule
    t0900 t0922
    t1115 t1130 t1145 t1200 t1215 t1230 t1245 t1300
    t1324
    t1715
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
    (at_window andrew t1715)

    ; directed travel-time edges (asymmetry encoded)
    (add22 t0900 t0922)   ; Presidio -> UnionSquare takes 22 minutes
    (add24 t1300 t1324)   ; UnionSquare -> Presidio takes 24 minutes (example edge)

    ; allowed waiting jump to align arrival with Andrew's window
    (waitedge t0922 t1115)

    ; 15-minute meeting ticks to reach 105 minutes total
    (next15 t1115 t1130)
    (next15 t1130 t1145)
    (next15 t1145 t1200)
    (next15 t1200 t1215)
    (next15 t1215 t1230)
    (next15 t1230 t1245)
    (next15 t1245 t1300)
  )
  (:goal
    (and
      (met andrew)  ; ensures at least 105 minutes meeting within Andrew's window
    )
  )
)