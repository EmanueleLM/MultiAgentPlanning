(define (domain meeting-scheduling)
  (:requirements :typing)
  (:types person time)

  (:predicates
    (free ?p - person ?t - time)
    (next ?t - time ?t2 - time)
    (unscheduled)
    (meeting-done)
    (scheduled-at ?t - time)
    (scheduled-by ?p - person ?t - time)
  )

  ;; David proposes/schedules a meeting at a given start time (two consecutive half-hour slots)
  (:action schedule-by-david
    :parameters (?t - time ?tnext - time)
    :precondition (and
                    (unscheduled)
                    (next ?t ?tnext)
                    (free david ?t) (free david ?tnext)
                    (free debra ?t) (free debra ?tnext)
                    (free kevin ?t) (free kevin ?tnext)
                  )
    :effect (and
              (not (unscheduled))
              (meeting-done)
              (scheduled-at ?t)
              (scheduled-by david ?t)
            )
  )

  ;; Debra proposes/schedules
  (:action schedule-by-debra
    :parameters (?t - time ?tnext - time)
    :precondition (and
                    (unscheduled)
                    (next ?t ?tnext)
                    (free david ?t) (free david ?tnext)
                    (free debra ?t) (free debra ?tnext)
                    (free kevin ?t) (free kevin ?tnext)
                  )
    :effect (and
              (not (unscheduled))
              (meeting-done)
              (scheduled-at ?t)
              (scheduled-by debra ?t)
            )
  )

  ;; Kevin proposes/schedules
  (:action schedule-by-kevin
    :parameters (?t - time ?tnext - time)
    :precondition (and
                    (unscheduled)
                    (next ?t ?tnext)
                    (free david ?t) (free david ?tnext)
                    (free debra ?t) (free debra ?tnext)
                    (free kevin ?t) (free kevin ?tnext)
                  )
    :effect (and
              (not (unscheduled))
              (meeting-done)
              (scheduled-at ?t)
              (scheduled-by kevin ?t)
            )
  )
)