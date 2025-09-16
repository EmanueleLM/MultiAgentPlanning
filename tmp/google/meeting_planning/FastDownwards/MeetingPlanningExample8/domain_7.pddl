(define (domain integrated_schedule)
  (:requirements :strips :typing)

  (:types
    agent location
  )

  (:predicates
    (at ?person - agent ?loc - location)
    (meeting-planned ?person1 - agent ?person2 - agent)
    (in-availability-window)
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
                       (in-availability-window))
    :effect (meeting-planned ?person1 ?person2)
  )
  
  (:action synchronize-time
    :parameters ()
    :precondition (and (at traveler marina_district)
                       (at stephanie marina_district))
    :effect (in-availability-window)
  )
)