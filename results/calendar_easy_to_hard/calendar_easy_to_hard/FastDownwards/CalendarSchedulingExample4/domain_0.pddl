(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent slot)
  (:predicates
    (free ?a - agent ?s - slot)     ; agent ?a is free at slot ?s
    (all-free ?s - slot)           ; all participants are free at slot ?s
    (earliest ?s - slot)           ; slot ?s is the earliest allowed common slot
    (scheduled ?s - slot)          ; meeting has been scheduled at slot ?s
  )

  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and (all-free ?s) (earliest ?s))
    :effect (and (scheduled ?s))
  )
)