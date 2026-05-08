(define (domain friend_meeting)
  (:requirements :strips :typing)
  (:types location timepoint friend)
  (:predicates
    (at_bayview ?t - timepoint)
    (at_chinatown ?t - timepoint)
    (next ?t1 - timepoint ?t2 - timepoint)
    (available ?fri - friend ?loc - location ?start - timepoint ?end - timepoint)
    (visited ?fri - friend)
  )
  
  (:action travel_to_chinatown
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at_bayview ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (at_bayview ?t1))
      (at_chinatown ?t2)
    )
  )
  
  (:action travel_to_bayview
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at_chinatown ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (at_chinatown ?t1))
      (at_bayview ?t2)
    )
  )
  
  (:action meet_jason
    :parameters (?start - timepoint ?end - timepoint)
    :precondition (and
      (at_chinatown ?start)
      (available jason chinatown ?start ?end)
      (next ?start ?end)
      (not (visited jason))
    )
    :effect (visited jason)
  )
)