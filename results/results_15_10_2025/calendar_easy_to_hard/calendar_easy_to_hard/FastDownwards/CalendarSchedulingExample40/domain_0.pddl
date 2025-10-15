(define (domain meeting-scheduling)
  (:requirements :typing :adl :universal-preconditions :negative-preconditions)
  (:types participant slot)
  (:predicates
    (busy ?p - participant ?s - slot)
    (feasible ?s - slot)
    (assigned ?s - slot)
    (meeting-scheduled)
    (before ?s1 - slot ?s2 - slot)
  )

  ;; Identify a slot as feasible iff no participant is busy in that slot.
  (:action identify-feasible
    :parameters (?s - slot)
    :precondition (and
      (not (feasible ?s))
      (forall (?p - participant) (not (busy ?p ?s)))
    )
    :effect (feasible ?s)
  )

  ;; Assign the meeting to a feasible slot; this action is only applicable
  ;; when there is no earlier slot that has already been identified feasible.
  ;; This enforces the "earliest feasible" requirement.
  (:action assign-meeting
    :parameters (?s - slot)
    :precondition (and
      (feasible ?s)
      (not (meeting-scheduled))
      ;; For every slot ?t: if ?t is before ?s, then ?t must NOT be feasible.
      (forall (?t - slot) (or (not (before ?t ?s)) (not (feasible ?t))))
    )
    :effect (and (meeting-scheduled) (assigned ?s))
  )
)