(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent slot)
  (:predicates
    (free ?a - agent ?s - slot)        ; agent is free for 30-min slot
    (next ?s1 - slot ?s2 - slot)      ; consecutive 30-min slots: s1 immediately before s2
    (claimed-theresa ?s - slot)       ; theresa claims a 60-min meeting starting at slot ?s (covers ?s and next ?s)
    (claimed-charles ?s - slot)       ; charles claims ...
    (claimed-betty ?s - slot)         ; betty claims ...
    (meeting-scheduled ?s - slot)     ; meeting scheduled starting at slot ?s (covers ?s and next ?s)
  )

  ;; Theresa's action to declare she can attend a meeting starting at slot ?s (requires both ?s and next ?s free)
  (:action claim-theresa
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (free theresa ?s) (free theresa ?s2) (next ?s ?s2))
    :effect (claimed-theresa ?s)
  )

  ;; Charles's action
  (:action claim-charles
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (free charles ?s) (free charles ?s2) (next ?s ?s2))
    :effect (claimed-charles ?s)
  )

  ;; Betty's action
  (:action claim-betty
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (free betty ?s) (free betty ?s2) (next ?s ?s2))
    :effect (claimed-betty ?s)
  )

  ;; When all three have claimed the same start slot, schedule the meeting
  (:action confirm-meeting
    :parameters (?s - slot)
    :precondition (and (claimed-theresa ?s) (claimed-charles ?s) (claimed-betty ?s))
    :effect (meeting-scheduled ?s)
  )
)