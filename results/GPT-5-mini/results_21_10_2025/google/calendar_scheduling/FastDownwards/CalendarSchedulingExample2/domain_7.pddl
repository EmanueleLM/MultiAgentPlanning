(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:constants roy kathryn amy orchestrator - participant)

  (:predicates
    (available ?p - participant ?s - slot)
    (amy_pref ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  (:action orchestrator-schedule
    :parameters (?s - slot)
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