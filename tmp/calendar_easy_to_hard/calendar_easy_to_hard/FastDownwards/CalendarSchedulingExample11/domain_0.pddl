(define (domain integrated-meeting-scheduler)
  (:requirements :typing :negative-preconditions)
  (:types person timeslot)

  ;; Predicates coming from all three agents' knowledge
  (:predicates
    (free ?p - person ?t - timeslot)        ; agent1's notion of free
    (busy ?p - person ?t - timeslot)        ; agent2's notion of busy
    (available ?p - person ?t - timeslot)   ; agent3's notion of available
    (within-work ?t - timeslot)             ; agent2: within work hours
    (meeting-scheduled)                     ; a meeting has been scheduled
    (meeting-at ?t - timeslot)              ; meeting scheduled at timeslot
    (attending ?p - person)                 ; agent2 marks attending participants
  )

  ;; Action from Agent 1 (kept distinct). Uses agent1's "free" facts.
  (:action schedule_by_agent1
    :parameters (?t - timeslot)
    :precondition (and
      (free alexander ?t)
      (free elizabeth ?t)
      (free walter ?t)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      ;; Agent1 originally only set a meeting-scheduled flag; preserve that behavior.
    )
  )

  ;; Action from Agent 2 (kept distinct). Uses agent2's "busy" and "within-work" facts,
  ;; and also asserts attending facts as in agent2's original design.
  (:action schedule_by_agent2
    :parameters (?t - timeslot)
    :precondition (and
      (within-work ?t)
      (not (busy alexander ?t))
      (not (busy elizabeth ?t))
      (not (busy walter ?t))
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (attending alexander)
      (attending elizabeth)
      (attending walter)
    )
  )

  ;; Action from Agent 3 (kept distinct). Uses agent3's "available" facts.
  (:action schedule_by_agent3
    :parameters (?t - timeslot)
    :precondition (and
      (available alexander ?t)
      (available elizabeth ?t)
      (available walter ?t)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
    )
  )

  ;; Integrated scheduling action that enforces all agents' constraints together.
  ;; This action requires:
  ;;  - a timeslot within work hours,
  ;;  - agent1's free facts for each participant (where provided),
  ;;  - agent3's available facts for each participant (where provided),
  ;;  - agent2's not-busy constraints for participants (where provided),
  ;;  - and that no meeting is scheduled yet.
  ;; The effect is a single meeting scheduled at that timeslot and attending facts
  ;; so goals coming from any agent's problem are satisfied.
  (:action integrated_schedule
    :parameters (?t - timeslot)
    :precondition (and
      (within-work ?t)

      ;; Agent1 constraints (free) - where agent1 provided availability info
      (free alexander ?t)
      (free elizabeth ?t)
      (free walter ?t)

      ;; Agent3 constraints (available)
      (available alexander ?t)
      (available elizabeth ?t)
      (available walter ?t)

      ;; Agent2 constraints (not busy) - ensure not in known busy slots
      (not (busy alexander ?t))
      (not (busy elizabeth ?t))
      (not (busy walter ?t))

      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (attending alexander)
      (attending elizabeth)
      (attending walter)
    )
  )
)