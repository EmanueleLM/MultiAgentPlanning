(define (problem multiagent-trip-problem)
  (:domain multiagent-trip)

  (:objects
    traveler - person
    berlin frankfurt bucharest - city
  )

  (:init
    ;; city declarations (kept for clarity)
    (city berlin)
    (city frankfurt)
    (city bucharest)

    ;; direct flight connectivity (bidirectional where applicable)
    (direct-flight berlin frankfurt)
    (direct-flight frankfurt berlin)
    (direct-flight frankfurt bucharest)
    (direct-flight bucharest frankfurt)
    ;; no direct berlin-bucharest connection (explicitly omitted)

    ;; initial location and visitation state
    (at traveler berlin)
    (visited berlin)

    ;; numeric initializations
    (= (day) 1)                  ; trip starts on day 1
    (= (days-used) 0)
    (= (days-spent-berlin) 0)
    (= (days-spent-frankfurt) 0)
    (= (days-spent-bucharest) 0)
    (= (show-days-attended) 0)
  )

  ;; Combined goals from both agents (kept distinct; inconsistencies are preserved per instructions).
  (:goal
    (and
      ;; Flight-network goals: visit all cities and complete within day 11
      (visited berlin)
      (visited frankfurt)
      (visited bucharest)
      (<= (day) 11)

      ;; Traveler preferences and trip-length goals (note these sum to 13 days of stays vs trip length 11)
      (= (days-spent-berlin) 7)
      (= (days-spent-frankfurt) 4)
      (= (days-spent-bucharest) 2)
      (= (days-used) 11)
      (= (show-days-attended) 7)
    )
  )
)