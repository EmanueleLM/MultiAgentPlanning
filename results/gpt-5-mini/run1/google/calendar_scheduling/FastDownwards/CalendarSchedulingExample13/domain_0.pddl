(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot participant)

  (:predicates
    (slot ?s - slot)
    (participant ?p - participant)

    ;; Availability predicates are distinct per participant as required.
    (available-gerald ?s - slot)
    (available-free_09_17 ?s - slot)
    (available-anon3 ?s - slot)

    ;; Result predicates
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  ;; Single parameterized action to schedule the meeting at a concrete slot.
  ;; Preconditions require that every participant is available at that slot
  ;; and that a meeting has not yet been scheduled.
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (available-gerald ?s)
      (available-free_09_17 ?s)
      (available-anon3 ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
    )
  )
)