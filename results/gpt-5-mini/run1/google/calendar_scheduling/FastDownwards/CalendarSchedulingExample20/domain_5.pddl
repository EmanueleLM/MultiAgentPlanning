(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (available ?p - participant ?s - slot)
    (before_preference ?s - slot)
    (meeting_scheduled)
    (scheduled_at ?s - slot)
  )

  (:action schedule_preferred
    :parameters (?s - slot)
    :precondition (and
      (before_preference ?s)
      (available ralph ?s) (available peter ?s) (available daniel ?s)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
      (not (available ralph ?s)) (not (available peter ?s)) (not (available daniel ?s))
    )
  )

  (:action schedule_any
    :parameters (?s - slot)
    :precondition (and
      (available ralph ?s) (available peter ?s) (available daniel ?s)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
      (not (available ralph ?s)) (not (available peter ?s)) (not (available daniel ?s))
    )
  )
)