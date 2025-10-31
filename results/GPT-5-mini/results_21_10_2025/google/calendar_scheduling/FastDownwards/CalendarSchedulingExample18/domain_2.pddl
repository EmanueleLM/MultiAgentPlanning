(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:constants brian billy patricia - person)

  (:predicates
    (available ?p - person ?s - slot)
    (meeting-scheduled ?s - slot)
    (meeting-made)
  )

  (:action schedule-by-brian
    :parameters (?s - slot)
    :precondition (and
      (available brian ?s)
      (available billy ?s)
      (available patricia ?s)
      (not (meeting-scheduled ?s))
      (not (meeting-made))
    )
    :effect (and
      (meeting-scheduled ?s)
      (meeting-made)
      (not (available brian ?s))
      (not (available billy ?s))
      (not (available patricia ?s))
    )
  )

  (:action schedule-by-billy
    :parameters (?s - slot)
    :precondition (and
      (available brian ?s)
      (available billy ?s)
      (available patricia ?s)
      (not (meeting-scheduled ?s))
      (not (meeting-made))
    )
    :effect (and
      (meeting-scheduled ?s)
      (meeting-made)
      (not (available brian ?s))
      (not (available billy ?s))
      (not (available patricia ?s))
    )
  )

  (:action schedule-by-patricia
    :parameters (?s - slot)
    :precondition (and
      (available brian ?s)
      (available billy ?s)
      (available patricia ?s)
      (not (meeting-scheduled ?s))
      (not (meeting-made))
    )
    :effect (and
      (meeting-scheduled ?s)
      (meeting-made)
      (not (available brian ?s))
      (not (available billy ?s))
      (not (available patricia ?s))
    )
  )
)