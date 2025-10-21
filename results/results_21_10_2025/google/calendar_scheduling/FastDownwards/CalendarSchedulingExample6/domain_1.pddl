(define (domain meeting-scheduling)
  (:requirements :typing :strips :negative-preconditions)
  (:types person slot)

  (:predicates
    (free ?p - person ?s - slot)
    (consecutive ?s1 - slot ?s2 - slot)
    (meeting-scheduled)
    (meeting-start ?s - slot)
  )

  (:action schedule-meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (consecutive ?s1 ?s2)
      (not (meeting-scheduled))
      (free thomas ?s1) (free thomas ?s2)
      (free dylan ?s1) (free dylan ?s2)
      (free jerry ?s1) (free jerry ?s2)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start ?s1)
      (not (free thomas ?s1)) (not (free thomas ?s2))
      (not (free dylan ?s1)) (not (free dylan ?s2))
      (not (free jerry ?s1)) (not (free jerry ?s2))
    )
  )
)