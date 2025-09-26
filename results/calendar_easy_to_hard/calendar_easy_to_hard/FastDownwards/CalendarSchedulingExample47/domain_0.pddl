(define (domain meeting-scheduling)
  (:requirements :typing :adl :strips)
  (:types person slot)
  (:predicates
    (person ?p - person)
    (slot ?s - slot)
    (available ?p - person ?s - slot)    ; participant ?p is available at slot ?s
    (meeting-scheduled)                   ; global flag: meeting has been scheduled
    (scheduled-at ?s - slot)              ; meeting scheduled at slot ?s
    (attends ?p - person ?s - slot)       ; participant ?p attends meeting at ?s
  )
  ;; Schedule meeting at a single slot only if every participant is available at that slot.
  ;; Effects mark meeting scheduled and that each participant attends that slot.
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      (forall (?p - person) (available ?p ?s))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
      (forall (?p - person) (attends ?p ?s))
    )
  )
)