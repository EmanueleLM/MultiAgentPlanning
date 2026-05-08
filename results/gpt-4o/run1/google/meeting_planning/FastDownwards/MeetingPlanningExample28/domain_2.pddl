(define (domain meet_joshua)
  (:requirements :strips :typing)
  (:types location timepoint)
  (:predicates
    (at_self ?loc - location ?time - timepoint)
    (at_joshua ?loc - location ?time - timepoint)
    (visited ?loc - location)
    (connected ?from - location ?to - location)
    (time_after ?t1 - timepoint ?t2 - timepoint)
    (can_meet_joshua ?start - timepoint)
  )
  
  (:action move
    :parameters (?from - location ?to - location ?start_time - timepoint ?end_time - timepoint)
    :precondition (and 
      (at_self ?from ?start_time)
      (visited ?from)
      (connected ?from ?to)
      (time_after ?end_time ?start_time))
    :effect (and
      (not (at_self ?from ?start_time))
      (at_self ?to ?end_time)
      (visited ?to))
  )

  (:action meet_joshua
    :parameters (?location - location ?meeting_time - timepoint)
    :precondition (and 
      (at_self ?location ?meeting_time)
      (at_joshua ?location ?meeting_time))
    :effect (can_meet_joshua ?meeting_time)
  )
)