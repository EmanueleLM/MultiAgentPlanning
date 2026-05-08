(define (domain meet_friends_sf)
  (:requirements :strips :typing :negative-preconditions)
  
  (:types 
    location person time)

  (:predicates 
    (at ?person - person ?location - location)
    (visited ?person - person)
    (can_meet ?person - person ?location - location ?time - time)
    (have_time ?time - time)
  )

  (:action move_pacific_to_wharf
    :parameters ( )
    :precondition (and 
      (at you pacific_heights)
      (have_time t9_13)
    )
    :effect (and
      (not (at you pacific_heights))
      (at you fishermans_wharf)
      (have_time t9_45)
    )
  )

  (:action move_wharf_to_pacific
    :parameters ( )
    :precondition (and 
      (at you fishermans_wharf)
      (have_time t5_00)
    )
    :effect (and
      (not (at you fishermans_wharf))
      (at you pacific_heights)
      (have_time t5_12)
    )
  )

  (:action meet_betty
    :parameters ( )
    :precondition (and 
      (at you fishermans_wharf)
      (at betty fishermans_wharf)
      (can_meet betty fishermans_wharf t11_00)
      (can_meet betty fishermans_wharf t12_45)
    )
    :effect (and
      (visited betty)
    )
  )
)