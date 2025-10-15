(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent time)
  (:constants raymond billy donald - agent)
  (:predicates
    (available ?a - agent ?t - time)
    (attending ?a - agent ?t - time)
    (scheduled ?t - time)
  )

  (:action attend-raymond
    :parameters (?t - time)
    :precondition (available raymond ?t)
    :effect (attending raymond ?t)
  )

  (:action attend-billy
    :parameters (?t - time)
    :precondition (available billy ?t)
    :effect (attending billy ?t)
  )

  (:action attend-donald
    :parameters (?t - time)
    :precondition (available donald ?t)
    :effect (attending donald ?t)
  )

  (:action finalize-meeting
    :parameters (?t - time)
    :precondition (and
                    (attending raymond ?t)
                    (attending billy ?t)
                    (attending donald ?t))
    :effect (scheduled ?t)
  )
)