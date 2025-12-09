(define (domain hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  ;; disk and peg are subtypes of a generic object so on/clear can refer to either
  (:types disk peg - object step)

  (:predicates
    ;; disk is directly on a support (support is an object: either a peg or another disk)
    (on ?d - disk ?s - object)

    ;; nothing on top of this object (true for an empty peg or a disk with no disk above it)
    (clear ?o - object)

    ;; size ordering between disks: smaller ?d1 ?d2 means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; discrete step progression
    (current ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  ;; Move a top disk onto an empty peg (peg must be empty).
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      ;; disallow no-op move where disk already on the target support
      (not (on ?d ?to))
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; after removing ?d its previous support becomes clear (either a peg becomes empty or a disk becomes top)
      (clear ?from)
      ;; target is no longer clear
      (not (clear ?to))
      ;; advance step
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk onto another top disk (target must be a larger disk).
  (:action move-to-disk
    :parameters (?d - disk ?from - object ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
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
)