(define (domain schedule-meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types time person)
  (:predicates
    (scheduled)                           ; true once a meeting start time is chosen
    (meeting-start ?t - time)             ; the chosen start time of the meeting
    (forbidden ?p - person ?t - time)     ; start time ?t is forbidden for participant ?p
  )

  (:action schedule
    :parameters (?t - time)
    :precondition (and
      (not (scheduled))
      (not (forbidden michelle ?t))
      (not (forbidden steven ?t))
      (not (forbidden jerry ?t))
    )
    :effect (and
      (scheduled)
      (meeting-start ?t)
    )
  )
)