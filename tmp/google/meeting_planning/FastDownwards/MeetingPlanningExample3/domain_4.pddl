(define (domain integrated_meeting)
  (:requirements :strips :typing :action-costs)

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
    (total-time) ;; current time in minutes since the start of the day
    (meeting-time_so_far) ;; accumulated meeting time with Barbara
    (travel-time ?from ?to - location)
  )

  (:action travel_traveler
    :parameters (?from ?to - location)
    :precondition (at traveler ?from)
    :effect (and
      (not (at traveler ?from))
      (at traveler ?to)
      (increase (total-time) (travel-time ?from ?to))
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
      (>= (total-time) 540) ;; Barbara available start time
      (<= (total-time) 660) ;; Barbara available end time - meeting duration
      (can_meet)
    )
    :effect (and
      (increase (meeting-time_so_far) 1)
      (increase (total-time) 1)
    )
  )

  (:action schedule_meeting
    :parameters (?person1 - person ?person2 - person)
    :precondition (can_meet_persons ?person1 ?person2)
    :effect (meeting_planned ?person1 ?person2)
  )
)