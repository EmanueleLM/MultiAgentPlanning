(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent slot)

  (:predicates
    (free ?a - agent ?s - slot)           ; agent is free for this 30-min slot
    (next ?s1 - slot ?s2 - slot)          ; s2 immediately follows s1 (30 min later)
    (confirmed-bobby ?s - slot)           ; bobby confirmed a meeting starting at ?s (needs ?s and next ?s2)
    (confirmed-scott ?s - slot)           ; scott confirmed ...
    (confirmed-kimberly ?s - slot)        ; kimberly confirmed ...
    (meeting-scheduled)                   ; global flag that meeting (one hour) has been scheduled
  )

  ;; Bobby's confirmation action (distinct)
  (:action confirm-bobby
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (next ?s ?s2) (free bobby ?s) (free bobby ?s2))
    :effect (and (confirmed-bobby ?s))
  )

  ;; Scott's confirmation action (distinct)
  (:action confirm-scott
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (next ?s ?s2) (free scott ?s) (free scott ?s2))
    :effect (and (confirmed-scott ?s))
  )

  ;; Kimberly's confirmation action (distinct)
  (:action confirm-kimberly
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (next ?s ?s2) (free kimberly ?s) (free kimberly ?s2))
    :effect (and (confirmed-kimberly ?s))
  )

  ;; Finalize meeting: requires all three to have confirmed the same start slot
  (:action finalize-meeting
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (next ?s ?s2) (confirmed-bobby ?s) (confirmed-scott ?s) (confirmed-kimberly ?s))
    :effect (and (meeting-scheduled))
  )
)