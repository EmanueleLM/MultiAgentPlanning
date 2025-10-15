(define (problem meet-anthony-problem)
  (:domain meet-friends)
  (:objects
    traveler anthony - object
    NobHill AlamoSquare - object
  )

  (:init
    ;; Traveler starts at NobHill at 09:00 = 540 minutes
    (at traveler NobHill)
    ;; Anthony is present at AlamoSquare (during his availability window)
    (at anthony AlamoSquare)

    ;; Numeric initializations
    (= (time) 540)         ; traveler arrives at NobHill at 09:00
    (= (met-count) 0)
    (= (anthony-start) 435) ; Anthony availability start = 07:15
    (= (anthony-end) 780)   ; Anthony availability end = 13:00

    ;; Note: (met anthony) is false by default (not listed in init)
  )

  ;; Trivial goal (always satisfiable). Planner will still optimize the metric above.
  (:goal (and))

  ;; Comments / conservative defaults:
  ;; - No explicit end-of-day for the traveler was provided; we do NOT invent a hard latest availability.
  ;; - Time is modeled in whole minutes after midnight. Anthony's availability and the travel/meeting durations
  ;;   are encoded in minutes as given (11 and 15).
  ;; - The planner is free to choose actions; because the traveler starts at NobHill at 540, the earliest feasible
  ;;   plan to meet Anthony is to travel immediately (increase time to 551) then meet (finish at 551+15=566).
  ;; - If additional friends or constraints are added later, extend objects, availability functions, and meeting actions.
)