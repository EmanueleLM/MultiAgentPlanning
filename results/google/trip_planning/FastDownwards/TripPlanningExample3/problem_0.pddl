(define (problem traveler-itinerary-6days)
  (:domain travel-multiagent)

  (:objects
    traveler - agent

    berlin warsaw bucharest - city

    day1 day2 day3 day4 day5 day6 - day
  )

  (:init
    ;; initial location assumption: traveler starts in Berlin on day1
    (at traveler berlin day1)

    ;; day successor relations
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)

    ;; available direct flight legs (bidirectional as provided)
    (leg berlin warsaw)
    (leg warsaw berlin)
    (leg warsaw bucharest)
    (leg bucharest warsaw)
  )

  ;; Goals (hard constraints):
  ;; - Occupancy per city per day as resolved/assumed: Berlin days 1-2, Warsaw days 3-4, Bucharest days 5-6
  ;; - Meeting requirement encoded as presence in Bucharest on day5 (earliest feasible slot)
  (:goal
    (and
      (at traveler berlin day1)
      (at traveler berlin day2)

      (at traveler warsaw day3)
      (at traveler warsaw day4)

      (at traveler bucharest day5)   ;; required meeting (day 5)
      (at traveler bucharest day6)
    )
  )
)