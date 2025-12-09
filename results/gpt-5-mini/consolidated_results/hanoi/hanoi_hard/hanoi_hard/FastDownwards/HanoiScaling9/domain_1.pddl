(define (domain hanoi-6)
  (:requirements :strips :typing :negative-preconditions)
  (:types place step - obj
          disk peg - place)

  (:predicates
    ;; classification predicates (explicit, used as hard constraints)
    (disk ?x - disk)
    (peg ?x - peg)

    ;; structural predicates
    ;; a disk ?d is directly on support ?p (where ?p is either a peg or another disk)
    (on ?d - disk ?p - place)

    ;; true iff nothing is on top of this place (place may be a peg or a disk)
    (clear ?x - place)

    ;; size ordering: (smaller a b) means a is strictly smaller than b
    (smaller ?a - disk ?b - disk)

    ;; step sequencing control
    (at-step ?s - step)
    (succ ?s - step ?s2 - step)
  )

  ;; Move a top disk onto an empty peg (peg must be clear). Enforces single-disk move,
  ;; top-only source, destination clear, and strict step ordering.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?snext - step)
    :precondition (and
      (at-step ?s)
      (succ ?s ?snext)

      ;; disk must be currently directly on ?from (either peg or disk)
      (on ?d ?from)

      ;; only top disks may be moved
      (clear ?d)

      ;; destination must be a peg and must be clear (top position)
      (clear ?to)

      ;; forbid null/no-op moves (prevents from=to when both are pegs)
      (not (= ?from ?to))
    )
    :effect (and
      ;; relocate the disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clearness: the former support becomes clear (its top was removed),
      ;; the destination is no longer clear (it now has a disk on top)
      (clear ?from)
      (not (clear ?to))

      ;; advance step token so exactly one action occurs at each step
      (not (at-step ?s))
      (at-step ?snext)
    )
  )

  ;; Move a top disk onto another disk. Enforces smaller-on-larger rule,
  ;; top-only source, destination clear, single-disk move, and step ordering.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step ?snext - step)
    :precondition (and
      (at-step ?s)
      (succ ?s ?snext)

      ;; disk must be currently directly on ?from (either peg or disk)
      (on ?d ?from)

      ;; only top disks may be moved
      (clear ?d)

      ;; destination disk must be top (clear)
      (clear ?to)

      ;; size constraint: moving disk must be strictly smaller than destination disk
      (smaller ?d ?to)

      ;; forbid null/no-op moves
      (not (= ?from ?to))
    )
    :effect (and
      ;; relocate the disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clearness: the former support becomes clear, the destination is no longer clear
      (clear ?from)
      (not (clear ?to))

      ;; advance step token so exactly one action occurs at each step
      (not (at-step ?s))
      (at-step ?snext)
    )
  )
)