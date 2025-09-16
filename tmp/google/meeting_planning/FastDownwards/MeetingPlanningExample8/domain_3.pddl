(define (domain integrated_schedule)
  (:requirements :strips :typing :durative-actions)

  (:types
    agent location
  )

  (:predicates
    (at ?person - agent ?loc - location)
    (meeting-planned ?person1 - agent ?person2 - agent)
    (in-availability-window)
  )

  (:durative-action travel
    :parameters (?person - agent ?from - location ?to - location)
    :duration (= ?duration 12) ; Chinatown to Marina District
    :condition (and (at start (at ?person ?from)))
    :effect (and (at start (not (at ?person ?from)))
                 (at end (at ?person ?to)))
  )

  (:durative-action meet
    :parameters (?person1 - agent ?person2 - agent ?loc - location)
    :duration (= ?duration 105)
    :condition (and (over all (at ?person1 ?loc))
                    (over all (at ?person2 ?loc))
                    (over all (in-availability-window)))
    :effect (at end (meeting-planned ?person1 ?person2))
  )
  
  (:action synchronize-time
    :parameters ()
    :precondition (and (at traveler marina_district)
                       (at stephanie marina_district))
    :effect (in-availability-window)
  )
)