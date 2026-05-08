(define (domain travel_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types city day)
    
    (:predicates 
      (current_city ?c - city ?day - day)
      (goal_visit ?c - city ?day - day)
      (direct_flight ?from - city ?to - city)
      (successor ?d1 - day ?d2 - day)
    )

    (:action fly
      :parameters (?from - city ?to - city ?day_from - day ?day_to - day)
      :precondition (and 
                      (current_city ?from ?day_from)
                      (direct_flight ?from ?to)
                      (successor ?day_from ?day_to)
                    )
      :effect (and 
                (not (current_city ?from ?day_from)) 
                (current_city ?to ?day_to)
              )
    ) 

    (:action visit_city
      :parameters (?c - city ?day - day)
      :precondition (current_city ?c ?day)
      :effect (goal_visit ?c ?day)
    )
)