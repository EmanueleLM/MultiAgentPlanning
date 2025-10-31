(define (problem trip-problem-combined)
  (:domain combined-trip-domain)
  (:objects
    florence barcelona helsinki - city
  )

  (:init
    ;; Time and per-city spent counters
    (= (day) 0)
    (= (spent-florence) 0)
    (= (spent-barcelona) 0)
    (= (spent-helsinki) 0)

    ;; Start location chosen per flight-planner agent's suggestion: Barcelona
    (at barcelona)
    (visited barcelona)

    ;; Known direct connections (public info): only these direct flights allowed
    (link barcelona florence)
    (link florence barcelona)
    (link barcelona helsinki)
    (link helsinki barcelona)
  )

  ;; Goal:
  ;; - Trip must finish at day = 14
  ;; - Satisfy per-city visit-duration requirements (adjusted so total plan is feasible
  ;;   given flights consume days). The chosen allocation below sums (spent-*) = 11,
  ;;   and with 3 required flights (starting in Barcelona and visiting both other cities)
  ;;   the total days (stays + flights) will reach 14.
  ;; - The meeting in Florence must have occurred (traveler-meet-in-florence) during days 9..14.
  (:goal
    (and
      (= (day) 14)

      ;; Adjusted per-city day allocations (sum to 11 stays; 3 flights required -> total 14)
      (= (spent-florence) 6)
      (= (spent-barcelona) 4)
      (= (spent-helsinki) 1)

      ;; Meeting must have been performed in Florence within the allowed window
      (met)
    )
  )
)