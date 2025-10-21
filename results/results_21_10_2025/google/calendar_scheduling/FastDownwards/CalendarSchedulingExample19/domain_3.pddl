(define (domain meeting-scheduling-30min)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot meeting)

  (:predicates
    (available ?p - participant ?s - slot)
    (meeting-at ?m - meeting ?s - slot)
    (scheduled ?m - meeting)
    (meeting-scheduled ?s - slot)
    (next ?s1 - slot ?s2 - slot)
  )

  (:constants stephen edward angela - participant)

  (:action schedule-meeting
    :parameters (?m - meeting ?s - slot ?s2 - slot)
    :precondition (and
      (not (scheduled ?m))
      (not (meeting-scheduled ?s))
      (not (meeting-scheduled ?s2))
      (next ?s ?s2)
      (available stephen ?s)
      (available stephen ?s2)
      (available edward ?s)
      (available edward ?s2)
      (available angela ?s)
      (available angela ?s2)
    )
    :effect (and
      (meeting-at ?m ?s)
      (meeting-at ?m ?s2)
      (scheduled ?m)
      (meeting-scheduled ?s)
      (meeting-scheduled ?s2)
    )
  )
)