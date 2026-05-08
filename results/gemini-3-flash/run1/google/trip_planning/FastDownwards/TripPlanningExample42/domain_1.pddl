(define (domain trip_planning)
    (:requirements :strips :typing)
    (:types
        city day count
    )

    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (stay_count ?c - city ?n - count)
        (next_day ?d1 - day ?d2 - day)
        (next_count ?n1 - count ?n2 - count)
        (can_fly ?c1 - city ?c2 - city)
        (visited_at ?c - city ?d - day)
        (is_last_day ?d - day)
        (trip_done)
    )

    ;; The stay action increments the time and the stay count for the current city.
    ;; It marks the current day as a day spent in that city.
    (:action stay
        :parameters (?c - city ?d - day ?dn - day ?n - count ?nn - count)
        :precondition (and 
            (at ?c) 
            (current_day ?d) 
            (next_day ?d ?dn)
            (stay_count ?c ?n) 
            (next_count ?n ?nn)
        )
        :effect (and 
            (not (current_day ?d)) 
            (current_day ?dn)
            (not (stay_count ?c ?n)) 
            (stay_count ?c ?nn)
            (visited_at ?c ?d)
        )
    )

    ;; The fly action moves the traveler between connected cities.
    ;; It increments the stay count for both the departure city and the arrival city
    ;; for the day of the flight, effectively allowing overlapping stays.
    (:action fly
        :parameters (?from - city ?to - city ?d - day ?dn - day ?nf - count ?nfn - count ?nt - count ?ntn - count)
        :precondition (and 
            (at ?from) 
            (can_fly ?from ?to)
            (current_day ?d) 
            (next_day ?d ?dn)
            (stay_count ?from ?nf) 
            (next_count ?nf ?nfn)
            (stay_count ?to ?nt) 
            (next_count ?nt ?ntn)
        )
        :effect (and 
            (not (at ?from)) 
            (at ?to)
            (not (current_day ?d)) 
            (current_day ?dn)
            (not (stay_count ?from ?nf)) 
            (stay_count ?from ?nfn)
            (not (stay_count ?to ?nt)) 
            (stay_count ?to ?ntn)
            (visited_at ?from ?d)
            (visited_at ?to ?d)
        )
    )

    ;; The complete_trip action handles the final day (d11) where no further 
    ;; day-to-day transition is possible.
    (:action complete_trip
        :parameters (?c - city ?d - day ?n - count ?nn - count)
        :precondition (and 
            (at ?c) 
            (current_day ?d) 
            (is_last_day ?d)
            (stay_count ?c ?n) 
            (next_count ?n ?nn)
        )
        :effect (and 
            (not (stay_count ?c ?n)) 
            (stay_count ?c ?nn)
            (visited_at ?c ?d)
            (trip_done)
        )
    )
)