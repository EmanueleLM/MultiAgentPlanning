(define (domain meeting-domain)
  (:requirements :strips)
  (:predicates
    (agent ?a)
    (slot ?s)
    (free ?a ?s)                ; agent ?a is available for a 30-min meeting starting at ?s
    (accepted ?a ?s)            ; agent ?a has accepted slot ?s
    (meeting-scheduled)         ; meeting has been scheduled
    (scheduled-at ?s)           ; meeting scheduled at slot ?s
  )

  ;; Diana accepts a slot if she is free at that slot
  (:action accept-diana
    :parameters (?s)
    :precondition (and (slot ?s) (free diana ?s) (not (accepted diana ?s)))
    :effect (and (accepted diana ?s))
  )

  ;; Ethan accepts a slot if he is free at that slot
  (:action accept-ethan
    :parameters (?s)
    :precondition (and (slot ?s) (free ethan ?s) (not (accepted ethan ?s)))
    :effect (and (accepted ethan ?s))
  )

  ;; Janet accepts a slot if she is free at that slot
  (:action accept-janet
    :parameters (?s)
    :precondition (and (slot ?s) (free janet ?s) (not (accepted janet ?s)))
    :effect (and (accepted janet ?s))
  )

  ;; Finalize the meeting once all three agents have accepted the same slot
  (:action finalize-meeting
    :parameters (?s)
    :precondition (and (slot ?s) (accepted diana ?s) (accepted ethan ?s) (accepted janet ?s) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (scheduled-at ?s))
  )
)