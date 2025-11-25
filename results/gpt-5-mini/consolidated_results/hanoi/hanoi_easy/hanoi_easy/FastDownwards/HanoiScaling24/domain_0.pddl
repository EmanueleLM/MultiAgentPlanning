(define (domain hanoi-4disks-3pegs)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg place)
  ;; disks and pegs are places (so a disk or a peg can be the 'place' a disk is on)
  ;; subtyping: disk and peg are both considered place-level objects
  ;; (PDDL syntax: declare disk and peg as subtypes of place)
  (:types disk peg - place)

  ;; Problem-specific constants (fully expanded domain tied to this 4-disk / 3-peg instance)
  (:constants
    d1 d2 d3 d4 - disk
    peg1 peg2 peg3 - peg
  )

  ;; Predicates:
  ;; (on ?d ?p)         : disk ?d is directly on place ?p (place = peg or disk)
  ;; (clear ?p)         : place ?p has no disk on top of it (so it is available to receive a disk)
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
  )

  ;; Actions:
  ;; Implementation strategy:
  ;; - There is a family of move actions, each moves a named disk (d1..d4) from any current place (?from)
  ;;   to a specific destination (either one of the three pegs or onto a specific larger disk).
  ;; - Each move action enforces that:
  ;;   * the moving disk is currently on ?from and is clear (no disk on top)
  ;;   * the destination (peg or disk constant) is clear (i.e., the destination is top and can receive a disk)
  ;;   * the destination disk (when moving onto a disk) is necessarily larger than the moving disk because
  ;;     we only provide move actions that place a disk onto strictly larger disks.
  ;; - Effects update (on ...) and (clear ...) atoms so top-only moves and stacking order are enforced by the available actions.
  ;; - All legal placement possibilities (onto empty pegs and onto strictly larger disks) are explicitly enumerated.

  ;; ----------------------
  ;; Moves of disk d1 (largest disk) - can only move onto empty pegs (never onto any disk)
  ;; ----------------------
  (:action move-d1-to-peg1
    :parameters (?from - place)
    :precondition (and (on d1 ?from) (clear d1) (clear peg1))
    :effect (and
              (not (on d1 ?from))
              (on d1 peg1)
              (clear ?from)
              (not (clear peg1))
            )
  )
  (:action move-d1-to-peg2
    :parameters (?from - place)
    :precondition (and (on d1 ?from) (clear d1) (clear peg2))
    :effect (and
              (not (on d1 ?from))
              (on d1 peg2)
              (clear ?from)
              (not (clear peg2))
            )
  )
  (:action move-d1-to-peg3
    :parameters (?from - place)
    :precondition (and (on d1 ?from) (clear d1) (clear peg3))
    :effect (and
              (not (on d1 ?from))
              (on d1 peg3)
              (clear ?from)
              (not (clear peg3))
            )
  )

  ;; ----------------------
  ;; Moves of disk d2 - can move onto any empty peg, or onto d1 (since d1 is larger)
  ;; ----------------------
  (:action move-d2-to-peg1
    :parameters (?from - place)
    :precondition (and (on d2 ?from) (clear d2) (clear peg1))
    :effect (and
              (not (on d2 ?from))
              (on d2 peg1)
              (clear ?from)
              (not (clear peg1))
            )
  )
  (:action move-d2-to-peg2
    :parameters (?from - place)
    :precondition (and (on d2 ?from) (clear d2) (clear peg2))
    :effect (and
              (not (on d2 ?from))
              (on d2 peg2)
              (clear ?from)
              (not (clear peg2))
            )
  )
  (:action move-d2-to-peg3
    :parameters (?from - place)
    :precondition (and (on d2 ?from) (clear d2) (clear peg3))
    :effect (and
              (not (on d2 ?from))
              (on d2 peg3)
              (clear ?from)
              (not (clear peg3))
            )
  )
  (:action move-d2-onto-d1
    :parameters (?from - place)
    :precondition (and (on d2 ?from) (clear d2) (clear d1))
    :effect (and
              (not (on d2 ?from))
              (on d2 d1)
              (clear ?from)
              (not (clear d1))
            )
  )

  ;; ----------------------
  ;; Moves of disk d3 - can move onto any empty peg, or onto d1 or d2 (both larger)
  ;; ----------------------
  (:action move-d3-to-peg1
    :parameters (?from - place)
    :precondition (and (on d3 ?from) (clear d3) (clear peg1))
    :effect (and
              (not (on d3 ?from))
              (on d3 peg1)
              (clear ?from)
              (not (clear peg1))
            )
  )
  (:action move-d3-to-peg2
    :parameters (?from - place)
    :precondition (and (on d3 ?from) (clear d3) (clear peg2))
    :effect (and
              (not (on d3 ?from))
              (on d3 peg2)
              (clear ?from)
              (not (clear peg2))
            )
  )
  (:action move-d3-to-peg3
    :parameters (?from - place)
    :precondition (and (on d3 ?from) (clear d3) (clear peg3))
    :effect (and
              (not (on d3 ?from))
              (on d3 peg3)
              (clear ?from)
              (not (clear peg3))
            )
  )
  (:action move-d3-onto-d1
    :parameters (?from - place)
    :precondition (and (on d3 ?from) (clear d3) (clear d1))
    :effect (and
              (not (on d3 ?from))
              (on d3 d1)
              (clear ?from)
              (not (clear d1))
            )
  )
  (:action move-d3-onto-d2
    :parameters (?from - place)
    :precondition (and (on d3 ?from) (clear d3) (clear d2))
    :effect (and
              (not (on d3 ?from))
              (on d3 d2)
              (clear ?from)
              (not (clear d2))
            )
  )

  ;; ----------------------
  ;; Moves of disk d4 (smallest) - can move onto any empty peg, or onto d1, d2, or d3 (all larger)
  ;; ----------------------
  (:action move-d4-to-peg1
    :parameters (?from - place)
    :precondition (and (on d4 ?from) (clear d4) (clear peg1))
    :effect (and
              (not (on d4 ?from))
              (on d4 peg1)
              (clear ?from)
              (not (clear peg1))
            )
  )
  (:action move-d4-to-peg2
    :parameters (?from - place)
    :precondition (and (on d4 ?from) (clear d4) (clear peg2))
    :effect (and
              (not (on d4 ?from))
              (on d4 peg2)
              (clear ?from)
              (not (clear peg2))
            )
  )
  (:action move-d4-to-peg3
    :parameters (?from - place)
    :precondition (and (on d4 ?from) (clear d4) (clear peg3))
    :effect (and
              (not (on d4 ?from))
              (on d4 peg3)
              (clear ?from)
              (not (clear peg3))
            )
  )
  (:action move-d4-onto-d1
    :parameters (?from - place)
    :precondition (and (on d4 ?from) (clear d4) (clear d1))
    :effect (and
              (not (on d4 ?from))
              (on d4 d1)
              (clear ?from)
              (not (clear d1))
            )
  )
  (:action move-d4-onto-d2
    :parameters (?from - place)
    :precondition (and (on d4 ?from) (clear d4) (clear d2))
    :effect (and
              (not (on d4 ?from))
              (on d4 d2)
              (clear ?from)
              (not (clear d2))
            )
  )
  (:action move-d4-onto-d3
    :parameters (?from - place)
    :precondition (and (on d4 ?from) (clear d4) (clear d3))
    :effect (and
              (not (on d4 ?from))
              (on d4 d3)
              (clear ?from)
              (not (clear d3))
            )
  )

)