(define (domain visit_sf)
  (:requirements :strips :typing :negative-preconditions)
  (:types 
    location 
    person)
  (:predicates 
    (at ?loc - location)
    (with ?person - person)
    (meet_target_achieved))
  (:action move_to_north_beach
    :parameters ()
    :precondition (at haight_ashbury)
    :effect (and (not (at haight_ashbury)) (at north_beach)))
  (:action move_to_haight_ashbury
    :parameters ()
    :precondition (at north_beach)
    :effect (and (not (at north_beach)) (at haight_ashbury)))
  (:action meet_robert
    :parameters ()
    :precondition (at north_beach)
    :effect (and (with robert) (meet_target_achieved)))
)