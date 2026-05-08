(define (domain san_francisco_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time_point)
  (:predicates
    (at ?person - person ?location - location)
    (can_travel ?from - location ?to - location)
    (time_point_order ?t1 - time_point ?t2 - time_point)
    (met ?person1 - person ?person2 - person)
    (scheduled_meeting ?person1 - person ?person2 - person)
  )
  
  (:action travel
    :parameters (?from - location ?to - location)
    :precondition (and (at you ?from) (can_travel ?from ?to))
    :effect (and (not (at you ?from)) (at you ?to))
  )

  (:action meet_margaret
    :parameters (?location - location ?t1 - time_point ?t2 - time_point)
    :precondition (and (at you ?location) (at margaret ?location)
                      (time_point_order ?t1 ?t2) (scheduled_meeting you margaret))
    :effect (met you margaret)
  )
)