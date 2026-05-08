(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timepoint)
  (:predicates
    (available-for-meeting ?p - participant ?t - timepoint)
    (attended ?p - participant ?t - timepoint)
    (meeting-scheduled ?t - timepoint)
  )

  (:action attend
    :parameters (?p - participant ?t - timepoint)
    :precondition (and
      (available-for-meeting ?p ?t)
      (not (attended ?p ?t))
    )
    :effect (attended ?p ?t)
  )

  (:action confirm-meeting
    :parameters (?t - timepoint ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (attended ?p1 ?t)
      (attended ?p2 ?t)
      (attended ?p3 ?t)
      (not (meeting-scheduled ?t))
    )
    :effect (meeting-scheduled ?t)
  )
)