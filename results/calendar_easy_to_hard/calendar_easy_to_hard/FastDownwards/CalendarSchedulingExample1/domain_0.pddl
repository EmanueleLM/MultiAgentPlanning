(define (domain meeting-scheduling)
  (:requirements :typing)
  (:types agent time)

  (:predicates
    (slot ?t - time)
    (avail ?a - agent ?t - time)
    (meeting-scheduled)
    (meeting-at ?t - time)
  )

  ;; Three distinct agent-driven scheduling actions (semantically identical;
  ;; kept distinct per agent as required). Each schedules a 30-minute meeting
  ;; at a specific half-hour time step, requiring all participants to be available.
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