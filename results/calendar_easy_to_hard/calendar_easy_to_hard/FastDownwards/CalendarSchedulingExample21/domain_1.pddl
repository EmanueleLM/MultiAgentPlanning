(define (domain schedule-meeting)
  (:requirements :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (free ?p - participant ?s - slot)
    (scheduled)
    (meeting-at ?s - slot)
  )
  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled))
      (free sara ?s)
      (free sarah ?s)
      (free shirley ?s)
      (free harold ?s)
      (free terry ?s)
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
    )
  )
)