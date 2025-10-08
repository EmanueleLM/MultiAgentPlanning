(define (domain schedule-meeting)
  (:requirements :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      (free sara ?s)
      (free sarah ?s)
      (free shirley ?s)
      (free harold ?s)
      (free terry ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )
)