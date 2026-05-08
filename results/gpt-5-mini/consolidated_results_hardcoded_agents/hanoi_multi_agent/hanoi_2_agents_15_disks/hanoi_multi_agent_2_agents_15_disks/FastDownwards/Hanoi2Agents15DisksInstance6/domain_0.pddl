(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    ;; disk placement: a disk is immediately on an object (a disk or a peg)
    (on ?d - disk ?x - object)
    ;; a disk is clear (no disk on top of it)
    (clear ?d - disk)
    ;; peg is empty (no disks on it)
    (peg-empty ?p - peg)
    ;; size ordering: smaller ?a ?b means disk a is smaller than disk b
    (smaller ?a - disk ?b - disk)
    ;; agent permissions
    (agent1-allowed ?d - disk)
    (agent2-allowed ?d - disk)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions for agent_1 (agent1- prefix)
  ;; We provide four patterns handling whether the disk below (?under) is a
  ;; peg or another disk, and whether the destination is an empty peg or a disk.
  ;; This avoids disjunctions in preconditions by making the "under" and "to"
  ;; types explicit.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; move disk from a peg directly (under is a peg) to an empty peg
  (:action agent1-move-from-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (peg-empty ?to)
      (agent1-allowed ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (peg-empty ?to))
      (peg-empty ?from)
      ;; ?d remains clear (it is top on destination), no explicit clear change needed
    )
  )

  ;; move disk from on top of another disk to an empty peg
  (:action agent1-move-from-disk-to-peg
    :parameters (?d - disk ?under - disk ?to - peg)
    :precondition (and
      (on ?d ?under)
      (clear ?d)
      (peg-empty ?to)
      (agent1-allowed ?d)
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?to)
      (not (peg-empty ?to))
      (clear ?under)    ;; the disk under becomes clear after removal
    )
  )

  ;; move disk from a peg to on top of another disk
  (:action agent1-move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?top - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?top)
      (smaller ?d ?top)
      (agent1-allowed ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?top)
      (not (clear ?top))  ;; top now has d on it
      (peg-empty ?from)   ;; since ?d was directly on ?from (a peg), that peg becomes empty
    )
  )

  ;; move disk from on top of another disk to on top of another disk
  (:action agent1-move-from-disk-to-disk
    :parameters (?d - disk ?under - disk ?to - disk)
    :precondition (and
      (on ?d ?under)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (agent1-allowed ?d)
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?to)
      (clear ?under)
      (not (clear ?to))
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions for agent_2 (agent2- prefix) - same structure, different action names
  ;; Agent2 is restricted to moving disks I..O; actions mirror agent1's actions.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:action agent2-move-from-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (peg-empty ?to)
      (agent2-allowed ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (peg-empty ?to))
      (peg-empty ?from)
    )
  )

  (:action agent2-move-from-disk-to-peg
    :parameters (?d - disk ?under - disk ?to - peg)
    :precondition (and
      (on ?d ?under)
      (clear ?d)
      (peg-empty ?to)
      (agent2-allowed ?d)
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?to)
      (not (peg-empty ?to))
      (clear ?under)
    )
  )

  (:action agent2-move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?top - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?top)
      (smaller ?d ?top)
      (agent2-allowed ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?top)
      (not (clear ?top))
      (peg-empty ?from)
    )
  )

  (:action agent2-move-from-disk-to-disk
    :parameters (?d - disk ?under - disk ?to - disk)
    :precondition (and
      (on ?d ?under)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (agent2-allowed ?d)
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?to)
      (clear ?under)
      (not (clear ?to))
    )
  )

)