(define (problem trip-16days)
  (:domain multiagent-itinerary)
  (:objects
    planner-athens planner-zurich planner-krakow - agent
    athens zurich krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
    ;; day adjacency
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11)
    (next d11 d12) (next d12 d13) (next d13 d14) (next d14 d15) (next d15 d16)

    ;; available direct flights (only allowed moves)
    (direct zurich krakow) (direct krakow zurich)
    (direct athens zurich) (direct zurich athens)

    ;; initial locations at day 1 (each planner starts at their city)
    (at planner-athens athens d1)
    (at planner-zurich zurich d1)
    (at planner-krakow krakow d1)
  )

  ;; Goals encode the hard constraints derived from the city planners:
  ;; - Athens planner must be in Athens for days 1 through 7 (inclusive)
  ;; - Zurich planner must be in Zurich for 5 days somewhere within the 16-day horizon
  ;; - Krakow planner must be in Krakow for 6 days somewhere within the 16-day horizon
  ;; The problem encodes these as required at(...) facts. To respect "earliest time"
  ;; (and to keep constraints strict), we require the Zurich and Krakow stays on the earliest days:
  ;; Zurich: days d1..d5, Krakow: days d1..d6. All are within the 16-day horizon and use only permitted flights.
  (:goal
    (and
      ;; Athens visit covering days 1..7
      (at planner-athens athens d1)
      (at planner-athens athens d2)
      (at planner-athens athens d3)
      (at planner-athens athens d4)
      (at planner-athens athens d5)
      (at planner-athens athens d6)
      (at planner-athens athens d7)

      ;; Zurich visit lasting 5 days (earliest feasible days chosen)
      (at planner-zurich zurich d1)
      (at planner-zurich zurich d2)
      (at planner-zurich zurich d3)
      (at planner-zurich zurich d4)
      (at planner-zurich zurich d5)

      ;; Krakow visit lasting 6 days (earliest feasible days chosen)
      (at planner-krakow krakow d1)
      (at planner-krakow krakow d2)
      (at planner-krakow krakow d3)
      (at planner-krakow krakow d4)
      (at planner-krakow krakow d5)
      (at planner-krakow krakow d6)
    )
  )
)