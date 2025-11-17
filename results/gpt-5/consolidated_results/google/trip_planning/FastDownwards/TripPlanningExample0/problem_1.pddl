(define (problem tripplanningexample0-problem)
  (:domain tripplanningexample0-domain)
  (:objects
    barcelona florence helsinki - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
  )
  (:init
    ; day progression
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6) (next d6 d7)
    (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11) (next d11 d12) (next d12 d13) (next d13 d14)

    ; direct flights (only those provided)
    (direct barcelona florence)
    (direct florence barcelona)
    (direct helsinki barcelona)
    (direct barcelona helsinki)

    ; meeting window days (inclusive 9..14)
    (window d9) (window d10) (window d11) (window d12) (window d13) (window d14)

    ; start state consistent with the proposed itinerary
    (at helsinki d1)
    (reached d1)
    ; 'met' is initially false by closed-world assumption
  )
  (:goal
    (and
      (reached d14)                 ; all 14 days accounted for
      (met)                         ; friend met in Florence on a window day
      (visited helsinki)            ; each target city visited at least once
      (visited barcelona)
      (visited florence)
    )
  )
)