(define (problem trip-8days)
  (:domain multiagent-travel)
  (:objects
    traveler manager
    home paris berlin rome - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )

  (:init
    ;; Agent roles and starting location
    (is-traveler traveler)
    (is-manager manager)
    (at traveler home day1)

    ;; Day ordering (discrete time steps)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)

    ;; Flight connectivity (direct flights only) - bidirectional declared explicitly.
    (direct home paris)
    (direct paris home)
    (direct paris berlin)
    (direct berlin paris)
    (direct berlin rome)
    (direct rome berlin)
    (direct home rome)
    (direct rome home)

    ;; Conference schedule (mandatory attendance constraints)
    (conference berlin day5)
    (conference berlin day6)
  )

  ;; Goals reflect the traveler's temporal constraints treated as hard requirements:
  ;; - Attend the Berlin conference on day5 and day6
  ;; - Spend two consecutive days in Paris as early as possible (days 2 & 3)
  ;; - Spend two days in Rome (days 7 & 8)
  (:goal (and
    ;; Conference attendance (attendance achieved by performing attend-conference while at Berlin)
    (attended berlin day5)
    (attended berlin day6)

    ;; Visiting-duration constraints encoded as presence on specific days (earliest feasible allocation)
    (at traveler paris day2)
    (at traveler paris day3)

    (at traveler rome day7)
    (at traveler rome day8)
  ))
)