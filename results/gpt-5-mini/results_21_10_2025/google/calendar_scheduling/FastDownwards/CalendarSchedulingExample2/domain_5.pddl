(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (available ?p - participant ?s - slot)
    (amy_pref ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  (:action orchestrator-schedule
    :parameters (?o - participant ?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      (available roy ?s)
      (available kathryn ?s)
      (available amy ?s)
      (amy_pref ?s)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
    )
  )
)