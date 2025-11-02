(define (domain integrated-meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :existential-preconditions :universal-preconditions :conditional-effects :adl)
  (:types person slot)

  (:predicates
    ;; availability predicates (we include both kinds used in the inputs)
    (busy ?p - person ?s - slot)        ; person is known busy at slot
    (free ?p - person ?s - slot)        ; explicit free facts (may be unused)
    (work-slot ?s - slot)               ; slot is within Monday 09:00-17:00 start times

    ;; canonical meeting predicates (goal will use these)
    (scheduled)                         ; a meeting has been scheduled (global marker)
    (meeting-at ?s - slot)              ; meeting scheduled at a particular slot
    (attends ?p - person ?s - slot)     ; person attends meeting at slot
  )

  ;; We keep an explicit, separate scheduling action per agent (actions are distinct).
  ;; Each action only requires the agent's known availability constraint (as provided
  ;; by that agent) and the global "not (scheduled)" guard. When applied, the action
  ;; declares the meeting scheduled at the chosen slot and (via a universal effect)
  ;; records that all person objects attend at that slot.
  ;; This keeps each participant's scheduling action distinct while ensuring a single
  ;; canonical outcome (scheduled + attends for all persons).

  ;; Ronald's scheduling action (based on agent 1 information: Ronald is free all day).
  (:action schedule_by_ronald
    :parameters (?s - slot)
    :precondition (and
      (work-slot ?s)
      (not (busy ronald ?s))    ; Ronald known free the whole day (no busy facts)
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
      (forall (?p - person) (attends ?p ?s))
    )
  )

  ;; Stephen's scheduling action (based on agent 2: Stephen busy at certain slots).
  (:action schedule_by_stephen
    :parameters (?s - slot)
    :precondition (and
      (work-slot ?s)
      (not (busy stephen ?s))  ; respects Stephen's known busy times
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
      (forall (?p - person) (attends ?p ?s))
    )
  )

  ;; Brittany's scheduling action (agent 3: Brittany has specific busy slots).
  (:action schedule_by_brittany
    :parameters (?s - slot)
    :precondition (and
      (work-slot ?s)
      (not (busy brittany ?s))
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
      (forall (?p - person) (attends ?p ?s))
    )
  )

  ;; Dorothy's scheduling action (agent 4: Dorothy has a small set of known free slots).
  (:action schedule_by_dorothy
    :parameters (?s - slot)
    :precondition (and
      (work-slot ?s)
      (not (busy dorothy ?s))  ; we encode Dorothy's availability through busy facts
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
      (forall (?p - person) (attends ?p ?s))
    )
  )

  ;; Rebecca's scheduling action (agent 5: Rebecca has many busy slots).
  (:action schedule_by_rebecca
    :parameters (?s - slot)
    :precondition (and
      (work-slot ?s)
      (not (busy rebecca ?s))
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
      (forall (?p - person) (attends ?p ?s))
    )
  )

  ;; Jordan's scheduling action (agent 6: Jordan has known busy slots).
  (:action schedule_by_jordan
    :parameters (?s - slot)
    :precondition (and
      (work-slot ?s)
      (not (busy jordan ?s))
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
      (forall (?p - person) (attends ?p ?s))
    )
  )

  ;; Note: We intentionally kept one scheduling action per reporting agent.
  ;; Each action uses the canonical attends and scheduled predicates so any of them
  ;; can successfully produce the same canonical outcome (one scheduled meeting
  ;; with all participants attending) when their local availability constraint allows it.
)