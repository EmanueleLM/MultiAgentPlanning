(define (domain european_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates 
    (at ?city - city)
    (day_visited ?city - city ?day - day)
    (meeting_possible ?day - day)
    (next_day ?day - day)
  )

  (:action fly_valencia_to_amsterdam
    :parameters (?current_day - day)
    :precondition (and (at valencia) (next_day ?current_day))
    :effect (and (not (at valencia))
                 (at amsterdam)
                 (day_visited amsterdam ?current_day))
  )

  (:action fly_amsterdam_to_valencia
    :parameters (?current_day - day)
    :precondition (and (at amsterdam) (next_day ?current_day))
    :effect (and (not (at amsterdam))
                 (at valencia)
                 (day_visited valencia ?current_day))
  )

  (:action fly_amsterdam_to_tallinn
    :parameters (?current_day - day)
    :precondition (and (at amsterdam) (next_day ?current_day))
    :effect (and (not (at amsterdam))
                 (at tallinn)
                 (day_visited tallinn ?current_day))
  )

  (:action fly_tallinn_to_amsterdam
    :parameters (?current_day - day)
    :precondition (and (at tallinn) (next_day ?current_day))
    :effect (and (not (at tallinn))
                 (at amsterdam)
                 (day_visited amsterdam ?current_day))
  )
)