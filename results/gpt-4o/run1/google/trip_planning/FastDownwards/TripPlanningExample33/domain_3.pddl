(define (domain city_visit)

    (:requirements :strips :typing :negative-preconditions)
    
    (:types
        city day
    )
    
    (:predicates
        (at ?city - city ?day - day)
        (flight_available ?from - city ?to - city)
        (met_friend_krakow ?day - day)
        (next_day ?day_from - day ?day_to - day)
        (between_days_10_and_13 ?day - day)
    )
    
    (:action fly
        :parameters (?from - city ?to - city ?day_from - day ?day_to - day)
        :precondition (and
            (at ?from ?day_from)
            (flight_available ?from ?to)
            (next_day ?day_from ?day_to)
        )
        :effect (and
            (not (at ?from ?day_from))
            (at ?to ?day_to)
        )
    )
    
    (:action stay
        :parameters (?city - city ?day_today - day ?day_next - day)
        :precondition (and
            (at ?city ?day_today)
            (next_day ?day_today ?day_next)
        )
        :effect (and
            (not (at ?city ?day_today))
            (at ?city ?day_next)
        )
    )
    
    (:action meet_friend_krakow
        :parameters (?day - day)
        :precondition (and
            (at krakow ?day)
            (between_days_10_and_13 ?day)
        )
        :effect (met_friend_krakow ?day)
    )

)