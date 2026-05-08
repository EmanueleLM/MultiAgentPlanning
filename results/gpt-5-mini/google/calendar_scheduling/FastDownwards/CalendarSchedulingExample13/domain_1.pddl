(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot participant)

  (:predicates
    ;; availability predicates kept distinct per participant
    (available_gerald ?s - slot)
    (available_roy ?s - slot)
    (available_barbara ?s - slot)

    ;; result predicates
    (meeting_scheduled)
    (scheduled_at ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (available_gerald ?s)
      (available_roy ?s)
      (available_barbara ?s)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
    )
  )
)