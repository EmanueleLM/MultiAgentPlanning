(define (domain european_trip)
    (:requirements :strips :typing :negative-preconditions)
    (:types city day)
    (:predicates
        (at ?city - city ?day - day)
        (flight_exists ?from - city ?to - city)
        (workshop_in_riga ?day - day)
        (day_sequence ?day1 - day ?day2 - day)
        (workshop_attended ?day - day)
    )
    
    (:action fly
        :parameters (?from - city ?to - city ?day1 - day ?day2 - day)
        :precondition (and
            (flight_exists ?from ?to)
            (at ?from ?day1)
            (day_sequence ?day1 ?day2)
            (not (at ?to ?day1))
        )
        :effect (and
            (not (at ?from ?day2))
            (at ?to ?day2)
        )
    )

    (:action stay
        :parameters (?city - city ?day1 - day ?day2 - day)
        :precondition (and
            (at ?city ?day1)
            (day_sequence ?day1 ?day2)
        )
        :effect (and
            (at ?city ?day2)
        )
    )

    (:action attend_workshop
        :parameters (?day - day)
        :precondition (and
            (at riga ?day)
            (workshop_in_riga ?day)
            (not (workshop_attended ?day))
        )
        :effect (workshop_attended ?day)
    )
)