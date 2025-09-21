(define (domain multi-agent-meeting)
  (:requirements :typing :strips :negative-preconditions :equality :universal-preconditions)
  (:types participant slot)

  (:predicates
    (before ?s1 - slot ?s2 - slot)
    (free ?p - participant ?s - slot)
    (slot-free ?s - slot)
    (scheduled)
    (scheduled-at ?s - slot)
  )

  (:action schedule-at
    :parameters (?s - slot)
    :precondition (and
      (slot-free ?s)
      (forall (?p - participant) (free ?p ?s))
      (forall (?ear - slot) (or (not (before ?ear ?s)) (not (slot-free ?ear))))
    )
    :effect (and
      (not (slot-free ?s))
      (scheduled)
      (scheduled-at ?s)
    )
  )
)