(define (domain trip_planning_example_40)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
        oslo_day_count
        reykjavik_day_count
        manchester_day_count
    )
    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (flight_available ?c1 - city ?c2 - city)
        (day_spent ?d - day) ; Marks that a day has been accounted for (either spent in a city or wedding attended)
        (has_attended_wedding)
        (wedding_day ?d - day)

        (current_oslo_days ?odc - oslo_day_count)
        (next_oslo_day_count ?odc1 - oslo_day_count ?odc2 - oslo_day_count)

        (current_reykjavik_days ?rdc - reykjavik_day_count)
        (next_reykjavik_day_count ?rdc1 - reykjavik_day_count ?rdc2 - reykjavik_day_count)

        (current_manchester_days ?mdc - manchester_day_count)
        (next_manchester_day_count ?mdc1 - manchester_day_count ?mdc2 - manchester_day_count)
    )

    (:action move_to_city
        :parameters (?from - city ?to - city ?d - day)
        :precondition (and
            (at ?from)
            (flight_available ?from ?to)
            (current_day ?d)
        )
        :effect (and
            (not (at ?from))
            (at ?to)
        )
    )

    (:action spend_day_in_oslo
        :parameters (?d_current - day ?d_next - day ?odc_prev - oslo_day_count ?odc_next - oslo_day_count)
        :precondition (and
            (at oslo)
            (current_day ?d_current)
            (next_day ?d_current ?d_next)
            (next_oslo_day_count ?odc_prev ?odc_next)
            (current_oslo_days ?odc_prev)
            (not (day_spent ?d_current))
            (not (wedding_day ?d_current)) ; Cannot just spend day if it's wedding day
        )
        :effect (and
            (not (current_day ?d_current))
            (current_day ?d_next)
            (day_spent ?d_current)
            (not (current_oslo_days ?odc_prev))
            (current_oslo_days ?odc_next)
        )
    )

    (:action spend_day_in_reykjavik
        :parameters (?d_current - day ?d_next - day ?rdc_prev - reykjavik_day_count ?rdc_next - reykjavik_day_count)
        :precondition (and
            (at reykjavik)
            (current_day ?d_current)
            (next_day ?d_current ?d_next)
            (next_reykjavik_day_count ?rdc_prev ?rdc_next)
            (current_reykjavik_days ?rdc_prev)
            (not (day_spent ?d_current))
            (not (wedding_day ?d_current))
        )
        :effect (and
            (not (current_day ?d_current))
            (current_day ?d_next)
            (day_spent ?d_current)
            (not (current_reykjavik_days ?rdc_prev))
            (current_reykjavik_days ?rdc_next)
        )
    )

    (:action spend_day_in_manchester
        :parameters (?d_current - day ?d_next - day ?mdc_prev - manchester_day_count ?mdc_next - manchester_day_count)
        :precondition (and
            (at manchester)
            (current_day ?d_current)
            (next_day ?d_current ?d_next)
            (next_manchester_day_count ?mdc_prev ?mdc_next)
            (current_manchester_days ?mdc_prev)
            (not (day_spent ?d_current))
            (not (wedding_day ?d_current))
        )
        :effect (and
            (not (current_day ?d_current))
            (current_day ?d_next)
            (day_spent ?d_current)
            (not (current_manchester_days ?mdc_prev))
            (current_manchester_days ?mdc_next)
        )
    )

    (:action attend_wedding_in_manchester_and_spend_day
        :parameters (?d_current - day ?d_next - day ?mdc_prev - manchester_day_count ?mdc_next - manchester_day_count)
        :precondition (and
            (at manchester)
            (current_day ?d_current)
            (wedding_day ?d_current)
            (not (has_attended_wedding))
            (next_day ?d_current ?d_next)
            (next_manchester_day_count ?mdc_prev ?mdc_next)
            (current_manchester_days ?mdc_prev)
            (not (day_spent ?d_current))
        )
        :effect (and
            (has_attended_wedding)
            (not (current_day ?d_current))
            (current_day ?d_next)
            (day_spent ?d_current)
            (not (current_manchester_days ?mdc_prev))
            (current_manchester_days ?mdc_next)
        )
    )
)