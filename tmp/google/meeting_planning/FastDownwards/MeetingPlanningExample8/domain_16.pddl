(define (domain integrated_schedule)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent location - object
  )

  (:predicates
    (at ?person - agent ?loc - location)
    (meeting-planned ?person1 - agent ?person2 - agent)
    (available ?person - agent)
  )

  (:action travel
    :parameters (?person - agent ?from - location ?to - location)
    :precondition (and (at ?person ?from))
    :effect (and (not (at ?person ?from)) 
                 (at ?person ?to))
  )

  (:action start-meeting
    :parameters (?person1 - agent ?person2 - agent ?loc - location)
    :precondition (and (at ?person1 ?loc)
                       (at ?person2 ?loc)
                       (available ?person1)
                       (available ?person2)
                       (not (meeting-planned ?person1 ?person2)))
    :effect (and (meeting-planned ?person1 ?person2))
  )
)