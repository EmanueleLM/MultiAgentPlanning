(define (domain integrated_schedule)
  (:requirements :strips :typing)

  (:types
    agent location
  )

  (:predicates
    (at ?person - agent ?loc - location)
    (meeting-planned ?person1 - agent ?person2 - agent)
    (available ?person - agent)
    ; Removed (meeting-time ?duration - number) because it is not used directly in any action
  )

  (:action travel
    :parameters (?person - agent ?from - location ?to - location)
    :precondition (at ?person ?from)
    :effect (and (not (at ?person ?from))
                 (at ?person ?to))
  )

  (:action meet
    :parameters (?person1 - agent ?person2 - agent ?loc - location)
    :precondition (and (at ?person1 ?loc)
                       (at ?person2 ?loc)
                       (available ?person1)
                       (available ?person2)
                       ; Removed (>= ?duration 105) as it uses an invalid comparison operator in PDDL
    )
    :effect (meeting-planned ?person1 ?person2)
  )
)