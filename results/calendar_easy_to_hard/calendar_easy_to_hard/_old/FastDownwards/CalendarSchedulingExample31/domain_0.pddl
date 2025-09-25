(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (free ?p - person ?s - slot)        ; participant ?p is free at slot ?s
    (meeting-scheduled)                 ; meeting has been scheduled
    (scheduled-at ?s - slot)            ; meeting scheduled at slot ?s
  )

  ;; We keep each participant's scheduling action distinct (reflecting each agent's
  ;; original action). Each action requires the meeting not yet scheduled and
  ;; that all six participants are free at the chosen slot. Effects record the meeting.
  (:action schedule-amy
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      (free amy ?s)
      (free jonathan ?s)
      (free brittany ?s)
      (free matthew ?s)
      (free catherine ?s)
      (free carl ?s)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
    )
  )

  (:action schedule-jonathan
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      (free amy ?s)
      (free jonathan ?s)
      (free brittany ?s)
      (free matthew ?s)
      (free catherine ?s)
      (free carl ?s)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
    )
  )

  (:action schedule-brittany
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      (free amy ?s)
      (free jonathan ?s)
      (free brittany ?s)
      (free matthew ?s)
      (free catherine ?s)
      (free carl ?s)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
    )
  )

  (:action schedule-matthew
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      (free amy ?s)
      (free jonathan ?s)
      (free brittany ?s)
      (free matthew ?s)
      (free catherine ?s)
      (free carl ?s)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
    )
  )

  (:action schedule-catherine
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      (free amy ?s)
      (free jonathan ?s)
      (free brittany ?s)
      (free matthew ?s)
      (free catherine ?s)
      (free carl ?s)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
    )
  )

  (:action schedule-carl
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      (free amy ?s)
      (free jonathan ?s)
      (free brittany ?s)
      (free matthew ?s)
      (free catherine ?s)
      (free carl ?s)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
    )
  )
)