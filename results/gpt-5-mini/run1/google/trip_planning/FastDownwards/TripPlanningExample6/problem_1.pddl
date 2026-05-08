(define (problem trip_planning_example6)
  (:domain trip_planning)

  (:objects
    traveler1 - traveler
    dubrovnik berlin munich - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )

  (:init
    ;; day ordering for an 8-day trip
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)

    ;; direct flight graph (only edges provided by flight_data)
    (direct munich dubrovnik)
    (direct dubrovnik munich)
    (direct berlin munich)
    (direct munich berlin)

    ;; flight availability (only direct flights; include the specific departures
    ;; required by the feasible itinerary that respects the hard conference days).
    ;; To move from Berlin to Dubrovnik one must go via Munich:
    ;; - depart berlin on day4 to arrive munich on day5
    ;; - depart munich on day5 to arrive dubrovnik on day6
    (flight-available berlin munich day4)
    (flight-available munich dubrovnik day5)

    ;; Starting location: must be in Berlin on day1 to attend the conference
    (at traveler1 berlin day1)
  )

  (:goal (and
    ;; conference attendance in Berlin on day1 and day4 (hard constraints)
    (at traveler1 berlin day1)
    (at traveler1 berlin day4)

    ;; desired (auditor-adjusted) visit durations summed to the total 8 days:
    ;; Berlin: days 1-4 (4 days)
    (at traveler1 berlin day2)
    (at traveler1 berlin day3)

    ;; Munich: day5 (1 day)
    (at traveler1 munich day5)

    ;; Dubrovnik: days 6-8 (3 days)
    (at traveler1 dubrovnik day6)
    (at traveler1 dubrovnik day7)
    (at traveler1 dubrovnik day8)
  ))
)