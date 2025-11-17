; PDDL Domain: pddl_orchestrator_domain
; Assumptions (audited/corrected facts are encoded in the problem file below):
; - Two parts exist: part1 and part2. The auditor's audit corrected the initial location of part2 to loc_workstation.
; - There are five ordered phases: p1_prepare -> p2_process -> p3_inspect -> p4_correct -> p5_done.
; - All ordering/contiguity constraints are enforced by explicit phase_ready markers and phase_successor links.
; - This domain includes domain-level constants for the concrete objects used in the audited problem to allow strict checks
;   (these constants are listed here for clarity; the problem also declares the same objects).
; - No penalty/shortfall constructs are used; all preferences were treated as hard constraints.
(define (domain pddl_orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types manipulator auditor agent part location phase)

  ; Domain-level constants (mirror the concrete objects used in the problem)
  (:constants
    manip1 - manipulator
    aud1   - auditor
    part1 part2 - part
    loc_storage loc_workstation loc_inspection loc_sink - location
    p1 p2 p3 p4 p5 - phase
  )

  (:predicates
    ; Agents and part locations
    (at_agent ?a - agent ?l - location)
    (at_part ?p - part ?l - location)
    (holding ?a - agent ?p - part)

    ; Part processing state
    (processed ?p - part)
    (inspected ?p - part)
    (corrected ?p - part)

    ; Phase control
    (current_phase ?ph - phase)
    (phase_successor ?ph1 - phase ?ph2 - phase)
    (phase_ready ?ph - phase)
  )

  ; --------------------
  ; Manipulator actions
  ; --------------------
  (:action manipulator_pick
    :parameters (?m - manipulator ?pt - part ?loc - location)
    :precondition (and (at_agent ?m ?loc) (at_part ?pt ?loc) (not (holding ?m ?pt)))
    :effect (and (holding ?m ?pt) (not (at_part ?pt ?loc)))
  )

  (:action manipulator_place
    :parameters (?m - manipulator ?pt - part ?loc - location)
    :precondition (and (at_agent ?m ?loc) (holding ?m ?pt))
    :effect (and (at_part ?pt ?loc) (not (holding ?m ?pt)))
  )

  (:action manipulator_move
    :parameters (?m - manipulator ?from - location ?to - location)
    :precondition (and (at_agent ?m ?from) (not (= ?from ?to)))
    :effect (and (at_agent ?m ?to) (not (at_agent ?m ?from)))
  )

  (:action manipulator_process_part
    :parameters (?m - manipulator ?pt - part ?loc - location)
    :precondition (and (at_agent ?m ?loc) (at_part ?pt ?loc) (current_phase p2))
    :effect (processed ?pt)
  )

  ; --------------------
  ; Auditor actions
  ; --------------------
  (:action auditor_move
    :parameters (?au - auditor ?from - location ?to - location)
    :precondition (and (at_agent ?au ?from) (not (= ?from ?to)))
    :effect (and (at_agent ?au ?to) (not (at_agent ?au ?from)))
  )

  (:action auditor_inspect
    :parameters (?au - auditor ?pt - part ?loc - location)
    :precondition (and (at_agent ?au ?loc) (at_part ?pt ?loc) (current_phase p3))
    :effect (inspected ?pt)
  )

  (:action auditor_mark_correct
    :parameters (?au - auditor ?pt - part ?loc - location)
    :precondition (and (at_agent ?au ?loc) (at_part ?pt ?loc) (inspected ?pt) (processed ?pt) (current_phase p4))
    :effect (corrected ?pt)
  )

  ; --------------------
  ; Phase readiness checks (explicit, reference the concrete parts)
  ; Each check enforces that required facts for that phase are true before marking it ready.
  ; These actions help enforce ordering and contiguity; they refer to the concrete part constants.
  ; --------------------
  (:action check_p1_ready_move_to_workstation
    :parameters ()
    ; Requires both parts to be at the workstation to mark phase p1 ready (cannot advance from p1 otherwise).
    :precondition (and (current_phase p1) (at_part part1 loc_workstation) (at_part part2 loc_workstation))
    :effect (phase_ready p1)
  )

  (:action check_p2_ready_processed_all
    :parameters ()
    ; Both parts must be processed to mark p2 ready
    :precondition (and (current_phase p2) (processed part1) (processed part2))
    :effect (phase_ready p2)
  )

  (:action check_p3_ready_inspected_all
    :parameters ()
    ; Both parts must be inspected to mark p3 ready
    :precondition (and (current_phase p3) (inspected part1) (inspected part2))
    :effect (phase_ready p3)
  )

  (:action check_p4_ready_corrected_all
    :parameters ()
    ; Both parts must be corrected to mark p4 ready
    :precondition (and (current_phase p4) (corrected part1) (corrected part2))
    :effect (phase_ready p4)
  )

  ; --------------------
  ; Phase advancement: strictly successor-based and requires phase_ready predicate to be set.
  ; --------------------
  (:action advance_phase
    :parameters (?from - phase ?to - phase)
    :precondition (and (current_phase ?from) (phase_successor ?from ?to) (phase_ready ?from))
    :effect (and (current_phase ?to) (not (current_phase ?from)) (not (phase_ready ?from)))
  )

  ; --------------------
  ; Safety actions (clear accidental holdings) are NOT provided.
  ; No penalty/repair actions exist: constraints enforced directly (as required).
  ; --------------------
)