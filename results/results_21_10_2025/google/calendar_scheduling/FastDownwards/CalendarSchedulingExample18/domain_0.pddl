(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (available ?p - person ?s - slot)
    (meeting-scheduled ?s - slot)
  )

  ;; Three distinct scheduling actions (one per agent), each can schedule a 30-min meeting
  ;; in a slot if all participants are available at that slot and the slot is not yet used.
  (:action schedule-by-brian
    :parameters (?s - slot)
    :precondition (and
      (available brian ?s)
      (available billy ?s)
      (available patricia ?s)
      (not (meeting-scheduled ?s))
    )
    :effect (and
      (meeting-scheduled ?s)
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
    )
    :effect (and
      (meeting-scheduled ?s)
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
    )
    :effect (and
      (meeting-scheduled ?s)
      (not (available brian ?s))
      (not (available billy ?s))
      (not (available patricia ?s))
    )
  )
)