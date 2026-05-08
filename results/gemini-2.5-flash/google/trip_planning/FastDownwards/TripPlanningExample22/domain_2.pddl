(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day_index
        traveler
        berlin_day_count
    )

    (:predicates
        (at ?t - traveler ?c - city)
        (current_day ?d - day_index)
        (next_day ?d1 - day_index ?d2 - day_index)
        (direct_flight ?c1 - city ?c2 - city)

        ; Day count for Berlin (required 7 days)
        (spent_in_berlin ?b_c - berlin_day_count)
        (next_berlin_count ?b1 - berlin_day_count ?b2 - berlin_day_count)

        ; Predicates for Berlin show (Day 1-7)
        (berlin_show_date ?d - day_index)
        (attended_berlin_show_on_day ?d - day_index)

        ; Predicate for ensuring cities are visited at least once
        (visited ?c - city)

        ; Predicates to identify specific cities for actions (addressing parser strictness)
        (is_berlin ?c - city)
        (is_frankfurt ?c - city)
        (is_bucharest ?c - city)
    )

    (:action fly
        :parameters (?t - traveler ?from - city ?to - city ?d_current - day_index ?d_next - day_index)
        :precondition (and
            (at ?t ?from)
            (current_day ?d_current)
            (next_day ?d_current ?d_next)
            (direct_flight ?from ?to)
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
            (not (current_day ?d_current))
            (current_day ?d_next)
        )
    )

    (:action visit_berlin_show_day
        :parameters (?t - traveler ?c - city
                     ?d_current - day_index ?d_next - day_index
                     ?b_prev - berlin_day_count ?b_next - berlin_day_count)
        :precondition (and
            (at ?t ?c)
            (is_berlin ?c) ; Ensure this action applies only to Berlin
            (current_day ?d_current)
            (berlin_show_date ?d_current)
            (next_day ?d_current ?d_next)
            (spent_in_berlin ?b_prev)
            (next_berlin_count ?b_prev ?b_next)
            (not (attended_berlin_show_on_day ?d_current)) ; Ensure show is attended only once per day
        )
        :effect (and
            (not (current_day ?d_current))
            (current_day ?d_next)
            (not (spent_in_berlin ?b_prev))
            (spent_in_berlin ?b_next)
            (attended_berlin_show_on_day ?d_current)
            (visited ?c) ; Mark Berlin as visited
        )
    )

    (:action visit_berlin_regular_day
        :parameters (?t - traveler ?c - city
                     ?d_current - day_index ?d_next - day_index
                     ?b_prev - berlin_day_count ?b_next - berlin_day_count)
        :precondition (and
            (at ?t ?c)
            (is_berlin ?c) ; Ensure this action applies only to Berlin
            (current_day ?d_current)
            (not (berlin_show_date ?d_current)) ; Not a show day
            (next_day ?d_current ?d_next)
            (spent_in_berlin ?b_prev)
            (next_berlin_count ?b_prev ?b_next)
        )
        :effect (and
            (not (current_day ?d_current))
            (current_day ?d_next)
            (not (spent_in_berlin ?b_prev))
            (spent_in_berlin ?b_next)
            (visited ?c) ; Mark Berlin as visited
        )
    )

    (:action visit_frankfurt
        :parameters (?t - traveler ?c - city
                     ?d_current - day_index ?d_next - day_index)
        :precondition (and
            (at ?t ?c)
            (is_frankfurt ?c) ; Ensure this action applies only to Frankfurt
            (current_day ?d_current)
            (next_day ?d_current ?d_next)
        )
        :effect (and
            (not (current_day ?d_current))
            (current_day ?d_next)
            (visited ?c) ; Mark Frankfurt as visited
        )
    )

    (:action visit_bucharest
        :parameters (?t - traveler ?c - city
                     ?d_current - day_index ?d_next - day_index)
        :precondition (and
            (at ?t ?c)
            (is_bucharest ?c) ; Ensure this action applies only to Bucharest
            (current_day ?d_current)
            (next_day ?d_current ?d_next)
        )
        :effect (and
            (not (current_day ?d_current))
            (current_day ?d_next)
            (visited ?c) ; Mark Bucharest as visited
        )
    )
)