(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent slot)

  (:predicates
    (agent ?a - agent)
    (slot ?s - slot)
    (free ?a - agent ?s - slot)          ; agent is free at slot
    (all-free ?s - slot)                 ; all participants free at slot
    (candidate ?s - slot)                ; earliest available-all-free slot candidate
    (scheduled ?s - slot)                ; meeting scheduled at slot
    (meeting-scheduled)
  )

  ; Schedule a single 30-minute meeting at a slot that is marked candidate
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and (slot ?s) (candidate ?s) (all-free ?s) (not (meeting-scheduled)))
    :effect (and (scheduled ?s) (meeting-scheduled))
  )
)