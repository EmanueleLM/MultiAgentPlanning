(define (domain meeting_schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time person)
  (:predicates
    (at ?loc - location)
    (visited ?loc - location)
    (available ?person - person ?loc - location ?start - time ?end - time)
    (meeting_scheduled ?person - person)
    (current_time ?time - time)
    (next_time ?curr ?next - time)
    (can_visit ?start ?end - time)
    (meeting_possible ?person - person ?start - time ?end - time)
  )
  
  (:action move
    :parameters (?from - location ?to - location ?depart ?arrive - time)
    :precondition (and 
                    (at ?from)
                    (next_time ?depart ?arrive)
                    (current_time ?depart)
                    (can_visit ?depart ?arrive))
    :effect (and
              (not (at ?from))
              (at ?to)
              (visited ?to)
              (not (current_time ?depart))
              (current_time ?arrive))
  )
  
  (:action schedule_meeting
    :parameters (?person - person ?location - location ?start ?end - time)
    :precondition (and
                    (at ?location)
                    (available ?person ?location ?start ?end)
                    (current_time ?start)
                    (meeting_possible ?person ?start ?end)
                    (not (meeting_scheduled ?person)))
    :effect (meeting_scheduled ?person)
  )
)