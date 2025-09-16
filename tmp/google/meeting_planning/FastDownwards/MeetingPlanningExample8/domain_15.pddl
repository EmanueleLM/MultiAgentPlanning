(define (domain integrated_schedule)
  (:requirements :strips :typing :negative-preconditions :durative-actions)

  (:types
    agent location - object
  )

  (:predicates
    (at ?person - agent ?loc - location)
    (meeting-planned ?person1 - agent ?person2 - agent)
    (available ?person - agent)
  )

  (:durative-action travel
    :parameters (?person - agent ?from - location ?to - location)
    :duration (= ?duration (travel-time ?from ?to))
    :condition (and (at start (at ?person ?from)))
    :effect (and (at end (not (at ?person ?from))) 
                 (at end (at ?person ?to)))
  )

  (:durative-action start-meeting
    :parameters (?person1 - agent ?person2 - agent ?loc - location)
    :duration (>= ?duration 1)
    :condition (and (at start (at ?person1 ?loc))
                    (at start (at ?person2 ?loc))
                    (at start (available ?person1))
                    (at start (available ?person2))
                    (at start (not (meeting-planned ?person1 ?person2))))
    :effect (and (at start (meeting-planned ?person1 ?person2))
                 (at start (increase (time-spent ?person1 ?person2) ?duration)))
  )
)