; Problem instance: start in Brussels on d1, 9-day chain, Brussels hub flights only
; Hard goals:
;  - All days d2..d9 assigned (d1 is pre-filled)
;  - Visit Brussels, Valencia, and Nice at least once
;  - Meet friends in Nice within the window (d1..d6)
(define (problem travel9days-instance)
  (:domain travel9days)
  (:objects
    brussels valencia nice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
  )
  (:init
    ; Day successor chain
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)

    ; Start state and initial assignments
    (at brussels d1)
    (filled d1)
    (visited brussels)

    ; Nice meetup window (inclusive)
    (in_window d1)
    (in_window d2)
    (in_window d3)
    (in_window d4)
    (in_window d5)
    (in_window d6)

    ; Directed flight connectivity (Brussels hub only)
    (direct brussels valencia)
    (direct valencia brussels)
    (direct brussels nice)
    (direct nice brussels)
  )
  (:goal
    (and
      (filled d2)
      (filled d3)
      (filled d4)
      (filled d5)
      (filled d6)
      (filled d7)
      (filled d8)
      (filled d9)
      (visited brussels)
      (visited valencia)
      (visited nice)
      (met_friends)
    )
  )
)