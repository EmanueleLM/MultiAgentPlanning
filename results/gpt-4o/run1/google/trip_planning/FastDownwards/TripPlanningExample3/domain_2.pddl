(define (domain european_trip_plan)
    (:requirements :strips :typing)
    (:types city day)
    (:predicates 
        (at ?c - city ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (visited ?c - city ?d - day)
        (met_friend ?d - day)
    )
    
    (:action fly_berlin_warsaw
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (at berlin ?d1) (next_day ?d1 ?d2))
        :effect (and 
            (not (at berlin ?d1)) 
            (at warsaw ?d2)
        )
    )
    
    (:action fly_warsaw_berlin
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (at warsaw ?d1) (next_day ?d1 ?d2))
        :effect (and 
            (not (at warsaw ?d1)) 
            (at berlin ?d2)
        )
    )
    
    (:action fly_warsaw_bucharest
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (at warsaw ?d1) (next_day ?d1 ?d2))
        :effect (and 
            (not (at warsaw ?d1)) 
            (at bucharest ?d2)
        )
    )

    (:action fly_bucharest_warsaw
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (at bucharest ?d1) (next_day ?d1 ?d2))
        :effect (and 
            (not (at bucharest ?d1)) 
            (at warsaw ?d2)
        )
    )

    (:action stay_in_city
        :parameters (?c - city ?d1 - day ?d2 - day)
        :precondition (and (at ?c ?d1) (next_day ?d1 ?d2))
        :effect (visited ?c ?d2)
    )

    (:action meet_friend_bucharest
        :parameters (?d - day)
        :precondition (at bucharest ?d)
        :effect (met_friend ?d)
    )
)