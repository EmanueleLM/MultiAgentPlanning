(define (domain integrated-meeting-scheduling)
  (:requirements :typing :negative-preconditions :fluents :numeric-fluents)
  (:types participant slot)

  (:predicates
    ;; basic objects
    (slot ?s - slot)
    (participant ?p - participant)

    ;; availability / occupancy
    (busy ?p - participant ?s - slot)    ;; explicit known busy facts
    (free ?p - participant ?s - slot)    ;; explicit free facts (from agents)
    (occupied ?s - slot)                 ;; slot already used by some scheduling action
    (unscheduled)                        ;; no meeting scheduled yet
    (scheduled)                          ;; a meeting has been scheduled

    ;; meeting annotations (keeps agent predicates distinct where they originated)
    (meeting-scheduled ?p1 - participant ?p2 - participant ?s - slot) ;; from agent1 semantics (pairwise)
    (meeting-with ?p - participant)    ;; from agent2 semantics (who participates)
    (meeting-at ?s - slot)             ;; from agent2/agent3 semantics (where meeting is)
    (preferred ?p - participant ?s - slot) ;; preferences from agent1 (if any)

    ;; preference marker (agent3)
    (early ?s - slot)
  )

  (:functions
    (total-cost)  ;; numeric cost aggregated by agent3 actions
  )

  ;; === Actions from Agent 1 (originally: schedule / schedule-preferred)
  ;; Keep action names distinct and require global unscheduled to avoid multiple bookings.

  (:action schedule_agent1
    :parameters (?p1 - participant ?p2 - participant ?s - slot)
    :precondition (and
      (slot ?s)
      (participant ?p1) (participant ?p2)
      (unscheduled)
      ;; respect known busy constraints
      (not (busy ?p1 ?s)) (not (busy ?p2 ?s))
      ;; slot must not already be occupied
      (not (occupied ?s))
    )
    :effect (and
      (occupied ?s)
      (meeting-scheduled ?p1 ?p2 ?s)
      (meeting-at ?s)
      (meeting-with ?p1) (meeting-with ?p2)
      (scheduled)
      (not (unscheduled))
    )
  )

  ;; Two variants of "preferred scheduling" to avoid requiring disjunctive preconditions:
  (:action schedule_preferred_agent1_p1pref
    :parameters (?p1 - participant ?p2 - participant ?s - slot)
    :precondition (and
      (slot ?s)
      (participant ?p1) (participant ?p2)
      (unscheduled)
      (preferred ?p1 ?s)
      (not (busy ?p1 ?s)) (not (busy ?p2 ?s))
      (not (occupied ?s))
    )
    :effect (and
      (occupied ?s)
      (meeting-scheduled ?p1 ?p2 ?s)
      (meeting-at ?s)
      (meeting-with ?p1) (meeting-with ?p2)
      (scheduled)
      (not (unscheduled))
    )
  )

  (:action schedule_preferred_agent1_p2pref
    :parameters (?p1 - participant ?p2 - participant ?s - slot)
    :precondition (and
      (slot ?s)
      (participant ?p1) (participant ?p2)
      (unscheduled)
      (preferred ?p2 ?s)
      (not (busy ?p1 ?s)) (not (busy ?p2 ?s))
      (not (occupied ?s))
    )
    :effect (and
      (occupied ?s)
      (meeting-scheduled ?p1 ?p2 ?s)
      (meeting-at ?s)
      (meeting-with ?p1) (meeting-with ?p2)
      (scheduled)
      (not (unscheduled))
    )
  )

  ;; === Action from Agent 2 (originally: schedule with free predicates)
  ;; We keep the action separate and also enforce "not (busy ...)" checks so the
  ;; integrated model respects busy facts coming from other agents.
  (:action schedule_agent2
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (unscheduled)
      (free peter ?s) (free ralph ?s) (free daniel ?s)
      ;; ensure compatibility with explicit busy facts from other agents
      (not (busy peter ?s)) (not (busy ralph ?s)) (not (busy daniel ?s))
      (not (occupied ?s))
    )
    :effect (and
      (not (unscheduled))
      (scheduled)
      (meeting-at ?s)
      ;; record meeting participants as per agent2's idea
      (meeting-with peter)
      (meeting-with ralph)
      (meeting-with daniel)
      (occupied ?s)
      ;; for interoperability with agent1 pairwise predicate, add pairwise facts
      (meeting-scheduled peter ralph ?s)
      (meeting-scheduled peter daniel ?s)
      (meeting-scheduled ralph daniel ?s)
    )
  )

  ;; === Actions from Agent 3 (early / late), keep names distinct and
  ;; respect unscheduled / busy / occupied checks.
  (:action schedule_early_agent3
    :parameters (?s - slot)
    :precondition (and
      (early ?s)
      (unscheduled)
      (slot ?s)
      (not (occupied ?s))
      (not (busy daniel ?s))
      (not (busy ralph ?s))
      (not (busy peter ?s))
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
      (meeting-with daniel) (meeting-with ralph) (meeting-with peter)
      (occupied ?s)
      ;; pairwise markers to interoperate
      (meeting-scheduled daniel ralph ?s)
      (meeting-scheduled daniel peter ?s)
      (meeting-scheduled ralph peter ?s)
      (not (unscheduled))
      (increase (total-cost) 0)
    )
  )

  (:action schedule_late_agent3
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (unscheduled)
      (not (early ?s))
      (not (occupied ?s))
      (not (busy daniel ?s))
      (not (busy ralph ?s))
      (not (busy peter ?s))
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
      (meeting-with daniel) (meeting-with ralph) (meeting-with peter)
      (occupied ?s)
      (meeting-scheduled daniel ralph ?s)
      (meeting-scheduled daniel peter ?s)
      (meeting-scheduled ralph peter ?s)
      (not (unscheduled))
      (increase (total-cost) 1)
    )
  )
)