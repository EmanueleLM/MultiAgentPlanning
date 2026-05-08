(define (domain sequential-assembly)
  ; Requirements limited for FastDownward compatibility
  (:requirements :strips :typing :negative-preconditions)

  ; Types
  (:types agent phase location)

  ; Predicates
  ; at ?ag ?loc        - agent ?ag is physically at location ?loc
  ; prepared ?loc      - location ?loc has been prepared (phase 1 done)
  ; assembled ?loc     - product assembled at ?loc (phase 2 done)
  ; tested ?loc        - product tested at ?loc (phase 3 done)
  ; approved ?loc      - auditor approved at ?loc (phase 4 done)
  ; deployed ?loc      - deployment completed at ?loc (final terminal step)
  ; current-phase ?p   - the system is currently at phase ?p (enforces ordering)
  ; phase-next ?p1 ?p2 - p2 is the immediate successor phase of p1
  ; prepared-by ?ag ?loc  - provenance: who prepared ?loc
  ; assembled-by ?ag ?loc - provenance: who assembled ?loc
  ; tested-by ?ag ?loc    - provenance: who tested ?loc
  ; approved-by ?ag ?loc  - provenance: who approved ?loc
  ; deployed-by ?ag ?loc  - provenance: who deployed ?loc
  (:predicates
    (at ?ag - agent ?loc - location)
    (prepared ?loc - location)
    (assembled ?loc - location)
    (tested ?loc - location)
    (approved ?loc - location)
    (deployed ?loc - location)
    (current-phase ?p - phase)
    (phase-next ?p1 - phase ?p2 - phase)
    (prepared-by ?ag - agent ?loc - location)
    (assembled-by ?ag - agent ?loc - location)
    (tested-by ?ag - agent ?loc - location)
    (approved-by ?ag - agent ?loc - location)
    (deployed-by ?ag - agent ?loc - location)
  )

  ; Modeling decisions (documented here):
  ; - Phases are explicit objects and the single predicate (current-phase ?p) enforces a single active phase.
  ; - Each action that completes a phase advances current-phase to the explicit successor phase via phase-next.
  ; - Actions require the performing agent to be at the target location; no remote or implicit work is allowed.
  ; - Provenance facts (prepared-by, assembled-by, ...) are explicit effects so the planner cannot conflate who caused what.
  ; - No penalty tokens, quotas, or post-hoc fixes are available; constraints are encoded so violating a hard preference is impossible.
  ; - Negative preconditions prevent re-executing a phase step at the same location.
  ; - Sequence ordering is enforced by current-phase and phase-next, preventing reordering.

  ; Action: move an agent between locations (keeps mobility explicit)
  (:action move
    :parameters (?ag - agent ?from - location ?to - location)
    :precondition (and (at ?ag ?from) (not (at ?ag ?to)))
    :effect (and (not (at ?ag ?from)) (at ?ag ?to))
  )

  ; Action: Agent A prepares the site (phase 1 -> phase 2)
  (:action prepare-by-agentA
    :parameters (?ag - agent ?loc - location ?p1 - phase ?p2 - phase)
    :precondition (and
      (at ?ag ?loc)
      (current-phase ?p1)
      (phase-next ?p1 ?p2)
      (not (prepared ?loc))
    )
    :effect (and
      (prepared ?loc)
      (prepared-by ?ag ?loc)
      (not (current-phase ?p1))
      (current-phase ?p2)
    )
  )

  ; Action: Agent B assembles the product (phase 2 -> phase 3)
  (:action assemble-by-agentB
    :parameters (?ag - agent ?loc - location ?p2 - phase ?p3 - phase)
    :precondition (and
      (at ?ag ?loc)
      (current-phase ?p2)
      (phase-next ?p2 ?p3)
      (prepared ?loc)
      (not (assembled ?loc))
    )
    :effect (and
      (assembled ?loc)
      (assembled-by ?ag ?loc)
      (not (current-phase ?p2))
      (current-phase ?p3)
    )
  )

  ; Action: Agent C performs tests (phase 3 -> phase 4)
  (:action test-by-agentC
    :parameters (?ag - agent ?loc - location ?p3 - phase ?p4 - phase)
    :precondition (and
      (at ?ag ?loc)
      (current-phase ?p3)
      (phase-next ?p3 ?p4)
      (assembled ?loc)
      (not (tested ?loc))
    )
    :effect (and
      (tested ?loc)
      (tested-by ?ag ?loc)
      (not (current-phase ?p3))
      (current-phase ?p4)
    )
  )

  ; Action: Auditor performs audit and approves (phase 4 -> phase 5)
  (:action audit-by-auditor
    :parameters (?ag - agent ?loc - location ?p4 - phase ?p5 - phase)
    :precondition (and
      (at ?ag ?loc)
      (current-phase ?p4)
      (phase-next ?p4 ?p5)
      (tested ?loc)
      (not (approved ?loc))
    )
    :effect (and
      (approved ?loc)
      (approved-by ?ag ?loc)
      (not (current-phase ?p4))
      (current-phase ?p5)
    )
  )

  ; Action: Deployer performs deployment (final step; requires phase 5 active)
  (:action deploy-by-deployer
    :parameters (?ag - agent ?loc - location ?p5 - phase)
    :precondition (and
      (at ?ag ?loc)
      (current-phase ?p5)
      (approved ?loc)
      (not (deployed ?loc))
    )
    :effect (and
      (deployed ?loc)
      (deployed-by ?ag ?loc)
      ; current-phase remains p5 as deploy is final; no further phase successor
    )
  )
)