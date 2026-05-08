(define (domain trip_planning_example_46)
        (:requirements :strips :typing :negative-preconditions)
        (:types city day count)
        (:predicates
            (at ?c - city ?d - day)
            (recorded ?c - city ?d - day)
            (stay_count ?c - city ?n - count)
            (next_count ?n1 - count ?n2 - count)
            (next_day ?d1 - day ?d2 - day)
            (flight_route ?c1 - city ?c2 - city)
            (flown ?d - day)
        )

        (:action record_stay
            :parameters (?c - city ?d - day ?n_now - count ?n_next - count)
            :precondition (and 
                (at ?c ?d) 
                (stay_count ?c ?n_now) 
                (next_count ?n_now ?n_next) 
                (not (recorded ?c ?d))
            )
            :effect (and 
                (not (stay_count ?c ?n_now)) 
                (stay_count ?c ?n_next) 
                (recorded ?c ?d)
            )
        )

        (:action fly
            :parameters (?c_from - city ?c_to - city ?d - day)
            :precondition (and 
                (at ?c_from ?d) 
                (flight_route ?c_from ?c_to) 
                (not (flown ?d))
            )
            :effect (and 
                (not (at ?c_from ?d)) 
                (at ?c_to ?d) 
                (flown ?d)
            )
        )

        (:action advance_day
            :parameters (?c - city ?d_now - day ?d_next - day)
            :precondition (and 
                (at ?c ?d_now) 
                (next_day ?d_now ?d_next)
            )
            :effect (and 
                (not (at ?c ?d_now)) 
                (at ?c ?d_next)
            )
        )
    )