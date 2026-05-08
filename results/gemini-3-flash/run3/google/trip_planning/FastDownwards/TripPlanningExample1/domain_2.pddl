(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types city day count)

    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (visited_count ?c - city ?n - count)
        (next_day ?d1 ?d2 - day)
        (next_count ?n1 ?n2 - count)
        (can_fly ?c1 ?c2 - city)
        (not_started)
    )

    ;; The start action picks the initial city on Day 1 and increments its stay count to 1.
    (:action start
        :parameters (?c - city ?d_curr ?d_next - day ?c_zero ?c_one - count)
        :precondition (and 
            (not_started)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (visited_count ?c ?c_zero)
            (next_count ?c_zero ?c_one)
        )
        :effect (and 
            (not (not_started))
            (at ?c)
            (not (current_day ?d_curr))
            (current_day ?d_next)
            (not (visited_count ?c ?c_zero))
            (visited_count ?c ?c_one)
        )
    )

    ;; The stay action spends one day in the current city, incrementing the calendar day and the city's count.
    (:action stay
        :parameters (?c - city ?d_curr ?d_next - day ?n_curr ?n_next - count)
        :precondition (and 
            (at ?c)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (visited_count ?c ?n_curr)
            (next_count ?n_curr ?n_next)
        )
        :effect (and 
            (not (current_day ?d_curr))
            (current_day ?d_next)
            (not (visited_count ?c ?n_curr))
            (visited_count ?c ?n_next)
        )
    )

    ;; The fly action moves from one city to another. This transition day counts for both the origin and destination stay counts.
    (:action fly
        :parameters (?from ?to - city ?d_curr ?d_next - day ?nf_curr ?nf_next - count ?nt_curr ?nt_next - count)
        :precondition (and 
            (at ?from)
            (can_fly ?from ?to)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (visited_count ?from ?nf_curr)
            (next_count ?nf_curr ?nf_next)
            (visited_count ?to ?nt_curr)
            (next_count ?nt_curr ?nt_next)
        )
        :effect (and 
            (not (at ?from))
            (at ?to)
            (not (current_day ?d_curr))
            (current_day ?d_next)
            (not (visited_count ?from ?nf_curr))
            (visited_count ?from ?nf_next)
            (not (visited_count ?to ?nt_curr))
            (visited_count ?to ?nt_next)
        )
    )
)