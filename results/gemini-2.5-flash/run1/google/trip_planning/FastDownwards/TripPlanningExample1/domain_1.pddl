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
        ; (next_total_day_amount ?current_d ?slot_duration ?next_d - total_day_marker)
        ; This predicate connects a current total_day_marker, the duration slot chosen, and the resulting total_day_marker.
        ; E.g., (next_total_day_amount td0 ds6 td6) means: if 0 days spent and spend 6 days, total becomes 6.
        (next_total_day_amount ?from_td ?slot ?to_td - total_day_marker)
        (has_direct_flight ?from ?to - city)
        (duration_assigned_for_city ?c - city) ; Flag to ensure duration is assigned only once per city
    )

    (:actions
        (fly
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

        (spend_days_in_city
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
)