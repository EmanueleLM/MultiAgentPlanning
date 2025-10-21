(define (domain meeting-scheduling-30min)
  (:requirements :typing :negative-preconditions)
  (:types participant slot meeting)

  (:predicates
    (available ?p - participant ?s - slot)
    (meeting-at ?m - meeting ?s - slot)
    (scheduled ?m - meeting)
    (meeting-scheduled ?s - slot)
  )

  (:action schedule-meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (scheduled ?m))
      (not (meeting-scheduled ?s))
      (available stephen ?s)
      (available edward ?s)
      (available angela ?s)
    )
    :effect (and
      (meeting-at ?m ?s)
      (scheduled ?m)
      (meeting-scheduled ?s)
    )
  )
)