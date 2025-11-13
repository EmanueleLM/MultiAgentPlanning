(define (problem trip-instance-ams-vlc-tll)
  (:domain trip-planning)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
    AMS VLC TLL - city
  )
  (:init
    ; Day adjacency (consecutive days)
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)
    (next d10 d11)
    (next d11 d12)
    (next d12 d13)
    (next d13 d14)
    (next d14 d15)

    ; Flight graph: only direct, bidirectional edges as provided
    (direct AMS TLL)
    (direct TLL AMS)
    (direct VLC AMS)
    (direct AMS VLC)

    ; Window days for Tallinn requirement (any day in d9..d15)
    (in-window d9)
    (in-window d10)
    (in-window d11)
    (in-window d12)
    (in-window d13)
    (in-window d14)
    (in-window d15)

    ; Mark which city is Tallinn
    (is-tll TLL)

    ; Numeric fluents initialization
    (= (total-cost) 0)

    (= (days-in AMS) 0)
    (= (days-in VLC) 0)
    (= (days-in TLL) 0)

    ; Remaining quota (shortage-left) initialized to preferred stays
    (= (shortage-left AMS) 5)
    (= (shortage-left VLC) 5)
    (= (shortage-left TLL) 7)
  )
  (:goal
    (and
      ; All 15 days must be assigned (exactly one city per day is enforced by action preconditions)
      (assigned d1)
      (assigned d2)
      (assigned d3)
      (assigned d4)
      (assigned d5)
      (assigned d6)
      (assigned d7)
      (assigned d8)
      (assigned d9)
      (assigned d10)
      (assigned d11)
      (assigned d12)
      (assigned d13)
      (assigned d14)
      (assigned d15)

      ; At least one of d9..d15 is in Tallinn
      (tll-window-satisfied)

      ; Ensure end-of-schedule processing is done (enables paying shortfalls)
      (schedule-complete)

      ; Soft targets compiled via costs: force paying remaining shortfalls
      (= (shortage-left AMS) 0)
      (= (shortage-left VLC) 0)
      (= (shortage-left TLL) 0)
    )
  )
  (:metric minimize (total-cost))
)