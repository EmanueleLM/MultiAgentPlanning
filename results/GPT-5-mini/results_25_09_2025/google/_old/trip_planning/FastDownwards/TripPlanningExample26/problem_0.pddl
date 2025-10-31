(define (problem traveler-flights-problem)
  (:domain traveler-flights-domain)

  (:objects
    porto berlin reykjavik - city
    d16 - duration
  )

  ;; Initial state: integrated knowledge from both agents plus a chosen starting city.
  ;; - start at day 0
  ;; - planned stays adjusted to sum 16 days total: Porto 6, Berlin 5, Reykjavik 5
  ;; - mark Reykjavik
  ;; - known direct-flight facts (from flights agent public info)
  ;; - starting location chosen as porto to make travel feasible given known direct flights
  (:init
    (= (day) 0)

    ;; Adjusted stays that sum to 16 (6 + 5 + 5 = 16)
    (= (days-left porto) 6)
    (= (days-left berlin) 5)
    (= (days-left reykjavik) 5)

    (is-reykjavik reykjavik)

    ;; Public / known connectivity information (from the flights agent)
    (direct-flight berlin reykjavik)
    (direct-flight porto berlin)

    ;; Starting location chosen to permit a feasible itinerary using only known direct flights
    (at porto)

    ;; Trip-duration fact preserved (informational; not used numerically here)
    (trip-duration d16)
  )

  ;; Goal: achieve a 16-day trip, spend all planned days, and meet the friend in Reykjavik.
  (:goal
    (and
      (= (day) 16)
      (= (days-left porto) 0)
      (= (days-left berlin) 0)
      (= (days-left reykjavik) 0)
      (met-friend)
    )
  )
)