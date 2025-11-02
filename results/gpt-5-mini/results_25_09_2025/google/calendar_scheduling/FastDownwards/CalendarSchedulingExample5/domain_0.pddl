(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (time-slot ?s - slot)
    (available ?p - person ?s - slot)
    (meeting-not-scheduled)
    (meeting-scheduled)
    (meeting-at ?s - slot)
  )

  ;; Kathryn may finalize a meeting if all are available at the slot
  (:action schedule-kathryn
    :parameters (?s - slot)
    :precondition (and
      (time-slot ?s)
      (available kathryn ?s)
      (available charlotte ?s)
      (available lauren ?s)
      (meeting-not-scheduled)
    )
    :effect (and
      (not (meeting-not-scheduled))
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )

  ;; Charlotte may finalize a meeting if all are available at the slot
  (:action schedule-charlotte
    :parameters (?s - slot)
    :precondition (and
      (time-slot ?s)
      (available kathryn ?s)
      (available charlotte ?s)
      (available lauren ?s)
      (meeting-not-scheduled)
    )
    :effect (and
      (not (meeting-not-scheduled))
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )

  ;; Lauren may finalize a meeting if all are available at the slot
  (:action schedule-lauren
    :parameters (?s - slot)
    :precondition (and
      (time-slot ?s)
      (available kathryn ?s)
      (available charlotte ?s)
      (available lauren ?s)
      (meeting-not-scheduled)
    )
    :effect (and
      (not (meeting-not-scheduled))
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )
)