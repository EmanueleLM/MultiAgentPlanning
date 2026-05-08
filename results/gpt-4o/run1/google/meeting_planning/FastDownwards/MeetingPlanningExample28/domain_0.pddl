(define (domain meet_joshua)
  (:requirements :strips :typing :negative-preconditions)
  (:types location friend timepoint)
  (:predicates
    (at_self ?loc - location ?time - timepoint)
    (at_joshua ?loc - location)
    (visited ?loc - location ?time - timepoint)
    (can_meet ?loc - location ?start - timepoint ?end - timepoint)
    (consecutive_time ?from - timepoint ?to - timepoint)
  )
  
  (:action move
    :parameters (?from - location ?to - location ?start_time - timepoint ?end_time - timepoint)
    :precondition (and 
      (at_self ?from ?start_time)
      (visited ?from ?start_time)
      (consecutive_time ?start_time ?end_time))
    :effect (and
      (not (at_self ?from ?start_time))
      (at_self ?to ?end_time)
      (visited ?to ?end_time))
  )

  (:action meet_joshua
    :parameters (?location - location ?start_time - timepoint ?end_time - timepoint)
    :precondition (and 
      (at_self ?location ?start_time)
      (at_joshua ?location)
      (consecutive_time ?start_time ?end_time)
      (not (at_joshua chinatown)) ; ensures Joshua is only at Chinatown during the meeting window
      )
    :effect (can_meet ?location ?start_time ?end_time)
  )
)