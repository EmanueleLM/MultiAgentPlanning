(define (domain hanoi-6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; location relations: immediate support
    (on-peg ?d - disk ?p - peg)       ; disk directly on peg
    (on-disk ?d - disk ?below - disk) ; disk directly on another disk

    ;; top-of-peg relation: which disk is currently the topmost disk on a given peg
    (top ?d - disk ?p - peg)

    ;; whether a disk has nothing on top of it
    (clear ?d - disk)

    ;; whether a peg has no disks
    (peg-empty ?p - peg)

    ;; suggested move (one suggestion at a time is enforced by suggestion-active)
    (suggested ?d - disk ?from - peg ?to - peg)
    (suggestion-active)

    ;; sequencing / control flags
    (audited)
    (state-reported)

    ;; static size ordering: smaller ?d1 ?d2 means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; The planner suggests one move at a time. Only when audited is true may the planner make a suggestion.
  (:action suggest-move
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (state-reported)
      (audited)
      (not (suggestion-active))
    )
    :effect (and
      (suggested ?d ?from ?to)
      (suggestion-active)
    )
  )

  ;; Move actions are executed by the manager. There are four specializations to avoid
  ;; disjunctions in preconditions: source can be a disk-support or a peg-support; target
  ;; can be empty peg or a peg whose top is a disk.
  ;; After any move, the suggestion is consumed and audited is set false; an audit is required
  ;; before the next suggestion.

  ;; Case 1: move a disk that was directly on a peg, to an empty peg.
  (:action move-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (suggested ?d ?from ?to)
      (on-peg ?d ?from)
      (clear ?d)
      (top ?d ?from)
      (peg-empty ?to)
      (audited)
    )
    :effect (and
      ;; update immediate support
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; update top relations
      (not (top ?d ?from))
      (top ?d ?to)

      ;; peg occupancy updates
      (not (peg-empty ?to))
      (peg-empty ?from)

      ;; consume suggestion and require audit after move
      (not (suggested ?d ?from ?to))
      (not (suggestion-active))
      (not (audited))
    )
  )

  ;; Case 2: move a disk that was directly on a peg, onto the top disk of another peg.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?tgt - disk)
    :precondition (and
      (suggested ?d ?from ?to)
      (on-peg ?d ?from)
      (clear ?d)
      (top ?d ?from)
      (top ?tgt ?to)
      (clear ?tgt)
      (smaller ?d ?tgt)
      (audited)
    )
    :effect (and
      ;; update immediate support
      (not (on-peg ?d ?from))
      (on-disk ?d ?tgt)

      ;; update top relations
      (not (top ?d ?from))
      (top ?d ?to)
      (not (top ?tgt ?to))

      ;; tgt now has a disk on top, so it is not clear
      (not (clear ?tgt))

      ;; source peg may become empty
      (peg-empty ?from)

      ;; consume suggestion and require audit after move
      (not (suggested ?d ?from ?to))
      (not (suggestion-active))
      (not (audited))
    )
  )

  ;; Case 3: move a disk that was directly on another disk, to an empty peg.
  (:action move-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (suggested ?d ?from ?to)
      (on-disk ?d ?below)
      (clear ?d)
      (top ?d ?from)
      (peg-empty ?to)
      (audited)
    )
    :effect (and
      ;; update immediate support (remove from below, place on peg)
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      ;; update top relations: removed from source, below becomes new top on that peg
      (not (top ?d ?from))
      (top ?below ?from)
      (top ?d ?to)

      ;; below becomes clear
      (clear ?below)

      ;; peg occupancy
      (not (peg-empty ?to))

      ;; consume suggestion and require audit after move
      (not (suggested ?d ?from ?to))
      (not (suggestion-active))
      (not (audited))
    )
  )

  ;; Case 4: move a disk that was directly on another disk, onto the top disk of another peg.
  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?tgt - disk)
    :precondition (and
      (suggested ?d ?from ?to)
      (on-disk ?d ?below)
      (clear ?d)
      (top ?d ?from)
      (top ?tgt ?to)
      (clear ?tgt)
      (smaller ?d ?tgt)
      (audited)
    )
    :effect (and
      ;; update immediate support
      (not (on-disk ?d ?below))
      (on-disk ?d ?tgt)

      ;; update top relations
      (not (top ?d ?from))
      (top ?d ?to)
      (not (top ?tgt ?to))

      ;; below becomes clear
      (clear ?below)

      ;; tgt no longer clear
      (not (clear ?tgt))

      ;; consume suggestion and require audit after move
      (not (suggested ?d ?from ?to))
      (not (suggestion-active))
      (not (audited))
    )
  )

  ;; Auditor action: mark state as audited so planner can suggest next move.
  ;; Audit is only possible when audited is currently false; moves set audited false,
  ;; and audit re-enables suggestion and subsequent move. (We refrain from allowing
  ;; an "audit fix" action that would repair illegal placements—the move actions
  ;; already enforce legality.)
  (:action audit
    :parameters ()
    :precondition (and
      (not (audited))
    )
    :effect (and
      (audited)
    )
  )
)