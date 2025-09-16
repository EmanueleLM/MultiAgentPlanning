(define (domain integrated_meeting)
  (:requirements :strips :typing :durative-actions)

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

  (:durative-action travel_traveler
    :parameters (?from ?to - location)
    :duration (= ?duration (travel-time ?from ?to))
    :condition (at start (at traveler ?from))
    :effect (and
      (at start (not (at traveler ?from)))
      (at end (at traveler ?to))
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

  (:durative-action meet_barbara
    :parameters ()
    :duration (>= ?duration 1) ;; meeting in minutes
    :condition (and
      (at start (at traveler golden_gate_park))
      (at start (>= (time) 480)) ;; Barbara available start time
      (at start (<= (time) 690)) ;; Barbara available end time - meeting duration
      (at start (can_meet))
    )
    :effect (and
      (increase (meeting_time) ?duration)
      (increase (time) ?duration)
    )
  )

  (:action schedule_meeting
    :parameters (?person1 - person ?person2 - person)
    :precondition (can_meet_persons ?person1 ?person2)
    :effect (meeting_planned ?person1 ?person2)
  )
)