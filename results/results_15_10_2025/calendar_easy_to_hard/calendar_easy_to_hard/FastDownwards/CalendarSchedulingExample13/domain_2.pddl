(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (agent ?p - participant)
    (free ?p - participant ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )

  (:action schedule
    :parameters (?s - slot ?d - participant ?j - participant ?e - participant ?p - participant)
    :precondition (and
      (free ?d ?s)
      (free ?j ?s)
      (free ?e ?s)
      (free ?p ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
    )
  )
)