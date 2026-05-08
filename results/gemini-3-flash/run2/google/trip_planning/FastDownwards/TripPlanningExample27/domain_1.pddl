(define (domain trip_planning)
    (:requirements :strips :typing)
    (:types city day count)
    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (visited ?c - city ?d - day)
        (city_count ?c - city ?n - count)
        (next_day ?d1 - day ?d2 - day)
        (next_count ?n1 - count ?n2 - count)
        (flight ?c1 - city ?c2 - city)
        (final_day ?d - day)
        (done)
    )

    ;; The stay action counts the current day as a visit to the current city and moves to the next day.
    (:action stay
        :parameters (?c - city ?d_now - day ?d_next - day ?n - count ?n_plus - count)
        :precondition (and 
            (at ?c) 
            (current_day ?d_now) 
            (next_day ?d_now ?d_next)
            (city_count ?c ?n) 
            (next_count ?n ?n_plus)
        )
        :effect (and 
            (not (current_day ?d_now)) 
            (current_day ?d_next)
            (visited ?c ?d_now) 
            (not (city_count ?c ?n)) 
            (city_count ?c ?n_plus)
        )
    )

    ;; The fly action counts the current day as a visit for BOTH the origin and destination cities,
    ;; representing a transition day, and moves the traveler to the next day at the destination.
    (:action fly
        :parameters (?c1 - city ?c2 - city ?d_now - day ?d_next - day ?n1 - count ?n1_plus - count ?n2 - count ?n2_plus - count)
        :precondition (and 
            (at ?c1) 
            (current_day ?d_now) 
            (next_day ?d_now ?d_next) 
            (flight ?c1 ?c2)
            (city_count ?c1 ?n1) 
            (next_count ?n1 ?n1_plus)
            (city_count ?c2 ?n2) 
            (next_count ?n2 ?n2_plus)
        )
        :effect (and 
            (not (at ?c1)) 
            (at ?c2)
            (not (current_day ?d_now)) 
            (current_day ?d_next)
            (visited ?c1 ?d_now) 
            (visited ?c2 ?d_now)
            (not (city_count ?c1 ?n1)) 
            (city_count ?c1 ?n1_plus)
            (not (city_count ?c2 ?n2)) 
            (city_count ?c2 ?n2_plus)
        )
    )

    ;; The final action to account for the visit on the very last day of the trip.
    (:action finish
        :parameters (?c - city ?d_final - day ?n - count ?n_plus - count)
        :precondition (and 
            (at ?c) 
            (current_day ?d_final) 
            (final_day ?d_final)
            (city_count ?c ?n) 
            (next_count ?n ?n_plus)
        )
        :effect (and 
            (visited ?c ?d_final) 
            (not (city_count ?c ?n)) 
            (city_count ?c ?n_plus) 
            (done)
        )
    )
)