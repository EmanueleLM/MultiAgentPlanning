(define (problem trip_planning_example7)
    (:domain trip_planning)
    (:objects
        traveler - person
        venice dubrovnik istanbul - city
    )
    (:init
        ;; Initial location of the traveler.
        (at traveler dubrovnik)

        ;; Initialize numeric fluents to 0
        (= (total_trip_days) 0)
        (= (venice_stay_days) 0)
        (= (dubrovnik_stay_days) 0)
        (= (istanbul_stay_days) 0)

        ;; Define known direct flight paths
        ;; From Dubrovnik to Istanbul, and from Dubrovnik to Venice.
        ;; No return flights or flights between Venice/Istanbul are given.
        (flight_path dubrovnik istanbul)
        (flight_path dubrovnik venice)

        ;; The starting city is considered visited initially.
        (has_visited dubrovnik)
    )
    (:goal (and
        ;; Goal: All specified cities must be visited at least once.
        ;; Note: Given the flight paths (only out of Dubrovnik), it is
        ;; impossible to visit both Venice AND Istanbul after leaving Dubrovnik.
        ;; This goal will be unreachable given the current flight network.
        (has_visited venice)
        (has_visited istanbul)
        ;; The total trip duration must not exceed 11 days. This is implicitly
        ;; handled by the preconditions (< (total_trip_days) 11) on all actions.
        ;; Specific stay day targets are not set as hard goals due to the total
        ;; budget conflict (13 days desired vs 11 days total budget) and lack
        ;; of explicit prioritization rules. The actions are capped by their
        ;; desired maximums, allowing the solver to maximize stays within the budget.
    ))
)