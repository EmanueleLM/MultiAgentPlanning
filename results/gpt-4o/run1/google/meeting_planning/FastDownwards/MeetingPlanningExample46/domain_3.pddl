(define (domain visit_sf)
  (:requirements :strips :typing)
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
    :effect (and (not (at north_beach)) (at haight_ashbury) (at_time nine_thirty_seven)))
  (:action wait_at_north_beach
    :parameters (?start - timepoint ?end - timepoint)
    :precondition (and (at north_beach) (at_time ?start) (not (at_time ?end)))
    :effect (and (at_time ?end) (not (at_time ?start))))
  (:action meet_robert
    :parameters ()
    :precondition (and (at north_beach) (at_time four_thirty_pm))
    :effect (and (with robert) (meet_target_achieved) (at_time six_pm)))
)