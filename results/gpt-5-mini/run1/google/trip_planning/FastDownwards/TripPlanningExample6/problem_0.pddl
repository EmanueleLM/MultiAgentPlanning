(define (problem orchestrator-problem)
  (:domain orchestrator)

  (:objects
    traveler1 - traveler
    home berlin - city
    day0 day1 day2 day3 day4 day5 day6 day7 day8 - day
  )

  (:init
    ;; Day ordering ensuring an 8-day contiguous itinerary (day0 is pre-trip day)
    (next day0 day1)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)

    ;; Direct (single-leg) connections available in the flight graph
    (direct home berlin)
    (direct berlin home)

    ;; Auditor adjustments encoded as removal of flights departing on day3.
    ;; Only direct flights are encoded and only as available departures on specific days.
    ;; Available direct (single-leg) flights (departure day -> link). Flights on day3
    ;; have been removed per the auditor's adjustments (no flight-available facts for day3).
    ;; Flights are available on days 0,1,2,4,5,6,7 (departure days).
    (flight-available home berlin day0)
    (flight-available berlin home day0)

    (flight-available home berlin day1)
    (flight-available berlin home day1)

    (flight-available home berlin day2)
    (flight-available berlin home day2)

    ;; day3 flights removed by auditor adjustment (no flight-available facts for day3)

    (flight-available home berlin day4)
    (flight-available berlin home day4)

    (flight-available home berlin day5)
    (flight-available berlin home day5)

    (flight-available home berlin day6)
    (flight-available berlin home day6)

    (flight-available home berlin day7)
    (flight-available berlin home day7)

    ;; Starting location before the trip (day0). The planner must create
    ;; locations for days 1..8 by applying stay-next-day or fly-next-day actions.
    (at traveler1 home day0)
  )

  ;; Goals:
  ;; - The traveler must attend the conference in Berlin on day1 and on day4.
  ;; - The problem is required to "schedule the 8-day trip", so the plan must
  ;;   establish a concrete location for each trip day (day1..day8). To satisfy
  ;;   that requirement deterministically we require the traveler to be in
  ;;   Berlin for each day1..day8. This choice uses only direct flights and
  ;;   respects the auditor adjustment (no flights departing on day3).
  (:goal (and
    ;; conference attendance constraints (explicit)
    (at traveler1 berlin day1)
    (at traveler1 berlin day4)

    ;; explicit location for each trip day (ensures a complete schedule for days 1..8)
    (at traveler1 berlin day1)
    (at traveler1 berlin day2)
    (at traveler1 berlin day3)
    (at traveler1 berlin day4)
    (at traveler1 berlin day5)
    (at traveler1 berlin day6)
    (at traveler1 berlin day7)
    (at traveler1 berlin day8)
  ))
)