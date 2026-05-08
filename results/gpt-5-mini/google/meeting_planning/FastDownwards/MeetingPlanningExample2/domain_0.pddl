(define (domain orchestrator)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types person loc slot)

  (:predicates
    (agent-at ?l - loc)
    (pref-loc ?p - person ?l - loc)
    (person-available ?p - person ?s - slot)
    (free ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (current-slot ?s - slot)
    (met ?p - person)
    (done-person ?p - person)
  )

  (:functions (total-cost))

  ;; Travel consumes one slot: must start at the current slot, that slot must be free.
  (:action travel
    :parameters (?from - loc ?to - loc ?s - slot ?snext - slot)
    :precondition (and
      (agent-at ?from)
      (current-slot ?s)
      (free ?s)
      (next ?s ?snext)
      (not (= ?from ?to))
    )
    :effect (and
      (not (agent-at ?from))
      (agent-at ?to)
      (not (free ?s))
      (not (current-slot ?s))
      (current-slot ?snext)
      ;; travel has no direct cost; meetings vs skips drive optimization
    )
  )

  ;; Start a 1-slot meeting (for persons whose meeting duration is 1 slot)
  (:action start-meeting-1
    :parameters (?p - person ?loc - loc ?s - slot ?snext - slot)
    :precondition (and
      (pref-loc ?p ?loc)
      (agent-at ?loc)
      (current-slot ?s)
      (free ?s)
      (person-available ?p ?s)
      (next ?s ?snext)
      (not (met ?p))
    )
    :effect (and
      (not (free ?s))
      (met ?p)
      (done-person ?p)
      (not (current-slot ?s))
      (current-slot ?snext)
    )
  )

  ;; Start a 2-slot meeting
  (:action start-meeting-2
    :parameters (?p - person ?loc - loc ?s - slot ?s1 - slot ?snext - slot)
    :precondition (and
      (pref-loc ?p ?loc)
      (agent-at ?loc)
      (current-slot ?s)
      (free ?s)
      (free ?s1)
      (person-available ?p ?s)
      (person-available ?p ?s1)
      (next ?s ?s1)
      (next ?s1 ?snext)
      (not (met ?p))
    )
    :effect (and
      (not (free ?s))
      (not (free ?s1))
      (met ?p)
      (done-person ?p)
      (not (current-slot ?s))
      (current-slot ?snext)
    )
  )

  ;; Start a 6-slot meeting: required for Jessica's minimum 90 contiguous minutes (6 * 15min slots)
  (:action start-meeting-6
    :parameters (?p - person ?loc
                 ?s - slot ?s1 - slot ?s2 - slot ?s3 - slot ?s4 - slot ?s5 - slot ?snext - slot)
    :precondition (and
      (pref-loc ?p ?loc)
      (agent-at ?loc)
      (current-slot ?s)
      (free ?s) (free ?s1) (free ?s2) (free ?s3) (free ?s4) (free ?s5)
      (person-available ?p ?s) (person-available ?p ?s1) (person-available ?p ?s2)
      (person-available ?p ?s3) (person-available ?p ?s4) (person-available ?p ?s5)
      (next ?s ?s1) (next ?s1 ?s2) (next ?s2 ?s3) (next ?s3 ?s4) (next ?s4 ?s5) (next ?s5 ?snext)
      (not (met ?p))
    )
    :effect (and
      (not (free ?s)) (not (free ?s1)) (not (free ?s2))
      (not (free ?s3)) (not (free ?s4)) (not (free ?s5))
      (met ?p)
      (done-person ?p)
      (not (current-slot ?s))
      (current-slot ?snext)
    )
  )

  ;; Explicit skip action: if the planner decides not to meet a person, it must take this action to satisfy the "done" contract.
  ;; This action increases total-cost by 1; planner will prefer meeting actions (cost 0) when feasible.
  (:action skip-person
    :parameters (?p - person ?s - slot)
    :precondition (and
      (current-slot ?s)
      (not (done-person ?p))
    )
    :effect (and
      (done-person ?p)
      (increase (total-cost) 1)
    )
  )
)