(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person timeslot)
  (:constants ben hann brenda - person)
  (:predicates
    (slot ?s - timeslot)
    (free ?p - person ?s - timeslot)
    (preferred-by-benjamin ?s - timeslot)
    (proposed ?s - timeslot)
    (hannah-confirmed ?s - timeslot)
    (meeting-scheduled ?s - timeslot)
  )

  (:action benjamin-propose
    :parameters (?s - timeslot)
    :precondition (and
      (slot ?s)
      (free ben ?s)
      (preferred-by-benjamin ?s)
      (not (proposed ?s))
    )
    :effect (and
      (proposed ?s)
    )
  )

  (:action hannah-confirm
    :parameters (?s - timeslot)
    :precondition (and
      (slot ?s)
      (free hann ?s)
      (proposed ?s)
      (not (hannah-confirmed ?s))
    )
    :effect (and
      (hannah-confirmed ?s)
    )
  )

  (:action brenda-confirm
    :parameters (?s - timeslot)
    :precondition (and
      (slot ?s)
      (free brenda ?s)
      (proposed ?s)
      (hannah-confirmed ?s)
      (not (meeting-scheduled ?s))
    )
    :effect (and
      (meeting-scheduled ?s)
      (not (proposed ?s))
      (not (hannah-confirmed ?s))
    )
  )
)