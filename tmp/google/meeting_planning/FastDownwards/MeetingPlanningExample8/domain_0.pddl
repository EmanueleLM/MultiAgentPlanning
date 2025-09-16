(define (domain integrated_schedule)
  (:requirements :strips :typing)

  (:types
    agent location
  )

  (:predicates
    ; Common predicates
    (at ?person - agent ?loc - location)
    
    ; Traveler-specific predicates
    (traveler-available ?person - agent ?loc - location)

    ; Stephanie-specific predicates
    (available-at ?person - agent ?loc - location)

    ; Meeting predicates
    (meeting-scheduled)
    (time-spent ?person1 - agent ?person2 - agent ?minutes - number)
  )

  (:action travel
    :parameters (?person - agent ?from - location ?to - location ?duration - number)
    :precondition (and (at ?person ?from))
    :effect (and (not (at ?person ?from))
                 (at ?person ?to))
  )

  (:action meet
    :parameters (?person1 - agent ?person2 - agent ?loc - location ?duration - number)
    :precondition (and (at ?person1 ?loc)
                       (available-at ?person2 ?loc)
                       (= ?duration 105))
    :effect (and (meeting-scheduled)
                 (time-spent ?person1 ?person2 ?duration))
  )
)