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
    :parameters (?p - person ?from - location ?to - location)
    :precondition (at ?p ?from)
    :effect (and (not (at ?p ?from)) (at ?p ?to))
  )
  
  (:action meet_thomas
    :parameters (?loc - location ?time1 - time ?time2 - time)
    :precondition (and (at self ?loc) (at thomas ?loc) (can_meet thomas ?loc) 
                       (time_available ?loc ?time1 ?time2) 
                       (before ?time1 ?time2))
    :effect (met thomas)
  )
)