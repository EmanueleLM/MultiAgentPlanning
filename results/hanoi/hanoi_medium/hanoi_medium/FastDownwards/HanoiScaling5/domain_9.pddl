(define (domain hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object step)

  (:predicates
    ;; disk is on either a peg or another disk (both are of supertype object)
    (on ?d - disk ?s - object)

    ;; object (peg or disk) has nothing on top of it
    (clear ?o - object)

    ;; size ordering: (smaller x y) means x is strictly smaller than y
    (smaller ?d1 - disk ?d2 - disk)

    ;; discrete, ordered stages
    (current ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)

      ;; disk ?d must be located on ?from and must be the top disk (clear)
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

      ;; after removing ?d, its former location becomes clear
      (clear ?from)

      ;; target peg is no longer clear (it now has a disk on top)
      (not (clear ?to))

      ;; advance global stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk onto another disk (must be smaller than the destination disk)
  (:action move-to-disk
    :parameters (?d - disk ?from - object ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)

      ;; disk ?d must be located on ?from and must be top
      (on ?d ?from)
      (clear ?d)

      ;; target disk must be clear (nothing on it)
      (clear ?to)

      ;; size constraint: cannot put a larger disk onto a smaller disk
      (smaller ?d ?to)

      ;; safety: disk should not already be on the target
      (not (on ?d ?to))
    )
    :effect (and
      ;; move disk ?d from ?from to be on top of ?to
      (not (on ?d ?from))
      (on ?d ?to)

      ;; source becomes clear (since we removed its top disk)
      (clear ?from)

      ;; target disk now has something on top, so it is not clear
      (not (clear ?to))

      ;; advance global stage
      (not (current ?s))
      (current ?s2)
    )
  )
)