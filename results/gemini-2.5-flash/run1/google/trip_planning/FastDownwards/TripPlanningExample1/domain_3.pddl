(define (domain trip_planning_example1)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        total_day_marker
        duration_slot
    )

    (:predicates
        (at ?c - city)
        (visited ?c - city)
        (current_total_days ?d - total_day_marker)
        (next_total_day_amount ?from_td ?slot ?to_td - total_day_marker)
        (duration_assigned_for_city ?c - city) ; Flag to ensure duration is assigned only once per city
        (has_direct_flight ?from ?to - city) ; Predicate for flight connections, was missing
    )

    (:action fly
        :parameters (?from ?to - city)
        :precondition (and
            (at ?from)
            (has_direct_flight ?from ?to)
        )
        :effect (and
            (not (at ?from))
            (at ?to)
        )
    )

    (:action spend_days_in_city
        :parameters (?c - city ?slot - duration_slot ?current_td ?next_td - total_day_marker)
        :precondition (and
            (at ?c)
            (not (duration_assigned_for_city ?c)) ; Ensure duration is picked only once for this city
            (current_total_days ?current_td)
            (next_total_day_amount ?current_td ?slot ?next_td) ; Validates the day increment
        )
        :effect (and
            (visited ?c) ; Mark city as visited
            (duration_assigned_for_city ?c) ; Mark that duration has been assigned for this city
            (not (current_total_days ?current_td)) ; Update current total days
            (current_total_days ?next_td)
        )
    )
)