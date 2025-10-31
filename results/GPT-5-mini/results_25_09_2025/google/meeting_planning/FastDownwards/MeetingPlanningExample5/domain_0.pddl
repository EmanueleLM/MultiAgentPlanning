(define (domain meeting-orchestration)
  (:requirements :typing :fluents :negative-preconditions :strips)
  (:types agent location)

  (:predicates
    (at ?a - agent ?l - location)
    (meeting-scheduled)
  )

  (:functions
    (current-time)                 ; numeric current time
    (total-cost)                   ; visitor accumulated travel cost (objective)
    (meeting-duration)             ; required meeting duration
    (avail-start ?a - agent)       ; agent availability window start
    (avail-end ?a - agent)         ; agent availability window end
    (travel-time ?a - agent ?from - location ?to - location) ; travel durations
  )

  ;; Agent A travel action (namespaced)
  (:action agentA_travel
    :parameters (?from - location ?to - location ?a - agent)
    :precondition (and
      (at ?a ?from)
      ;; Ensure agent A's window remains long enough to cover the travel and current time
      (>= (avail-end ?a) (+ (current-time) (travel-time ?a ?from ?to)))
      ;; Optionally ensure current time is within availability; allow travel to begin at or after start
      (>= (current-time) (avail-start ?a))
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      ;; advance time by travel duration
      (assign (current-time) (+ (current-time) (travel-time ?a ?from ?to)))
      ;; accumulate visitor travel cost (we treat agentA as the visitor for optimization)
      (assign (total-cost) (+ (total-cost) (travel-time ?a ?from ?to)))
    )
  )

  ;; Agent B travel action (namespaced)
  (:action agentB_travel
    :parameters (?from - location ?to - location ?b - agent)
    :precondition (and
      (at ?b ?from)
      (>= (avail-end ?b) (+ (current-time) (travel-time ?b ?from ?to)))
      (>= (current-time) (avail-start ?b))
    )
    :effect (and
      (not (at ?b ?from))
      (at ?b ?to)
      (assign (current-time) (+ (current-time) (travel-time ?b ?from ?to)))
      ;; Agent B travel does NOT add to total-cost (visitor objective focuses on agentA)
    )
  )

  ;; Optional wait actions for each agent to advance time without moving
  (:action agentA_wait
    :parameters (?dt - number ?a - agent)
    :precondition (and
      (>= (+ (current-time) ?dt) (current-time))
      (>= (avail-end ?a) (+ (current-time) ?dt))
      (>= (current-time) (avail-start ?a))
    )
    :effect (and
      (assign (current-time) (+ (current-time) ?dt))
    )
  )

  (:action agentB_wait
    :parameters (?dt - number ?b - agent)
    :precondition (and
      (>= (+ (current-time) ?dt) (current-time))
      (>= (avail-end ?b) (+ (current-time) ?dt))
      (>= (current-time) (avail-start ?b))
    )
    :effect (and
      (assign (current-time) (+ (current-time) ?dt))
    )
  )

  ;; Orchestrator action to start the meeting when both agents are co-located and both can support the meeting
  (:action orchestrator_start_meeting
    :parameters (?loc - location ?a - agent ?b - agent)
    :precondition (and
      (at ?a ?loc)
      (at ?b ?loc)
      ;; The full meeting must fit in both agents' remaining availability windows
      (<= (+ (current-time) (meeting-duration)) (avail-end ?a))
      (<= (+ (current-time) (meeting-duration)) (avail-end ?b))
      ;; Meeting should start no earlier than each agent's available start
      (>= (current-time) (avail-start ?a))
      (>= (current-time) (avail-start ?b))
    )
    :effect (and
      (assign (current-time) (+ (current-time) (meeting-duration)))
      (meeting-scheduled)
    )
  )
)