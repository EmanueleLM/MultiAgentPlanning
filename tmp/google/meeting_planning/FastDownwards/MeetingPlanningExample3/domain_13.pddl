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
    (total-time)
    (meeting-time_so_far)
    (travel-time)
  )

  (:action travel_traveler
    :parameters (?from ?to - location)
    :precondition (and
      (at traveler ?from)
    )
    :effect (and
      (not (at traveler ?from))
      (at traveler ?to)
      (increase (total-time) (travel-time))
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
      (>= (total-time) 540)
      (<= (total-time) 660)
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