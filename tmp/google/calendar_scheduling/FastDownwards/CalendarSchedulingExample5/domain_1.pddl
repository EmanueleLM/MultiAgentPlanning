(define (domain meeting-scheduling-combined)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:constants kathryn charlotte lauren - person)

  (:predicates
    (available ?p - person ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
    (booked ?s - slot)
  )

  (:action schedule-at-kathryn
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