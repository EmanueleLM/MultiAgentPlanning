(define (domain san_francisco_visit)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time)
  (:predicates 
    (at ?p - person ?loc - location)
    (met ?p - person)
    (can_meet ?p - person ?loc - location)
    (time_available ?loc - location ?start_time - time ?end_time - time)
    (before ?t1 - time ?t2 - time)
  )
  
  (:action travel
    :parameters (?p - person ?from - location ?to - location ?start_time - time ?end_time - time)
    :precondition (and (at ?p ?from) (time_available ?to ?start_time ?end_time) (before ?start_time ?end_time))
    :effect (and (not (at ?p ?from)) (at ?p ?to))
  )
  
  (:action meet_thomas
    :parameters (?loc - location ?start_time - time ?end_time - time)
    :precondition (and (at self ?loc) (at thomas ?loc) (can_meet thomas ?loc) (before ?start_time ?end_time))
    :effect (met thomas)
  )
)