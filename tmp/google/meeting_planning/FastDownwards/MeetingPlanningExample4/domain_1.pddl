(define (domain integrated_meeting_schedule)
  (:requirements :strips :durative-actions :typing)

  (:types location person)

  (:predicates
    (at ?person - person ?loc - location)
    (can_meet ?person - person)
    (meeting_successful)
  )

  (:functions
    (current-time)
  )

  ;; Agent 1 Actions
  (:durative-action agent1-travel
    :parameters (?from - location ?to - location)
    :duration (= ?duration 10)
    :condition (and (at start (>= (current-time) 0)) (at start (at visitor ?from)))
    :effect (and 
      (at start (decrease (current-time) 10))
      (at end (not (at visitor ?from)))
      (at end (at visitor ?to))
    )
  )

  (:durative-action agent1-meet
    :parameters (?person - person ?loc - location)
    :duration (>= ?duration 60)
    :condition (and
      (at start (can_meet ?person))
      (at start (at visitor ?loc))
      (at start (at ?person ?loc))
    )
    :effect (at end (meeting_successful))
  )

  ;; Agent 2 Actions (Identified with Agent2 prefix)
  (:durative-action agent2-travel
    :parameters (?from - location ?to - location)
    :duration (= ?duration 10)
    :condition (and (at start (at Presidio)))
    :effect (and 
      (at end (not (at Presidio)))
      (at end (at MarinaDistrict))
    )
  )

  (:durative-action agent2-meet
    :parameters ()
    :duration (>= ?duration 60)
    :condition (and (at start (at MarinaDistrict)))
    :effect (at end (meeting_successful))
  )
)