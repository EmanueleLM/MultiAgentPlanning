(define (domain integrated_meeting_schedule)
  (:requirements :strips :typing)

  (:types location person)

  (:predicates
    (at ?person - person ?loc - location)
    (can_meet ?person - person)
    (meeting_successful)
  )

  ;; Agent 1 Actions
  (:action agent1-travel
    :parameters (?from - location ?to - location)
    :precondition (and (at visitor ?from))
    :effect (and 
      (not (at visitor ?from))
      (at visitor ?to)
    )
  )

  (:action agent1-meet
    :parameters (?person - person ?loc - location)
    :precondition (and
      (can_meet ?person)
      (at visitor ?loc)
      (at ?person ?loc)
    )
    :effect (meeting_successful)
  )

  ;; Agent 2 Actions (Identified with Agent2 prefix)
  (:action agent2-travel
    :parameters (?from - location ?to - location)
    :precondition (at visitor ?from)
    :effect (and 
      (not (at visitor ?from))
      (at visitor ?to)
    )
  )

  (:action agent2-meet
    :parameters (?person - person ?loc - location)
    :precondition (and
      (can_meet ?person)
      (at visitor ?loc)
      (at ?person ?loc)
    )
    :effect (meeting_successful)
  )
)