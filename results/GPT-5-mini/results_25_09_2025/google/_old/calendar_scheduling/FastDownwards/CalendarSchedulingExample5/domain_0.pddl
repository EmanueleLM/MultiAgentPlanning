(define (domain meeting-scheduling-combined)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (available ?p - person ?s - slot)
    (slot ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
    (booked ?s - slot)
  )

  ;; Kathryn's scheduling action (keeps Kathryn's original action name distinct)
  (:action schedule-at-kathryn
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (not (meeting-scheduled))
      (available kathryn ?s)
      (available charlotte ?s)
      (available lauren ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (booked ?s)
    )
  )

  ;; Charlotte's scheduling action (keeps Charlotte's action distinct)
  (:action schedule-meeting-charlotte
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      (available kathryn ?s)
      (available charlotte ?s)
      (available lauren ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (booked ?s)
    )
  )

  ;; Lauren's scheduling action (keeps Lauren's action distinct, preserves booked check)
  (:action schedule-lauren
    :parameters (?s - slot)
    :precondition (and
      (not (booked ?s))
      (not (meeting-scheduled))
      (available lauren ?s)
      (available kathryn ?s)
      (available charlotte ?s)
    )
    :effect (and
      (booked ?s)
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )
)