(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent time)
  (:predicates
    (free ?a - agent ?t - time)        ; agent is free for a 30-min meeting starting at time ?t
    (busy ?a - agent ?t - time)        ; agent is busy such that a meeting starting at ?t would conflict
    (work-time ?t - time)              ; allowed meeting start times (09:00..16:30)
    (scheduled ?t - time)              ; a meeting has been scheduled starting at ?t
    (attending ?a - agent ?t - time)   ; agent attends the meeting starting at ?t
  )

  ; The schedule action requires that every listed participant is free at the chosen start time.
  ; The action takes the time and the five participants (as parameters) and produces scheduled/attending facts.
  (:action schedule
    :parameters (?t - time
                 ?s - agent   ; Stephen
                 ?e - agent   ; Elijah
                 ?w - agent   ; William
                 ?j - agent   ; Jeremy
                 ?ti - agent) ; Timothy
    :precondition (and
      (work-time ?t)
      (free ?s ?t)
      (free ?e ?t)
      (free ?w ?t)
      (free ?j ?t)
      (free ?ti ?t)
    )
    :effect (and
      (scheduled ?t)
      (attending ?s ?t)
      (attending ?e ?t)
      (attending ?w ?t)
      (attending ?j ?t)
      (attending ?ti ?t)
    )
  )
)