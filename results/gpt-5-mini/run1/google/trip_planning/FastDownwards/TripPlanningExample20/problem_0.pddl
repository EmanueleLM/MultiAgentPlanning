(define (problem visit-three-cities)
  (:domain travel-itinerary)

  (:objects
    alpha beta gamma - city
    d1 d2 d3 d4 d5 d6 - day
  )

  (:init
    ;; explicit day ordering (contiguous days up to the allowed total)
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)

    ;; direct flight connectivity (only the listed direct flights are allowed)
    ;; These flights enforce that any change of city from one day to the next must follow a direct flight.
    (flight alpha beta)
    (flight beta gamma)

    ;; start: traveler is in 'alpha' on the first day
    (in alpha d1)
    (assigned d1)
  )

  ;; Goals:
  ;; - Respect the auditor-adjusted stay durations for each of the three cities:
  ;;   alpha: 2 days (d1,d2)
  ;;   beta:  3 days (d3,d4,d5)
  ;;   gamma: 1 day  (d6)
  ;; - Ensure daily accounting up to the allowed total days (every day d1..d6 is assigned)
  (:goal (and
    ;; alpha stay days
    (in alpha d1)
    (in alpha d2)

    ;; beta stay days
    (in beta d3)
    (in beta d4)
    (in beta d5)

    ;; gamma stay day
    (in gamma d6)

    ;; every day must be assigned (no unaccounted days within the allowed total)
    (assigned d1)
    (assigned d2)
    (assigned d3)
    (assigned d4)
    (assigned d5)
    (assigned d6)
  ))
)