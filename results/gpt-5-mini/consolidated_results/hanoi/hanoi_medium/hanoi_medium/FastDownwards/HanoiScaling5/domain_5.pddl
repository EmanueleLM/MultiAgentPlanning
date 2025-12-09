(define (domain hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types entity step)

  (:predicates
    ;; object classifications
    (disk ?x - entity)
    (peg ?x - entity)

    ;; disk ?d is directly on support ?s (support can be a peg or another disk)
    (on ?d - entity ?s - entity)

    ;; nothing on top of entity ?x (true for an empty peg or a disk with no disk above it)
    (clear ?x - entity)

    ;; size ordering between disks: smaller ?d1 ?d2 means d1 is strictly smaller than d2
    (smaller ?d1 - entity ?d2 - entity)

    ;; discrete step progression
    (current ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  ;; Move a top disk onto an empty peg (peg must be empty/top).
  (:action move-to-peg
    :parameters (?d - entity ?from - entity ?to - entity ?s - step ?s2 - step)
    :precondition (and
      (disk ?d)
      (peg ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      ;; prevent no-op move (moving onto the same support is disallowed)
      (not (on ?d ?to))
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk onto another top disk (target disk must be larger).
  (:action move-to-disk
    :parameters (?d - entity ?from - entity ?target - entity ?s - step ?s2 - step)
    :precondition (and
      (disk ?d)
      (disk ?target)
      (on ?d ?from)
      (clear ?d)
      (clear ?target)
      (smaller ?d ?target)
      ;; prevent no-op move (moving onto the same support is disallowed)
      (not (on ?d ?target))
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?target)
      (clear ?from)
      (not (clear ?target))
      (not (current ?s))
      (current ?s2)
    )
  )
)