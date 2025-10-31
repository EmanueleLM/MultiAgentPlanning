(define (domain meeting-orchestration)
  (:requirements :typing :strips)
  (:types person slot)
  (:predicates
    (current ?s - slot)                       ; current timeslot pointer (for scheduler agent)
    (next ?s1 - slot ?s2 - slot)              ; ordering between slots
    (available ?p - person ?s - slot)         ; person ?p is available at slot ?s
    (scheduled ?s - slot)                     ; meeting is scheduled at slot ?s
    (attendee ?p - person ?s - slot)          ; person ?p will attend meeting at slot ?s
    (meeting-scheduled)                       ; global flag: meeting has been scheduled
  )

  ;; Scheduling action from Agent 1 (keeps action distinct)
  (:action schedule-agent1
    :parameters (?s - slot)
    :precondition (and
      (current ?s)
      (available brittany ?s)
      (available emily ?s)
      (available doris ?s)
    )
    :effect (and
      (scheduled ?s)
      (attendee brittany ?s)
      (attendee emily ?s)
      (attendee doris ?s)
      (meeting-scheduled)
    )
  )

  ;; Scheduling action from Agent 2 (keeps action distinct; originally used "current" semantics)
  (:action schedule-agent2
    :parameters (?s - slot)
    :precondition (and
      (current ?s)
      (available brittany ?s)
      (available emily ?s)
      (available doris ?s)
    )
    :effect (and
      (scheduled ?s)
      (attendee brittany ?s)
      (attendee emily ?s)
      (attendee doris ?s)
      (meeting-scheduled)
    )
  )

  ;; Scheduling action from Agent 3 (keeps action distinct)
  (:action schedule-agent3
    :parameters (?s - slot)
    :precondition (and
      (current ?s)
      (available brittany ?s)
      (available emily ?s)
      (available doris ?s)
    )
    :effect (and
      (scheduled ?s)
      (attendee brittany ?s)
      (attendee emily ?s)
      (attendee doris ?s)
      (meeting-scheduled)
    )
  )

  ;; Time-advancing action from Agent 2 (keeps action distinct)
  (:action advance-time
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (current ?s1))
      (current ?s2)
    )
  )
)