(define (domain integrated_meeting_schedule)
  (:requirements :strips :typing)

  (:types location person)

  (:predicates
    (at ?person - person ?loc - location)
    (can_meet ?person - person)
    (meeting_successful)
  )

  ;; Visitor Actions (Agent 1)
  (:action visitor-travel
    :parameters (?from - location ?to - location)
    :precondition (and (at visitor ?from))
    :effect (and 
      (not (at visitor ?from))
      (at visitor ?to)
    )
  )

  (:action visitor-meet
    :parameters (?person - person ?loc - location)
    :precondition (and
      (can_meet ?person)
      (at visitor ?loc)
      (at ?person ?loc)
    )
    :effect (meeting_successful)
  )

  ;; Jessica Actions (Agent 2)
  (:action jessica-travel
    :parameters (?from - location ?to - location)
    :precondition (and (at jessica ?from))
    :effect (and 
      (not (at jessica ?from))
      (at jessica ?to)
    )
  )

  (:action jessica-meet
    :parameters (?person - person ?loc - location)
    :precondition (and
      (can_meet ?person)
      (at jessica ?loc)
      (at ?person ?loc)
    )
    :effect (meeting_successful)
  )
)