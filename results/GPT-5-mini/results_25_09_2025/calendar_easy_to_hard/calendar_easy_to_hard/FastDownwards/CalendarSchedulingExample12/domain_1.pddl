(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent time)
  (:constants david debra kevin - agent)

  (:predicates
    (time ?t - time)
    (next ?t1 - time ?t2 - time)
    (free ?a - agent ?t - time)
    (attending ?a - agent ?t - time)
    (meeting-scheduled)
    (meeting-start ?t - time)
  )

  (:action attend-david
    :parameters (?t - time ?t2 - time)
    :precondition (and (next ?t ?t2) (free david ?t) (free david ?t2))
    :effect (and (attending david ?t)
                 (not (free david ?t))
                 (not (free david ?t2)))
  )

  (:action attend-debra
    :parameters (?t - time ?t2 - time)
    :precondition (and (next ?t ?t2) (free debra ?t) (free debra ?t2))
    :effect (and (attending debra ?t)
                 (not (free debra ?t))
                 (not (free debra ?t2)))
  )

  (:action attend-kevin
    :parameters (?t - time ?t2 - time)
    :precondition (and (next ?t ?t2) (free kevin ?t) (free kevin ?t2))
    :effect (and (attending kevin ?t)
                 (not (free kevin ?t))
                 (not (free kevin ?t2)))
  )

  (:action confirm-meeting
    :parameters (?t - time)
    :precondition (and (attending david ?t) (attending debra ?t) (attending kevin ?t))
    :effect (and (meeting-scheduled) (meeting-start ?t))
  )
)