(define (domain visit_sf)
  (:requirements :strips :typing :negative-preconditions)
  (:types 
    location 
    person 
    timepoint)
  (:predicates 
    (at ?loc - location)
    (with ?person - person)
    (meet_target_achieved)
    (at_time ?time - timepoint))
  (:action move_to_north_beach
    :parameters ()
    :precondition (and (at haight_ashbury) (at_time nine_am))
    :effect (and (not (at haight_ashbury)) (at north_beach) (at_time nine_nineteen)))
  (:action move_to_haight_ashbury
    :parameters ()
    :precondition (and (at north_beach) (at_time nine_nineteen))
    :effect (and (not (at north_beach)) (at haight_ashbury)))
  (:action meet_robert_at_north_beach_start
    :parameters ()
    :precondition (and (at north_beach) (at_time four_thirty_pm))
    :effect (and (with robert) (at_time six_pm)))
  (:action meet_robert_at_north_beach_finish
    :parameters ()
    :precondition (and (with robert) (at_time six_pm))
    :effect (meet_target_achieved))
)