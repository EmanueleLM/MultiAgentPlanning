(define (domain meeting-scheduling-multiagent)
  (:requirements :typing :strips)
  (:types agent slot)
  (:predicates
    (available ?a - agent ?s - slot)    ; agent is available at slot
    (approved ?a - agent ?s - slot)     ; agent approved the slot
    (scheduled ?s - slot)               ; meeting scheduled at slot
    (meeting-scheduled)                 ; meeting has been scheduled (any slot)
  )

  ;; Margaret's approval action (distinct)
  (:action margaret-approve
    :parameters (?s - slot)
    :precondition (available margaret ?s)
    :effect (approved margaret ?s)
  )

  ;; Donna's approval action (distinct)
  (:action donna-approve
    :parameters (?s - slot)
    :precondition (available donna ?s)
    :effect (approved donna ?s)
  )

  ;; Helen's approval action (distinct)
  ;; Helen's private constraints and preference are modeled in the initial state's available facts,
  ;; so her approve action merely requires availability for the chosen slot.
  (:action helen-approve
    :parameters (?s - slot)
    :precondition (available helen ?s)
    :effect (approved helen ?s)
  )

  ;; Final scheduling action requires all three agents to have approved the same slot
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (approved margaret ?s)
      (approved donna ?s)
      (approved helen ?s)
    )
    :effect (and
      (scheduled ?s)
      (meeting-scheduled)
    )
  )
)