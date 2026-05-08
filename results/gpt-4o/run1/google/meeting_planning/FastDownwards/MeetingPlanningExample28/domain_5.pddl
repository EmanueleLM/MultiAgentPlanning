(define (domain meet_joshua)
  (:requirements :strips :typing :negative-preconditions)
  (:types location timepoint)
  (:predicates
    (at_self ?loc - location)
    (at_joshua ?loc - location)
    (visited ?loc - location)
    (connected ?from - location ?to - location)
    (time_before ?t1 - timepoint ?t2 - timepoint)
    (current_time ?time - timepoint)
  )
  
  (:action move
    :parameters (?from - location ?to - location ?current - timepoint ?end - timepoint)
    :precondition (and 
      (at_self ?from)
      (connected ?from ?to)
      (current_time ?current)
      (time_before ?current ?end))
    :effect (and
      (not (at_self ?from))
      (at_self ?to)
      (visited ?to)
      (not (current_time ?current))
      (current_time ?end))
  )

  (:action meet_joshua
    :parameters (?location - location ?start - timepoint ?meeting_end - timepoint ?end - timepoint)
    :precondition (and 
      (at_self ?location)
      (at_joshua ?location)
      (current_time ?start)
      (time_before ?start ?meeting_end)
      (time_before ?meeting_end ?end))
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (visited ?location))
  )
)