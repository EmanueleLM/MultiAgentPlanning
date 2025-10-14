(define (domain meeting_scheduling)
  (:requirements :strips :typing)
  (:types person time)
  (:predicates
    (available ?p - person ?t - time)   ; participant ?p is available to start a 60-min meeting at time ?t
    (meeting-scheduled)
    (meeting-at ?t - time)
  )

  ;; Schedule a 60-minute meeting starting at a given time ?t.
  ;; Precondition: all participants are available at ?t.
  ;; Effect: a meeting is scheduled and recorded at ?t.
  (:action schedule-meeting
    :parameters (?t - time)
    :precondition (and
      (available michelle ?t)
      (available steven ?t)
      (available jerry ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
    )
  )
)