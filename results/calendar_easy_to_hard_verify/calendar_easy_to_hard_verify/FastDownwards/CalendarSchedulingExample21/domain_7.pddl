(define (domain schedule-meeting)
  (:requirements :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
  )

  (:action schedule-by-sara
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

  (:action schedule-by-sarah
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

  (:action schedule-by-shirley
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

  (:action schedule-by-harold
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

  (:action schedule-by-terry
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