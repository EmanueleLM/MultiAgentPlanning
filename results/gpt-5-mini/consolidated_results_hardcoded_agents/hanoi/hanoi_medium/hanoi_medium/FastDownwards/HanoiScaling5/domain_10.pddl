(define (domain hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    ;; disk is directly on a place (either a peg or another disk)
    (on ?d - disk ?p - place)

    ;; a place (peg or disk) has nothing directly on top of it
    (clear ?p - place)

    ;; size ordering: (smaller x y) means x is strictly smaller than y
    (smaller ?d1 - disk ?d2 - disk)

    ;; discrete ordered stages
    (current ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  ;; Move a top disk onto an empty peg (peg must be clear)
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)

      ;; disk ?d must be located directly on ?from and must be the top disk (clear)
      (on ?d ?from)
      (clear ?d)

      ;; target peg must be empty on top
      (clear ?to)

      ;; safety: disk should not already be on the target
      (not (on ?d ?to))
    )
    :effect (and
      ;; move disk ?d from ?from to ?to
      (not (on ?d ?from))
      (on ?d ?to)

      ;; after removing ?d, its former supporting place becomes clear
      (clear ?from)

      ;; target peg is no longer clear (it now has a disk on top)
      (not (clear ?to))

      ;; advance global stage (enforces contiguous stage progression)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk onto another disk (must be smaller than the destination disk)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)

      ;; disk ?d must be located directly on ?from and must be top
      (on ?d ?from)
      (clear ?d)

      ;; target disk must have nothing on top (so we place on it)
      (clear ?to)

      ;; size constraint: cannot put a larger disk onto a smaller disk
      (smaller ?d ?to)

      ;; safety: disk should not already be on the target
      (not (on ?d ?to))
    )
    :effect (and
      ;; move disk ?d from ?from to be directly on top of ?to
      (not (on ?d ?from))
      (on ?d ?to)

      ;; source place becomes clear (we removed its top disk)
      (clear ?from)

      ;; target disk now has something on top, so it is not clear
      (not (clear ?to))

      ;; advance global stage
      (not (current ?s))
      (current ?s2)
    )
  )
)