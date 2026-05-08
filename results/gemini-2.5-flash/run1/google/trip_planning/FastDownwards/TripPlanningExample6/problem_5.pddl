(define (problem trip-planning-problem)
    (:domain trip-planning)
    (:objects
        traveler - agent
        dubrovnik berlin munich - city
        day1 day2 day3 day4 day5 day6 day7 day8 - day
        dc0 dc1 dc2 dc3 dc4 - day_count
    )
    (:init
        ;; Day progression
        (next-day day1 day2)
        (next-day day2 day3)
        (next-day day3 day4)
        (next-day day4 day5)
        (next-day day5 day6)
        (next-day day6 day7)
        (next-day day7 day8)

        ;; Day count progression (up to max 4 for Berlin)
        (next-day-count dc0 dc1)
        (next-day-count dc1 dc2)
        (next-day-count dc2 dc3)
        (next-day-count dc3 dc4)

        ;; Flight connections
        (connected munich dubrovnik)
        (connected dubrovnik munich)
        (connected berlin munich)
        (connected munich berlin)

        ;; Conference requirements
        (conference-required berlin day1)
        (conference-required berlin day4)

        ;; Initial state
        (current-day day1)
        (traveler-at traveler berlin) ; Traveler starts in Berlin

        ;; Initial day counts
        (num-dubrovnik-days dc0)
        (num-berlin-days dc0)
        (num-munich-days dc0)
    )
    (:goal (and
        (current-day day8) ; Ensure the trip completes all days
        ;; Final day count requirements from Auditor's resolution
        (num-dubrovnik-days dc3) ; 3 days in Dubrovnik
        (num-berlin-days dc4)    ; 4 days in Berlin
        (num-munich-days dc1)    ; 1 day in Munich
    ))
)