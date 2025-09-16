(define (domain integrated_schedule)
  (:requirements :strips :typing :durative-actions)

  (:types
    agent location
  )

  (:predicates
    (at ?person - agent ?loc - location)
    (meeting-planned ?person1 - agent ?person2 - agent)
    (available ?person - agent)
  )

  (:durative-action travel
    :parameters (?person - agent ?from - location ?to - location ?travel-time - number)
    :duration (= ?duration ?travel-time)
    :condition (at start (at ?person ?from))
    :effect (and (at end (not (at ?person ?from)))
                 (at end (at ?person ?to)))
  )

  (:durative-action meet
    :parameters (?person1 - agent ?person2 - agent ?loc - location)
    :duration (>= ?duration 105)
    :condition (and (over all (at ?person1 ?loc))
                    (over all (at ?person2 ?loc))
                    (over all (available ?person1))
                    (over all (available ?person2)))
    :effect (at end (meeting-planned ?person1 ?person2))
  )
)