(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (available ?p - participant ?s - slot)
    (before_1330 ?s - slot)
    (preferred_slot ?s - slot)
    (preferred_exists)
    (meeting_scheduled)
    (scheduled_at ?s - slot)
  )

  (:action schedule_preferred
    :parameters (?s - slot)
    :precondition (and
      (preferred_slot ?s)
      (preferred_exists)
      (available ralph ?s) (available peter ?s) (available daniel ?s)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
      (not (available ralph ?s)) (not (available peter ?s)) (not (available daniel ?s))
      (not (preferred_exists))
    )
  )

  (:action schedule_any
    :parameters (?s - slot)
    :precondition (and
      (available ralph ?s) (available peter ?s) (available daniel ?s)
      (not (meeting_scheduled))
      (not (preferred_exists))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
      (not (available ralph ?s)) (not (available peter ?s)) (not (available daniel ?s))
    )
  )
)