(define (problem TripPlanningExample11)
  (:domain travel-days)

  (:objects
    vienna valencia vilnius - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
  )

  (:init
    (current_day d1)
    (at vilnius)

    (direct vienna valencia)
    (direct valencia vienna)
    (direct vilnius vienna)
    (direct vienna vilnius)

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

    ;; Normalized hard daily requirements (total horizon 15 days).
    ;; Vilnius d1..d3 (reduced to fit 15-day horizon)
    (need d1 vilnius)
    (need d2 vilnius)
    (need d3 vilnius)

    ;; Vienna d4..d8 (5 contiguous days preserved)
    (need d4 vienna)
    (need d5 vienna)
    (need d6 vienna)
    (need d7 vienna)
    (need d8 vienna)

    ;; Valencia d9..d15 (7 contiguous days preserved; includes required conference days d9 and d15)
    (need d9 valencia)
    (need d10 valencia)
    (need d11 valencia)
    (need d12 valencia)
    (need d13 valencia)
    (need d14 valencia)
    (need d15 valencia)
  )

  (:goal
    (and
      (satisfied d1) (satisfied d2) (satisfied d3)
      (satisfied d4) (satisfied d5) (satisfied d6) (satisfied d7) (satisfied d8)
      (satisfied d9) (satisfied d10) (satisfied d11) (satisfied d12) (satisfied d13) (satisfied d14) (satisfied d15)
      (current_day d15)
    )
  )
)