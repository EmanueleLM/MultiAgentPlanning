and <problem> PDDL files and ensure they are compatible with Fast Downward.

<domain>
(define (domain meeting-scheduling)
  (:requirements :typing :adl)
  (:types participant slot)

  (:predicates
    (participant ?p - participant)
    (slot ?s - slot)
    ;; available: participant is available in a given discrete 30-minute slot
    (available ?p - participant ?s - slot)
    ;; earliest-allowed: marks the earliest common slot chosen (set in the problem)
    (earliest-allowed ?s - slot)
    ;; scheduled: the slot that gets scheduled (effect)
    (scheduled ?s - slot)
    ;; meeting-scheduled: global flag indicating meeting scheduled
    (meeting-scheduled)
  )

  ;; Schedule action: can be applied to a slot only if:
  ;;  - that slot is marked earliest-allowed in the problem (so we enforce earliest)
  ;;  - all participants are available in that slot (universal precondition)
  ;;  - a meeting has not already been scheduled
  (:action schedule-slot
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (earliest-allowed ?s)
      (not (meeting-scheduled))
      ;; universal precondition: every participant must be available in the slot
      (forall (?p - participant)
        (available ?p ?s)
      )
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
    )
  )
)