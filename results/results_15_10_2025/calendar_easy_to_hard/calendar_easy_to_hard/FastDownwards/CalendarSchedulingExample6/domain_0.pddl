(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent slot)
  (:predicates
    (free ?a - agent ?s - slot)       ; agent ?a is free during half-hour slot ?s
    (next ?s - slot ?s2 - slot)      ; ?s2 follows ?s (consecutive half-hour)
    (allowed-start ?s - slot)         ; allowed (preferred/earliest) meeting start slot
    (scheduled)                       ; meeting has been scheduled
    (meeting-start ?s - slot)         ; meeting starts at slot ?s
  )

  ;; Schedule action: requires both consecutive half-hour slots to be free for every participant
  (:action schedule
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (next ?s ?s2)
      (allowed-start ?s)
      ;; per-agent availability for both half-hour slots (hard constraints kept distinct)
      (free thomas ?s) (free thomas ?s2)
      (free dylan  ?s) (free dylan  ?s2)
      (free jerry  ?s) (free jerry  ?s2)
    )
    :effect (and
      (scheduled)
      (meeting-start ?s)
    )
  )
)