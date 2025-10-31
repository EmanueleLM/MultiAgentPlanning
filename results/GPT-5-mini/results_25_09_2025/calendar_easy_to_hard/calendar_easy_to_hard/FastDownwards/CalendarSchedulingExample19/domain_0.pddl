(define (domain meeting-orchestrator)
  (:requirements :strips)
  (:predicates
    (slot ?s)
    (next ?s ?s2)                ; consecutive 30-min slots
    (free ?agent ?s)             ; agent is free in slot ?s (30-min slice)
    (agreed ?agent ?start)       ; agent agreed to a meeting starting at ?start (covers start and next)
    (meeting-scheduled ?start)
  )

  ;; Stephen's action to agree to a candidate 60-minute meeting (two consecutive slots)
  (:action stephen-agree
    :parameters (?start ?next)
    :precondition (and (slot ?start) (next ?start ?next)
                       (free stephen ?start) (free stephen ?next))
    :effect (and (agreed stephen ?start))
  )

  ;; Edward's action to agree to a candidate 60-minute meeting (two consecutive slots)
  (:action edward-agree
    :parameters (?start ?next)
    :precondition (and (slot ?start) (next ?start ?next)
                       (free edward ?start) (free edward ?next))
    :effect (and (agreed edward ?start))
  )

  ;; Angela's action to agree to a candidate 60-minute meeting (two consecutive slots)
  (:action angela-agree
    :parameters (?start ?next)
    :precondition (and (slot ?start) (next ?start ?next)
                       (free angela ?start) (free angela ?next))
    :effect (and (agreed angela ?start))
  )

  ;; Final scheduling action that requires all agents to have agreed on the same start
  (:action schedule-meeting
    :parameters (?start)
    :precondition (and (agreed stephen ?start) (agreed edward ?start) (agreed angela ?start))
    :effect (and (meeting-scheduled ?start))
  )
)