; Problem assumptions and notes:
; - Planning horizon: days d1 .. d14 inclusive.
; - Cities: amsterdam, santorini, istanbul.
; - Direct flights allowed only between Amsterdam <-> Santorini and Amsterdam <-> Istanbul.
; - Flights consume one day transition: a flight scheduled between day X and day X+1 results in being at the destination on day X+1.
; - The traveller is assumed to start in Amsterdam on day d1 (minimal explicit assumption to make the instance solvable).
; - Hard constraint: traveller must be in Santorini on days d12, d13, and d14 (to visit relatives).
; - No other preferences were provided; no additional availability is invented.
; - Actions are distinct: 'stay' models remaining in-place overnight; 'fly' models a direct-flight overnight commute.

(define (problem travel-horizon-14)
  (:domain travel)

  (:objects
    ; cities
    amsterdam santorini istanbul
    ; days
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14
  )

  (:init
    ; days
    (day d1) (day d2) (day d3) (day d4) (day d5) (day d6) (day d7)
    (day d8) (day d9) (day d10) (day d11) (day d12) (day d13) (day d14)

    ; successor (discrete day transitions)
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11)
    (next d11 d12) (next d12 d13) (next d13 d14)

    ; Direct flight connectivity (only these are allowed)
    (direct amsterdam santorini)
    (direct santorini amsterdam)
    (direct amsterdam istanbul)
    (direct istanbul amsterdam)

    ; Initial location assumption (explicit to make planning concrete)
    (at amsterdam d1)
  )

  (:goal
    (and
      ; hard requirement: be in Santorini on days 12-14 inclusive
      (at santorini d12)
      (at santorini d13)
      (at santorini d14)
    )
  )
)