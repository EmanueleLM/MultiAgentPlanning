(define (domain hanoi-six)
  (:requirements :strips :typing)
  (:types disk peg)

  (:predicates
    ;; disk directly on a peg
    (on-peg ?d - disk ?p - peg)
    ;; disk directly on top of another disk
    (on-disk ?d - disk ?d2 - disk)
    ;; disk located on peg (peg where the disk's stack resides)
    (loc ?d - disk ?p - peg)
    ;; disk has nothing on top of it (is top of its stack)
    (clear ?d - disk)
    ;; peg has no disks
    (empty ?p - peg)
    ;; size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; MOVE actions are provided as distinct agent-labeled actions.
  ;; Four structural move patterns are required (source: on-peg or on-disk)
  ;; and (destination: empty peg or on top of a disk). For clarity and to
  ;; keep agent actions distinct, every pattern is duplicated for two agents:
  ;; "mover" and "auditor". Semantics of the two agents are identical;
  ;; the duplication preserves agent-distinct actions per the specification.

  ;; 1) from peg -> to empty peg (mover)
  (:action move-mover-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (loc ?d ?from)
      (empty ?to)
    )
    :effect (and
      ;; remove disk from source peg
      (not (on-peg ?d ?from))
      (not (loc ?d ?from))
      ;; source peg becomes empty
      (empty ?from)
      ;; destination peg is no longer empty, disk is directly on peg
      (not (empty ?to))
      (on-peg ?d ?to)
      (loc ?d ?to)
      ;; moved disk is top (clear)
      (clear ?d)
    )
  )

  ;; 2) from peg -> on top of another disk (mover)
  (:action move-mover-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?top - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (loc ?d ?from)
      ;; destination top disk located on the destination peg and is top
      (loc ?top ?to)
      (clear ?top)
      ;; size ordering: moving disk must be smaller than destination top
      (smaller ?d ?top)
    )
    :effect (and
      ;; remove disk from source peg
      (not (on-peg ?d ?from))
      (not (loc ?d ?from))
      ;; source peg becomes empty (since disk was top directly on peg)
      (empty ?from)
      ;; destination top ceases to be clear
      (not (clear ?top))
      ;; moved disk now sits directly on the destination top disk
      (on-disk ?d ?top)
      (loc ?d ?to)
      ;; moved disk is top
      (clear ?d)
    )
  )

  ;; 3) from disk -> to empty peg (mover)
  (:action move-mover-from-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      ;; ?d is directly on top of ?below and is top of stack
      (on-disk ?d ?below)
      (clear ?d)
      ;; all disks involved report their peg
      (loc ?d ?from)
      (loc ?below ?from)
      ;; destination peg empty
      (empty ?to)
    )
    :effect (and
      ;; remove direct-on relation from below
      (not (on-disk ?d ?below))
      ;; the disk below becomes clear (top of its stack)
      (clear ?below)
      ;; moved disk no longer on origin peg
      (not (loc ?d ?from))
      ;; destination peg now occupied by moved disk
      (not (empty ?to))
      (on-peg ?d ?to)
      (loc ?d ?to)
      ;; moved disk is top (clear)
      (clear ?d)
    )
  )

  ;; 4) from disk -> on top of another disk (mover)
  (:action move-mover-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?top - disk)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (loc ?d ?from)
      (loc ?below ?from)
      (loc ?top ?to)
      (clear ?top)
      (smaller ?d ?top)
    )
    :effect (and
      ;; remove old support
      (not (on-disk ?d ?below))
      ;; the disk below becomes clear
      (clear ?below)
      ;; destination top ceases to be clear
      (not (clear ?top))
      ;; moved disk is on top of destination top
      (on-disk ?d ?top)
      ;; update peg location for moved disk
      (not (loc ?d ?from))
      (loc ?d ?to)
      ;; moved disk is top
      (clear ?d)
    )
  )

  ;; Duplicate the four structural actions for the "auditor" agent.
  ;; Names differ; semantics are identical.
  (:action move-auditor-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (loc ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (loc ?d ?from))
      (empty ?from)
      (not (empty ?to))
      (on-peg ?d ?to)
      (loc ?d ?to)
      (clear ?d)
    )
  )

  (:action move-auditor-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?top - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (loc ?d ?from)
      (loc ?top ?to)
      (clear ?top)
      (smaller ?d ?top)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (loc ?d ?from))
      (empty ?from)
      (not (clear ?top))
      (on-disk ?d ?top)
      (loc ?d ?to)
      (clear ?d)
    )
  )

  (:action move-auditor-from-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (loc ?d ?from)
      (loc ?below ?from)
      (empty ?to)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (clear ?below)
      (not (loc ?d ?from))
      (not (empty ?to))
      (on-peg ?d ?to)
      (loc ?d ?to)
      (clear ?d)
    )
  )

  (:action move-auditor-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?top - disk)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (loc ?d ?from)
      (loc ?below ?from)
      (loc ?top ?to)
      (clear ?top)
      (smaller ?d ?top)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (clear ?below)
      (not (clear ?top))
      (on-disk ?d ?top)
      (not (loc ?d ?from))
      (loc ?d ?to)
      (clear ?d)
    )
  )

)