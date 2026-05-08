(define (problem trip_planning_example7)
    (:domain trip_planning)
    (:objects
        traveler - person
        venice dubrovnik istanbul - city
    )
    (:init
        ;; Initial location of the traveler. Assuming starting in Dubrovnik
        ;; as it's the only city explicitly mentioned with outgoing flights.
        (at traveler dubrovnik)

        ;; Initialize numeric fluents for tracking time
        (= (total_days_spent) 0)
        (= (days_in_venice) 0)
        (= (days_in_dubrovnik) 0)
        (= (days_in_istanbul) 0)

        ;; Define known direct flight paths
        ;; "from Dubrovnik to Istanbul, Istanbul and Venice" is interpreted as:
        ;; From Dubrovnik to Istanbul AND From Dubrovnik to Venice, based on the structured input.
        (flight_path dubrovnik istanbul)
        (flight_path dubrovnik venice)

        ;; The starting city is considered visited initially.
        (has_visited dubrovnik)
    )
    (:goal (and
        ;; Goal: All specified cities must be visited at least once.
        (has_visited venice)
        (has_visited istanbul)

        ;; The starting city is already visited in init, so no need to repeat in goal.
        ;; (has_visited dubrovnik)

        ;; Goal: The total trip duration must not exceed 11 days.
        (<= (total_days_spent) 11)
    ))
)