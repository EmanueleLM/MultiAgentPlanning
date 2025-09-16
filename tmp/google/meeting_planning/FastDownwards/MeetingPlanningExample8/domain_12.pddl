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
    :parameters (?person - agent ?from - location ?to - location)
    :duration (= ?duration (if (and (at ?from chinatown) (at ?to marina_district)) 12 16))
    :condition (at start (at ?person ?from))
    :effect (and (at end (not (at ?person ?from)))
                 (at end (at ?person ?to)))
  )

  (:durative-action meet
    :parameters (?person1 - agent ?person2 - agent ?loc - location)
    :duration (>= ?duration 105)
    :condition (and (at start (at ?person1 ?loc))
                    (at start (at ?person2 ?loc))
                    (at start (available ?person1))
                    (at start (available ?person2)))
    :effect (at end (meeting-planned ?person1 ?person2))
  )
)