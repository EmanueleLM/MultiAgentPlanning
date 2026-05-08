(define (domain tower-of-hanoi-orchestrated)
  ;; Orchestrator-composed PDDL domain for a 6-disk Tower of Hanoi
  ;; Contributions:
  ;; - Player_description: disks A..F with strict smaller-than ordering, three pegs (left, middle, right).
  ;; - Rule_spec: one disk at a time, may only move topmost disk of a peg, may not place larger on smaller.
  ;; - Audit_report: removed bookkeeping shortcuts; all constraints explicitly enforced by predicates and action preconditions/effects.
  ;; Notes: slots model (6 slots per peg) used so "top" / "next placement" are explicit and updates are deterministic.
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg slot)
  (:predicates
    ;; typing predicates (optional but explicit)
    (disk ?d - disk)
    (peg ?p - peg)
    (slot ?s - slot)

    ;; slot / peg layout relations
    (slot-of ?s - slot ?p - peg)        ;; slot belongs to peg
    (above   ?s-above - slot ?s-below - slot) ;; immediate above relation within same peg (s-above directly above s-below)
    (bottom-slot-of ?s - slot ?p - peg) ;; slot is the bottom-most slot of peg

    ;; occupancy and stack control (explicit bookkeeping predicates; actions maintain invariants)
    (in ?d - disk ?s - slot)             ;; disk currently occupies slot
    (occupied ?s - slot)                 ;; slot currently occupied
    (top-occupied ?s - slot)             ;; s is the topmost occupied slot on its peg (next disk above would be placed in slot above s)
    (peg-empty ?p - peg)                 ;; peg has no disks at all

    ;; physical rule
    (smaller ?small - disk ?large - disk) ;; true if ?small is strictly smaller than ?large
  )

  ;; Move cases are enumerated to ensure all bookkeeping predicates are updated deterministically.
  ;; There are four move action templates covering whether the source slot has a slot below that is occupied
  ;; and whether the target peg is empty or non-empty. This avoids conditional effects or quantified preconditions.

  ;; 1) Move a top disk from a source slot that has a occupied slot immediately below it,
  ;;    to a target peg that is currently empty (target will receive disk into its bottom slot).
  (:action move_from_with_below_to_empty
    :parameters (?d - disk
                 ?s_from - slot ?s_below - slot
                 ?p_from - peg ?p_to - peg ?s_to - slot)
    :precondition (and
      (in ?d ?s_from)
      (top-occupied ?s_from)
      (above ?s_from ?s_below)       ;; there is a slot immediately below the source
      (occupied ?s_below)            ;; that below slot is occupied (so after moving, it becomes the new top-occupied)
      (slot-of ?s_from ?p_from)
      (slot-of ?s_below ?p_from)
      (slot-of ?s_to ?p_to)
      (bottom-slot-of ?s_to ?p_to)   ;; target peg is empty so its bottom slot will receive the disk
      (peg-empty ?p_to)
      (not (= ?p_from ?p_to))
    )
    :effect (and
      ;; move disk occupancy
      (not (in ?d ?s_from))
      (in ?d ?s_to)
      (not (occupied ?s_from))
      (occupied ?s_to)

      ;; update top-occupied on source peg: former below slot becomes top
      (not (top-occupied ?s_from))
      (top-occupied ?s_below)

      ;; update peg emptiness on target
      (not (peg-empty ?p_to))

      ;; new top on target is the placed disk
      (top-occupied ?s_to)
    )
  )

  ;; 2) Move a top disk from a source slot that has NO slot below it (source slot is the bottom slot on its peg),
  ;;    to a target peg that is currently empty.
  (:action move_from_bottom_to_empty
    :parameters (?d - disk
                 ?s_from - slot
                 ?p_from - peg
                 ?p_to - peg
                 ?s_to - slot)
    :precondition (and
      (in ?d ?s_from)
      (top-occupied ?s_from)
      (bottom-slot-of ?s_from ?p_from)  ;; the source slot is bottom of its peg (no below)
      (slot-of ?s_from ?p_from)
      (slot-of ?s_to ?p_to)
      (bottom-slot-of ?s_to ?p_to)
      (peg-empty ?p_to)
      (not (= ?p_from ?p_to))
    )
    :effect (and
      ;; move occupancy
      (not (in ?d ?s_from))
      (in ?d ?s_to)
      (not (occupied ?s_from))
      (occupied ?s_to)

      ;; source peg becomes empty (no top-occupied)
      (not (top-occupied ?s_from))
      (peg-empty ?p_from)

      ;; target peg no longer empty and new top
      (not (peg-empty ?p_to))
      (top-occupied ?s_to)
    )
  )

  ;; 3) Move a top disk from a source slot that has an occupied slot below it,
  ;;    to a target peg that is currently non-empty. The disk will be placed into the slot immediately above the current top on the target peg.
  (:action move_from_with_below_to_nonempty
    :parameters (?d - disk
                 ?s_from - slot ?s_below_src - slot
                 ?p_from - peg
                 ?p_to - peg
                 ?s_target_top - slot    ;; current top-occupied slot on target peg (occupied)
                 ?s_to - slot            ;; the slot directly above ?s_target_top where we will place ?d
                 ?d_target - disk)
    :precondition (and
      (in ?d ?s_from)
      (top-occupied ?s_from)
      (above ?s_from ?s_below_src)
      (occupied ?s_below_src)                 ;; source has below occupied -> will become new top after move
      (slot-of ?s_from ?p_from)
      (slot-of ?s_below_src ?p_from)

      (slot-of ?s_target_top ?p_to)
      (slot-of ?s_to ?p_to)
      (top-occupied ?s_target_top)            ;; target peg non-empty
      (above ?s_to ?s_target_top)             ;; s_to is the slot immediately above current top
      (not (occupied ?s_to))                  ;; ensure destination slot is empty (invariant maintenance)
      (in ?d_target ?s_target_top)
      (smaller ?d ?d_target)                  ;; rule: placed disk must be smaller than disk beneath on target
      (not (= ?p_from ?p_to))
    )
    :effect (and
      ;; move occupancy
      (not (in ?d ?s_from))
      (in ?d ?s_to)
      (not (occupied ?s_from))
      (occupied ?s_to)

      ;; source top update: below slot becomes new top
      (not (top-occupied ?s_from))
      (top-occupied ?s_below_src)

      ;; target top update: moved disk becomes new top, previous top no longer top
      (not (top-occupied ?s_target_top))
      (top-occupied ?s_to)
    )
  )

  ;; 4) Move a top disk from a source slot that is bottom (no below),
  ;;    to a target peg that is non-empty (place onto the slot immediately above current target top).
  (:action move_from_bottom_to_nonempty
    :parameters (?d - disk
                 ?s_from - slot
                 ?p_from - peg
                 ?p_to - peg
                 ?s_target_top - slot
                 ?s_to - slot
                 ?d_target - disk)
    :precondition (and
      (in ?d ?s_from)
      (top-occupied ?s_from)
      (bottom-slot-of ?s_from ?p_from)
      (slot-of ?s_from ?p_from)

      (slot-of ?s_target_top ?p_to)
      (slot-of ?s_to ?p_to)
      (top-occupied ?s_target_top)
      (above ?s_to ?s_target_top)
      (not (occupied ?s_to))
      (in ?d_target ?s_target_top)
      (smaller ?d ?d_target)
      (not (= ?p_from ?p_to))
    )
    :effect (and
      ;; move occupancy
      (not (in ?d ?s_from))
      (in ?d ?s_to)
      (not (occupied ?s_from))
      (occupied ?s_to)

      ;; source peg becomes empty
      (not (top-occupied ?s_from))
      (peg-empty ?p_from)

      ;; target top update
      (not (top-occupied ?s_target_top))
      (top-occupied ?s_to)
    )
  )

)