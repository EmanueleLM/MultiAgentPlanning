(define (domain integrated_schedule)
  (:requirements :strips :typing :fluents)

  (:types
    agent location
  )

  (:predicates
    (at ?person - agent ?loc - location)
    (meeting-planned ?person1 - agent ?person2 - agent)
    (available ?person - agent)
  )

  (:functions
    (travel-time ?from - location ?to - location) 
    (time-spent ?person1 - agent ?person2 - agent)
  )

  (:action travel
    :parameters (?person - agent ?from - location ?to - location)
    :precondition (and (at ?person ?from) (>= (travel-time ?from ?to) 0))
    :effect (and (not (at ?person ?from)) (at ?person ?to))
  )

  (:action start-meeting
    :parameters (?person1 - agent ?person2 - agent ?loc - location)
    :precondition (and (at ?person1 ?loc)
                       (at ?person2 ?loc)
                       (available ?person1)
                       (available ?person2)
                       (>= (time-spent ?person1 ?person2) 0))
    :effect (and (meeting-planned ?person1 ?person2)
                 (increase (time-spent ?person1 ?person2) 1))
  )

  (:action increase-time
    :parameters (?person1 - agent ?person2 - agent ?time - number)
    :precondition (meeting-planned ?person1 ?person2)
    :effect (increase (time-spent ?person1 ?person2) ?time)
  )
)