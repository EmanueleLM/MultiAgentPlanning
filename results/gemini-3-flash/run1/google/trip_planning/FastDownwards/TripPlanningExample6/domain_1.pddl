(define (domain trip_planning)
        (:requirements :strips :typing)
        (:types city day count)
        (:predicates
            (at ?c - city ?d - day)
            (current_city ?c - city)
            (current_day ?d - day)
            (next_day ?d1 ?d2 - day)
            (can_fly ?c1 ?c2 - city)
            (berlin_count ?n - count)
            (munich_count ?n - count)
            (dubrovnik_count ?n - count)
            (next_count ?n1 ?n2 - count)
        )

        ;; Actions for staying in the same city for another day
        (:action stay_at_berlin
            :parameters (?d1 ?d2 - day ?n1 ?n2 - count)
            :precondition (and (current_city berlin) (current_day ?d1) (next_day ?d1 ?d2) (berlin_count ?n1) (next_count ?n1 ?n2))
            :effect (and (not (current_day ?d1)) (current_day ?d2) (at berlin ?d2) (not (berlin_count ?n1)) (berlin_count ?n2))
        )

        (:action stay_at_munich
            :parameters (?d1 ?d2 - day ?n1 ?n2 - count)
            :precondition (and (current_city munich) (current_day ?d1) (next_day ?d1 ?d2) (munich_count ?n1) (next_count ?n1 ?n2))
            :effect (and (not (current_day ?d1)) (current_day ?d2) (at munich ?d2) (not (munich_count ?n1)) (munich_count ?n2))
        )

        (:action stay_at_dubrovnik
            :parameters (?d1 ?d2 - day ?n1 ?n2 - count)
            :precondition (and (current_city dubrovnik) (current_day ?d1) (next_day ?d1 ?d2) (dubrovnik_count ?n1) (next_count ?n1 ?n2))
            :effect (and (not (current_day ?d1)) (current_day ?d2) (at dubrovnik ?d2) (not (dubrovnik_count ?n1)) (dubrovnik_count ?n2))
        )

        ;; Actions for flying to a different city
        (:action fly_to_berlin
            :parameters (?from - city ?d1 ?d2 - day ?n1 ?n2 - count)
            :precondition (and (current_city ?from) (current_day ?d1) (next_day ?d1 ?d2) (can_fly ?from berlin) (berlin_count ?n1) (next_count ?n1 ?n2))
            :effect (and (not (current_city ?from)) (current_city berlin) (not (current_day ?d1)) (current_day ?d2) (at berlin ?d2) (not (berlin_count ?n1)) (berlin_count ?n2))
        )

        (:action fly_to_munich
            :parameters (?from - city ?d1 ?d2 - day ?n1 ?n2 - count)
            :precondition (and (current_city ?from) (current_day ?d1) (next_day ?d1 ?d2) (can_fly ?from munich) (munich_count ?n1) (next_count ?n1 ?n2))
            :effect (and (not (current_city ?from)) (current_city munich) (not (current_day ?d1)) (current_day ?d2) (at munich ?d2) (not (munich_count ?n1)) (munich_count ?n2))
        )

        (:action fly_to_dubrovnik
            :parameters (?from - city ?d1 ?d2 - day ?n1 ?n2 - count)
            :precondition (and (current_city ?from) (current_day ?d1) (next_day ?d1 ?d2) (can_fly ?from dubrovnik) (dubrovnik_count ?n1) (next_count ?n1 ?n2))
            :effect (and (not (current_city ?from)) (current_city dubrovnik) (not (current_day ?d1)) (current_day ?d2) (at dubrovnik ?d2) (not (dubrovnik_count ?n1)) (dubrovnik_count ?n2))
        )
    )