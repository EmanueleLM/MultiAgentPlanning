(define (domain european_trip)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates 
    (at ?city - city)
    (visited_on ?city - city ?day - day)
    (next ?day - day ?next - day)
    (can_meet_friend ?day - day)
  )

  (:action fly_valencia_to_amsterdam
    :parameters (?current_day - day ?next_day - day)
    :precondition (and (at valencia) (next ?current_day ?next_day))
    :effect (and (not (at valencia))
                 (at amsterdam)
                 (visited_on amsterdam ?next_day))
  )

  (:action fly_amsterdam_to_valencia
    :parameters (?current_day - day ?next_day - day)
    :precondition (and (at amsterdam) (next ?current_day ?next_day))
    :effect (and (not (at amsterdam))
                 (at valencia)
                 (visited_on valencia ?next_day))
  )

  (:action fly_amsterdam_to_tallinn
    :parameters (?current_day - day ?next_day - day)
    :precondition (and (at amsterdam) (next ?current_day ?next_day))
    :effect (and (not (at amsterdam))
                 (at tallinn)
                 (visited_on tallinn ?next_day))
  )

  (:action fly_tallinn_to_amsterdam
    :parameters (?current_day - day ?next_day - day)
    :precondition (and (at tallinn) (next ?current_day ?next_day))
    :effect (and (not (at tallinn))
                 (at amsterdam)
                 (visited_on amsterdam ?next_day))
  )
)