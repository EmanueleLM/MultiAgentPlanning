(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person time)
  (:predicates
    (participant ?p - person)
    (available ?p - person ?t - time)    ; participant is free to start a 30-min meeting at time ?t
    (meeting-scheduled)
    (meeting-at ?t - time)
    (earliest ?t - time)                 ; helper predicate marking the earliest jointly-feasible slot
  )

  ;; Schedule an explicit 30-minute meeting at a discrete 30-minute start time.
  ;; Participants are explicit action parameters so agent constraints are explicit.
  (:action schedule-meeting
    :parameters (?t - time ?m - person ?j - person ?e - person ?th - person)
    :precondition (and
      (not (meeting-scheduled))
      (earliest ?t)
      (participant ?m) (participant ?j) (participant ?e) (participant ?th)
      (available ?m ?t) (available ?j ?t) (available ?e ?t) (available ?th ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
    )
  )
)