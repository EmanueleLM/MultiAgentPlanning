(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (available ?p - participant ?s - slot)
    (amy_pref ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  (:action schedule-meeting
    :parameters (?r - participant ?k - participant ?a - participant ?s - slot)
    :precondition (and
      (available ?r ?s)
      (available ?k ?s)
      (available ?a ?s)
      (amy_pref ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
    )
  )
)