(define (domain meeting-scheduling)
  (:requirements :typing)
  (:types person time)
  (:constants david debra kevin - person)

  (:predicates
    (free ?p - person ?t - time)
    (next ?t - time ?t2 - time)
    (unscheduled)
    (meeting-done)
    (scheduled-at ?t - time)
    (scheduled-by ?p - person ?t - time)
  )

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