(define (domain meeting-scheduling)
  (:requirements :typing :strips :adl)
  (:types person slot)
  (:predicates
    (available ?p - person ?s - slot)  ; slot ?s is available for person ?p
    (unscheduled)                       ; true until a meeting is scheduled
    (scheduled)                         ; true once a meeting is scheduled
    (scheduled-at ?s - slot)           ; the slot that was scheduled
  )

  ;; Schedule a meeting in one slot if that slot is available for each participant.
  ;; Parameters include the slot and the three named participants so their
  ;; availability constraints remain distinct in the action schema.
  (:action schedule
    :parameters (?s - slot ?r - person ?k - person ?a - person)
    :precondition (and
      (unscheduled)
      (available ?r ?s)
      (available ?k ?s)
      (available ?a ?s)
    )
    :effect (and
      (scheduled)
      (scheduled-at ?s)
      (not (unscheduled))
    )
  )
)