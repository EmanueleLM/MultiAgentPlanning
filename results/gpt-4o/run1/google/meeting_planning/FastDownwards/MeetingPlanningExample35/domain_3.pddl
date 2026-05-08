(define (domain friend_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types location timepoint friend)
  (:predicates
    (at ?loc - location ?t - timepoint)
    (next ?t1 - timepoint ?t2 - timepoint)
    (available ?fri - friend ?loc - location ?start - timepoint ?end - timepoint)
    (visited ?fri - friend)
  )
  
  (:action travel_to_chinatown
    :parameters (?from - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at bayview ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (at bayview ?t1))
      (at chinatown ?t2)
    )
  )
  
  (:action travel_to_bayview
    :parameters (?from - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at chinatown ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (at chinatown ?t1))
      (at bayview ?t2)
    )
  )
  
  (:action meet_jason
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at chinatown ?t1)
      (available jason chinatown ?t1 ?t2)
      (next ?t1 ?t2)
      (not (visited jason))
    )
    :effect (visited jason)
  )
)