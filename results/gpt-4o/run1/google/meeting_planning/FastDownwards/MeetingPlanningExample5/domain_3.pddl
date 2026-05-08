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
    (meeting_possible ?person - person ?start - time ?end - time)
  )
  
  (:action move
    :parameters (?from - location ?to - location ?duration - time)
    :precondition (and 
                    (at ?from)
                    (not (at ?to))
                    (next_time ?from ?to))
    :effect (and
              (not (at ?from))
              (at ?to)
              (visited ?to)
              (next_time ?from ?to)
            )
  )
  
  (:action schedule_meeting
    :parameters (?person - person ?location - location ?start - time ?end - time)
    :precondition (and
                    (at ?location)
                    (available ?person ?location ?start ?end)
                    (current_time ?start)
                    (meeting_possible ?person ?start ?end)
                    (not (meeting_scheduled ?person))
                  )
    :effect (meeting_scheduled ?person)
  )
)