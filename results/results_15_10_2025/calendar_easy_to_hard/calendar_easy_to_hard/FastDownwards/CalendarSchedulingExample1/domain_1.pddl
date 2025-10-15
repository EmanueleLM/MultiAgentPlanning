(define (domain meeting-scheduling)
  (:requirements :typing)
  (:types agent time)
  (:constants raymond billy donald - agent)
  (:predicates
    (slot ?t - time)
    (avail ?a - agent ?t - time)
    (meeting-scheduled)
    (meeting-at ?t - time)
  )
  (:action schedule-by-raymond
    :parameters (?t - time)
    :precondition (and
                    (slot ?t)
                    (avail raymond ?t)
                    (avail billy ?t)
                    (avail donald ?t)
                  )
    :effect (and
              (meeting-scheduled)
              (meeting-at ?t)
            )
  )
  (:action schedule-by-billy
    :parameters (?t - time)
    :precondition (and
                    (slot ?t)
                    (avail raymond ?t)
                    (avail billy ?t)
                    (avail donald ?t)
                  )
    :effect (and
              (meeting-scheduled)
              (meeting-at ?t)
            )
  )
  (:action schedule-by-donald
    :parameters (?t - time)
    :precondition (and
                    (slot ?t)
                    (avail raymond ?t)
                    (avail billy ?t)
                    (avail donald ?t)
                  )
    :effect (and
              (meeting-scheduled)
              (meeting-at ?t)
            )
  )
)