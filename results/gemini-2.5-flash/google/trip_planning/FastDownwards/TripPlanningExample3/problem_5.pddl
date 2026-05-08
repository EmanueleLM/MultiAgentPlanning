(define (problem TripPlanningExample3)
    (:domain trip_planning)
    (:objects
        berlin warsaw bucharest - city
        d1 d2 d3 d4 d5 d6 d_end - day
    )
    (:init
        ;; Initial state: Agent starts in Berlin on Day 1
        (at berlin)
        (current_day d1)

        ;; Define the sequence of days
        (next_day d1 d2)
        (next_day d2 d3)
        (next_day d3 d4)
        (next_day d4 d5)
        (next_day d5 d6)
        (next_day d6 d_end) ; Transition from d6 to a final state

        ;; Define direct flight connections
        (has_flight berlin warsaw)
        (has_flight warsaw berlin)
        (has_flight warsaw bucharest)
        (has_flight bucharest warsaw)
        ;; No direct flight between Berlin and Bucharest
    )
    (:goal (and
        (current_day d_end) ; Ensure all 6 days of the trip have passed
        (visited berlin)
        (visited warsaw)
        (visited bucharest)

        ;; Specific day allocations (derived from problem constraints and conflict resolution)
        ;; Based on the conflict resolution (2 days for each city) and friend meeting in Bucharest on Day 5 or Day 6.
        ;; This goal implies a specific itinerary determined by the travel_planner and auditor.
        (stayed_on_day berlin d1)
        (stayed_on_day berlin d2)
        (stayed_on_day warsaw d3)
        (stayed_on_day warsaw d4)
        (stayed_on_day bucharest d5)
        (stayed_on_day bucharest d6)

        ;; Friend meeting constraint: must occur in Bucharest on Day 5 or Day 6
        (met_friend)
    ))
)