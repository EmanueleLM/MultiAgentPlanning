(define (domain san_francisco_visit)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time)
  (:predicates 
    (at ?person - person ?location - location ?time - time)
    (met ?person - person)
    (before ?time1 - time ?time2 - time)
    (meeting_possible ?person - person ?location - location ?start_time - time ?end_time - time ?duration - time)
  )
  
  (:action move
    :parameters (?from - location ?to - location ?start_time - time ?end_time - time)
    :precondition (and (at self ?from ?start_time) (before ?start_time ?end_time))
    :effect (and (not (at self ?from ?start_time)) (at self ?to ?end_time))
  )
  
  (:action meet
    :parameters (?location - location ?start_time - time ?end_time - time)
    :precondition (and (at self ?location ?start_time)
                       (at thomas ?location meeting_start_thomas)
                       (meeting_possible thomas ?location ?start_time ?end_time duration_105))
    :effect (met thomas)
  )
)