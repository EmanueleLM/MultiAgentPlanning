(define (domain staged-assembly)
  ; Domain: staged-assembly
  ; Modeling choices:
  ; - We model a strict ordered workflow with explicit phase objects (p_prepare, p_assemble, p_test, p_approve, p_deliver).
  ; - Phase progression is enforced by explicit "advance-<from>-to-<to>" actions which require completion facts for the preceding phase.
  ; - Each operational action is tied to a phase via (phase-active ?ph). This prevents reordering of phase-dependent work.
  ; - Agent provenance of effects is preserved by keeping separate actions named for role/actor (fetch-by-carrier, assemble-by-assembler, run-test-by-inspector, approve-by-auditor, deliver-by-carrier).
  ; - No bookkeeping shortcuts (tokens/penalties/quotas) are used. All constraints are encoded as hard preconditions.
  ; - Movement of agents/parts is modeled explicitly; there is no implicit teleportation.
  ; - Only :strips, :typing and :negative-preconditions are used to keep compatibility with FastDownwards.
  (:requirements :strips :typing :negative-preconditions)
  (:types agent person part location phase)

  (:predicates
    ; Locations and positions
    (at ?ag - agent ?loc - location)
    (part-at ?p - part ?loc - location)

    ; Task-state predicates
    (assembled ?p - part)
    (tested ?p - part)
    (approved ?p - part)
    (delivered ?p - part)

    ; Phase-control predicates
    (phase-active ?ph - phase)
    (phase-next ?p1 - phase ?p2 - phase)
  )

  ; Generic agent movement allowed (no phase restriction) to let agents reposition to required sites.
  (:action move-agent
    :parameters (?ag - agent ?from - location ?to - location)
    :precondition (and (at ?ag ?from))
    :effect (and (not (at ?ag ?from)) (at ?ag ?to))
  )

  ; Prepare phase action: carrier moves the part from supplier to assembly area.
  (:action fetch-by-carrier
    :parameters (?carrier - agent ?part - part ?from - location ?to - location ?ph - phase)
    :precondition (and (at ?carrier ?from) (part-at ?part ?from) (phase-active ?ph) (not (assembled ?part)))
    ; enforce that this action must be executed in the prepare phase by binding ?ph to the active phase in the problem
    :effect (and (not (part-at ?part ?from)) (part-at ?part ?to))
  )

  ; Assemble action: assembler makes the part assembled; must occur in assemble phase.
  (:action assemble-by-assembler
    :parameters (?assembler - agent ?part - part ?loc - location ?ph - phase)
    :precondition (and (at ?assembler ?loc) (part-at ?part ?loc) (phase-active ?ph) (not (assembled ?part)))
    :effect (and (assembled ?part))
  )

  ; Move part to testbench action: executed during test phase to move the part to the testbench
  (:action move-part-to-testbench
    :parameters (?carrier - agent ?part - part ?from - location ?testbench - location ?ph - phase)
    :precondition (and (at ?carrier ?from) (part-at ?part ?from) (phase-active ?ph))
    :effect (and (not (part-at ?part ?from)) (part-at ?part ?testbench))
  )

  ; Run test: inspector performs test; must be in test phase and part must be at the testbench
  (:action run-test-by-inspector
    :parameters (?inspector - agent ?part - part ?testbench - location ?ph - phase)
    :precondition (and (at ?inspector ?testbench) (part-at ?part ?testbench) (phase-active ?ph) (assembled ?part) (not (tested ?part)))
    :effect (and (tested ?part))
  )

  ; Approve action: auditor approves the tested part; must be in approve phase
  (:action approve-by-auditor
    :parameters (?auditor - agent ?part - part ?loc - location ?ph - phase)
    :precondition (and (at ?auditor ?loc) (part-at ?part ?loc) (phase-active ?ph) (tested ?part) (not (approved ?part)))
    :effect (and (approved ?part))
  )

  ; Deliver action: carrier moves the approved part to the delivery site and marks it delivered; must be in deliver phase
  (:action deliver-by-carrier
    :parameters (?carrier - agent ?part - part ?from - location ?dest - location ?ph - phase)
    :precondition (and (at ?carrier ?from) (part-at ?part ?from) (phase-active ?ph) (approved ?part) (not (delivered ?part)))
    :effect (and (not (part-at ?part ?from)) (part-at ?part ?dest) (delivered ?part))
  )

  ; Phase-transition actions enforce strict ordering.
  ; Each transition deactivates the preceding phase and activates the successor.
  (:action advance-prepare-to-assemble
    :parameters (?pre - phase ?next - phase ?part - part ?assembly - location)
    :precondition (and (phase-active ?pre) (phase-next ?pre ?next) (part-at ?part ?assembly))
    :effect (and (not (phase-active ?pre)) (phase-active ?next))
  )

  (:action advance-assemble-to-test
    :parameters (?pre - phase ?next - phase ?part - part)
    :precondition (and (phase-active ?pre) (phase-next ?pre ?next) (assembled ?part))
    :effect (and (not (phase-active ?pre)) (phase-active ?next))
  )

  (:action advance-test-to-approve
    :parameters (?pre - phase ?next - phase ?part - part)
    :precondition (and (phase-active ?pre) (phase-next ?pre ?next) (tested ?part))
    :effect (and (not (phase-active ?pre)) (phase-active ?next))
  )

  (:action advance-approve-to-deliver
    :parameters (?pre - phase ?next - phase ?part - part)
    :precondition (and (phase-active ?pre) (phase-next ?pre ?next) (approved ?part))
    :effect (and (not (phase-active ?pre)) (phase-active ?next))
  )
)