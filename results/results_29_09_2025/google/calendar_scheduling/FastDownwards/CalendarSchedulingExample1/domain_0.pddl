(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent time)
  (:predicates
    (available ?a - agent ?t - time)
    (attending ?a - agent ?t - time)
    (scheduled ?t - time)
  )

  ;; Agent-specific actions to register attendance at a time slot
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

  ;; Finalize the meeting once all participants have "attended" the slot
  (:action finalize-meeting
    :parameters (?t - time)
    :precondition (and
                    (attending raymond ?t)
                    (attending billy ?t)
                    (attending donald ?t))
    :effect (scheduled ?t)
  )
)