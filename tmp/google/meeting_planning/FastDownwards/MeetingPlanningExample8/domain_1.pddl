(define (domain integrated_schedule)
  (:requirements :strips :typing)

  (:types
    agent location
  )

  (:predicates
    (at ?person - agent ?loc - location)
    (traveler-available ?person - agent ?loc - location)
    (available-at ?person - agent ?loc - location)
    (meeting-scheduled)
    (time-spent ?person1 - agent ?person2 - agent)
  )

  (:action travel
    :parameters (?person - agent ?from - location ?to - location)
    :precondition (and (at ?person ?from))
    :effect (and (not (at ?person ?from))
                 (at ?person ?to))
  )

  (:action meet
    :parameters (?person1 - agent ?person2 - agent ?loc - location)
    :precondition (and (at ?person1 ?loc)
                       (available-at ?person2 ?loc))
    :effect (and (meeting-scheduled)
                 (time-spent ?person1 ?person2))
  )
)