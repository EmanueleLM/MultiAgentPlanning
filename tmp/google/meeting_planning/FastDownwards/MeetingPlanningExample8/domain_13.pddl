(define (domain integrated_schedule)
  (:requirements :strips :typing)

  (:types
    agent location
  )

  (:predicates
    (at ?person - agent ?loc - location)
    (meeting-planned ?person1 - agent ?person2 - agent)
    (available ?person - agent)
    (travel-time ?from - location ?to - location ?duration - number)
  )

  (:action travel
    :parameters (?person - agent ?from - location ?to - location)
    :precondition (and (at ?person ?from) (travel-time ?from ?to ?duration))
    :effect (and (not (at ?person ?from)) (at ?person ?to))
  )

  (:action meet
    :parameters (?person1 - agent ?person2 - agent ?loc - location)
    :precondition (and (at ?person1 ?loc)
                       (at ?person2 ?loc)
                       (available ?person1)
                       (available ?person2))
    :effect (meeting-planned ?person1 ?person2)
  )
)