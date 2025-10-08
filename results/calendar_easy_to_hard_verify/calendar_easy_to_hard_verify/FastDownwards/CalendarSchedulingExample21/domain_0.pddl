(define (domain schedule-meeting)
  (:requirements :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (slot ?s - slot)
    (person ?p - person)
    (free ?p - person ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (not (meeting-scheduled))
      ;; all participants must be free at the chosen 30-min start slot
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