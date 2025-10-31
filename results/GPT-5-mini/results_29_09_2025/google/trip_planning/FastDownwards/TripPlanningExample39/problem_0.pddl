(define (problem multi-city-trip-problem)
  (:domain multi-city-trip)

  (:objects
    porto barcelona florence - city
  )

  (:init
    ;; Start assumptions (chosen to satisfy the relatives-window earliest): start in Porto on day 1.
    (= (day) 1)
    (= (days-porto) 0)
    (= (days-barcelona) 0)
    (= (days-florence) 0)

    (at porto)
    ;; Note: flights are encoded as actions only for the allowed direct legs:
    ;; Porto <-> Barcelona and Barcelona <-> Florence. No direct Porto <-> Florence action exists.
    ;; The planner must use the available fly-* actions to commute.
  )

  ;; Goals:
  ;; - Spend exactly the requested number of days in each city (hard constraints).
  ;; - Visit relatives in Porto during overall trip days 1..3 (encoded by the visit-relatives-in-porto precondition).
  ;; - Complete the 12-day trip (we model day increment so after 12 day-consuming actions day==13).
  (:goal
    (and
      ; required stay durations (hard constraints, as specified)
      (= (days-porto) 3)
      (= (days-barcelona) 7)
      (= (days-florence) 4)

      ; relatives must be visited within day 1..3
      (relatives-visited)

      ; total trip length 12 days: starting day=1, after 12 increments day must equal 13
      (= (day) 13)
    )
  )

  (:metric minimize 0) ; no optimization metric; feasibility problem
)