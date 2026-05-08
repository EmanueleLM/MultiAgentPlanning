(define (domain european_trip)
    (:requirements :strips :typing)
    (:types city day)
    (:predicates
        (current_city ?c - city)
        (available_flight ?c1 ?c2 - city)
        (visited_for ?c - city ?d - day)
        (next_day ?d1 ?d2 - day)
        (trip_day ?d - day)
        (goal_reached)
    )
    (:action fly
        :parameters (?from ?to - city)
        :precondition (and 
            (current_city ?from) 
            (available_flight ?from ?to)
        )
        :effect (and 
            (not (current_city ?from)) 
            (current_city ?to)
        )
    )
    (:action visit
        :parameters (?c - city ?d - day)
        :precondition (and 
            (current_city ?c)
            (trip_day ?d)
            (not (visited_for ?c ?d))
        )
        :effect (visited_for ?c ?d)
    )
    (:action next_trip_day
        :parameters (?d1 ?d2 - day)
        :precondition (next_day ?d1 ?d2)
        :effect (and 
            (not (trip_day ?d1))
            (trip_day ?d2)
        )
    )
    (:action complete_trip
        :precondition (and
            (current_city dubrovnik)
            (visited_for istanbul day5)
            (visited_for budapest day11)
            (visited_for dubrovnik day12)
        )
        :effect (goal_reached)
    )
)