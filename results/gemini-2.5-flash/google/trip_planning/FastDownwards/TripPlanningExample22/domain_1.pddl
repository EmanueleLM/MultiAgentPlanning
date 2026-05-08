(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day_index
        traveler
        berlin_day_count
        frankfurt_day_count
        bucharest_day_count
    )

    (:predicates
        (at ?t - traveler ?c - city)
        (current_day ?d - day_index)
        (next_day ?d1 - day_index ?d2 - day_index)
        (direct_flight ?c1 - city ?c2 - city)

        ; Day count for Berlin
        (spent_in_berlin ?b_c - berlin_day_count)
        (next_berlin_count ?b1 - berlin_day_count ?b2 - berlin_day_count)

        ; Day count for Frankfurt
        (spent_in_frankfurt ?f_c - frankfurt_day_count)
        (next_frankfurt_count ?f1 - frankfurt_day_count ?f2 - frankfurt_day_count)

        ; Day count for Bucharest
        (spent_in_bucharest ?h_c - bucharest_day_count)
        (next_bucharest_count ?h1 - bucharest_day_count ?h2 - bucharest_day_count)

        ; Predicates for Berlin show (Day 1-7)
        (berlin_show_date ?d - day_index)
        (attended_berlin_show_on_day ?d - day_index)
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
        :parameters (?t - traveler ?d_current - day_index ?d_next - day_index
                     ?b_prev - berlin_day_count ?b_next - berlin_day_count)
        :precondition (and
            (at ?t c_berlin)
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
        )
    )

    (:action visit_berlin_regular_day
        :parameters (?t - traveler ?d_current - day_index ?d_next - day_index
                     ?b_prev - berlin_day_count ?b_next - berlin_day_count)
        :precondition (and
            (at ?t c_berlin)
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
        )
    )

    (:action visit_frankfurt
        :parameters (?t - traveler ?d_current - day_index ?d_next - day_index
                     ?f_prev - frankfurt_day_count ?f_next - frankfurt_day_count)
        :precondition (and
            (at ?t c_frankfurt)
            (current_day ?d_current)
            (next_day ?d_current ?d_next)
            (spent_in_frankfurt ?f_prev)
            (next_frankfurt_count ?f_prev ?f_next)
        )
        :effect (and
            (not (current_day ?d_current))
            (current_day ?d_next)
            (not (spent_in_frankfurt ?f_prev))
            (spent_in_frankfurt ?f_next)
        )
    )

    (:action visit_bucharest
        :parameters (?t - traveler ?d_current - day_index ?d_next - day_index
                     ?h_prev - bucharest_day_count ?h_next - bucharest_day_count)
        :precondition (and
            (at ?t c_bucharest)
            (current_day ?d_current)
            (next_day ?d_current ?d_next)
            (spent_in_bucharest ?h_prev)
            (next_bucharest_count ?h_prev ?h_next)
        )
        :effect (and
            (not (current_day ?d_current))
            (current_day ?d_next)
            (not (spent_in_bucharest ?h_prev))
            (spent_in_bucharest ?h_next)
        )
    )
)