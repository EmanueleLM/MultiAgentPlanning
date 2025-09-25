(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent time)

  (:predicates
    (time ?t - time)
    (next ?t1 - time ?t2 - time)
    (free ?a - agent ?t - time)           ; agent is free for the 30-min slot starting at ?t
    (attending ?a - agent ?t - time)      ; agent has committed to attend a meeting starting at ?t (consumes two consecutive slots)
    (meeting-scheduled)                   ; a meeting has been scheduled (global flag)
    (meeting-start ?t - time)             ; records the chosen meeting start time
  )

  ; David's attend action (consumes two consecutive 30-min slots)
  (:action attend-david
    :parameters (?t - time ?t2 - time)
    :precondition (and (next ?t ?t2) (free david ?t) (free david ?t2))
    :effect (and (attending david ?t)
                 (not (free david ?t))
                 (not (free david ?t2)))
  )

  ; Debra's attend action (consumes two consecutive 30-min slots)
  (:action attend-debra
    :parameters (?t - time ?t2 - time)
    :precondition (and (next ?t ?t2) (free debra ?t) (free debra ?t2))
    :effect (and (attending debra ?t)
                 (not (free debra ?t))
                 (not (free debra ?t2)))
  )

  ; Kevin's attend action (consumes two consecutive 30-min slots)
  (:action attend-kevin
    :parameters (?t - time ?t2 - time)
    :precondition (and (next ?t ?t2) (free kevin ?t) (free kevin ?t2))
    :effect (and (attending kevin ?t)
                 (not (free kevin ?t))
                 (not (free kevin ?t2)))
  )

  ; Confirm a meeting when all three agents have committed to the same start time
  (:action confirm-meeting
    :parameters (?t - time)
    :precondition (and (attending david ?t) (attending debra ?t) (attending kevin ?t))
    :effect (and (meeting-scheduled) (meeting-start ?t))
  )
)