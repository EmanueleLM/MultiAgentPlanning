(define (problem itinerary-berlin-porto-krakow-11d)
  (:domain multi-city-itinerary)

  (:objects
    berlin porto krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )

  (:init
    ;; day sequence
    (day-next d1 d2)
    (day-next d2 d3)
    (day-next d3 d4)
    (day-next d4 d5)
    (day-next d5 d6)
    (day-next d6 d7)
    (day-next d7 d8)
    (day-next d8 d9)
    (day-next d9 d10)
    (day-next d10 d11)

    ;; mark first day
    (day-first d1)

    ;; direct flights (namespaced predicate)
    (agent-direct-flight berlin porto)
    (agent-direct-flight porto berlin)
    (agent-direct-flight berlin krakow)
    (agent-direct-flight krakow berlin)
  )

  ;; Goal encodes chosen feasible itinerary for 11 days:
  ;; Days 1-3: Krakow (3 days)
  ;; Days 4-9: Berlin (6 days)
  ;; Days 10-11: Porto (2 days) -- must attend wedding on both days 10 and 11
  (:goal (and
    ;; Krakow days
    (at krakow d1)
    (at krakow d2)
    (at krakow d3)

    ;; Berlin days
    (at berlin d4)
    (at berlin d5)
    (at berlin d6)
    (at berlin d7)
    (at berlin d8)
    (at berlin d9)

    ;; Porto (wedding) days
    (at porto d10)
    (at porto d11)
  ))
)