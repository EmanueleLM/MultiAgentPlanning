(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant time_slot)

  (:predicates
    (occupied ?p - participant ?s - time_slot)
    (available ?s - time_slot)
    (scheduled ?s - time_slot)
  )

  (:action schedule_meeting
    :parameters (?s - time_slot)
    :precondition (and
      (available ?s)
      (not (occupied gregory ?s))
      (not (occupied teresa ?s))
      (not (occupied carol ?s))
    )
    :effect (scheduled ?s)
  )
)