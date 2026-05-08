(define (domain meeting_schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time person)
  (:predicates
    (at ?loc - location)
    (visited ?loc - location)
    (available ?person - person ?loc - location ?start - time ?end - time)
    (meeting_scheduled ?person - person)
    (current_time ?time - time)
    (next_time ?curr - time ?next - time)
  )
  
  (:action move
    :parameters (?from - location ?to - location ?duration - time)
    :precondition (and 
                    (at ?from)
                    (not (at ?to)))
    :effect (and
              (not (at ?from))
              (at ?to)
              (visited ?to)
            )
  )
  
  (:action schedule_meeting
    :parameters (?person - person ?location - location ?start - time ?end - time)
    :precondition (and
                    (at ?location)
                    (available ?person ?location ?start ?end)
                    (current_time ?start)
                    (not (meeting_scheduled ?person))
                    (next_time ?start ?end)
                  )
    :effect (meeting_scheduled ?person)
  )
)