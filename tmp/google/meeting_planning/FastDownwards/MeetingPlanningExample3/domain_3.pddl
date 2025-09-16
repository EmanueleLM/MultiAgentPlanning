(define (domain integrated_meeting)
  (:requirements :strips :typing :fluents)

  (:types 
    location person
  )

  (:predicates 
    (at ?person - person ?location - location)
    (can_meet)
    (can_meet_persons ?person1 - person ?person2 - person)
    (meeting_planned ?person1 - person ?person2 - person)
  )

  (:functions
    (time) ;; current time in minutes since the start of the day
    (meeting_time) ;; accumulated meeting time with Barbara
    (travel-time ?from ?to - location)
  )

  (:action travel_traveler
    :parameters (?from ?to - location)
    :precondition (at traveler ?from)
    :effect (and
      (not (at traveler ?from))
      (at traveler ?to)
      (increase (time) (travel-time ?from ?to))
    )
  )

  (:action travel_barbara
    :parameters (?from ?to - location)
    :precondition (at barbara ?from)
    :effect (and
      (not (at barbara ?from))
      (at barbara ?to)
    )
  )

  (:action meet_barbara
    :parameters ()
    :precondition (and
      (at traveler golden_gate_park)
      (>= (time) 480) ;; Barbara available start time
      (<= (time) 690) ;; Barbara available end time - meeting duration
      (can_meet)
    )
    :effect (and
      (increase (meeting_time) 1)
      (increase (time) 1)
    )
  )

  (:action schedule_meeting
    :parameters (?person1 - person ?person2 - person)
    :precondition (can_meet_persons ?person1 ?person2)
    :effect (meeting_planned ?person1 ?person2)
  )
)