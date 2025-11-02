(define (domain meet-together)
  (:requirements :strips :typing)
  (:types person room)
  (:predicates 
    (in ?person - person ?room - room)
    (connected ?room1 - room ?room2 - room)
    (met ?person1 - person ?person2 - person)
  )
  (:action move
    :parameters (?agent - person ?from - room ?to - room)
    :precondition (and
      (in ?agent ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (in ?agent ?from))
      (in ?agent ?to)
    )
  )
  (:action meet
    :parameters (?agent1 - person ?agent2 - person ?room - room)
    :precondition (and
      (in ?agent1 ?room)
      (in ?agent2 ?room)
    )
    :effect (met ?agent1 ?agent2)
  )
)