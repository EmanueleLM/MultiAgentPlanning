(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; immediate support relations: ?d is directly on top of disk ?below
    (on-disk ?d - disk ?below - disk)

    ;; bottom-of-peg relation: ?d is the bottom disk currently on peg ?p
    (on-peg  ?d - disk ?p - peg)

    ;; current top disk of a peg
    (top ?d - disk ?p - peg)

    ;; peg emptiness
    (empty ?p - peg)

    ;; static size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; ordered discrete stages
    (current ?s - step)
    (next ?s1 - step ?s2 - step)

    ;; forbid no-op moves by requiring distinct pegs
    (different ?p1 - peg ?p2 - peg)

    ;; explicit membership of a disk on a peg (anywhere in that peg's stack)
    (on-stack ?d - disk ?p - peg)
  )

  ;; Move a single top disk that is the only disk on its source peg onto an empty target peg.
  (:action move-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (top ?d ?from)
      (empty ?to)
      (different ?from ?to)
      (current ?s)
      (next ?s ?s2)
      (on-stack ?d ?from)
    )
    :effect (and
      ;; stage progression
      (not (current ?s))
      (current ?s2)

      ;; remove disk from source
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (not (on-stack ?d ?from))

      ;; place disk on target (it becomes both bottom and top since target was empty)
      (on-peg ?d ?to)
      (top ?d ?to)
      (on-stack ?d ?to)

      ;; update emptiness
      (empty ?from)
      (not (empty ?to))
    )
  )

  ;; Move a single top disk that is the only disk on its source peg onto the top disk of another peg.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?d2 - disk ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (top ?d ?from)
      (top ?d2 ?to)
      (smaller ?d ?d2)
      (different ?from ?to)
      (current ?s)
      (next ?s ?s2)
      (on-stack ?d ?from)
      (on-stack ?d2 ?to)
    )
    :effect (and
      ;; stage progression
      (not (current ?s))
      (current ?s2)

      ;; remove disk from source
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (not (on-stack ?d ?from))

      ;; place disk on target disk
      (not (top ?d2 ?to))
      (on-disk ?d ?d2)
      (top ?d ?to)
      (on-stack ?d ?to)

      ;; source becomes empty (it was a single disk)
      (empty ?from)
      (not (empty ?to))
    )
  )

  ;; Move a single top disk that sits on another disk in its source peg onto an empty target peg.
  (:action move-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d ?from)
      (empty ?to)
      (different ?from ?to)
      (current ?s)
      (next ?s ?s2)
      (on-stack ?d ?from)
      (on-stack ?below ?from)
    )
    :effect (and
      ;; stage progression
      (not (current ?s))
      (current ?s2)

      ;; remove moved disk's relations from source
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (not (on-stack ?d ?from))

      ;; the disk below becomes the new top on the source peg
      (top ?below ?from)

      ;; add moved disk to target peg (target was empty so it becomes bottom and top)
      (on-peg ?d ?to)
      (top ?d ?to)
      (on-stack ?d ?to)

      ;; update emptiness
      (not (empty ?to))

      ;; source remains non-empty because ?below stays
      (not (empty ?from))
    )
  )

  ;; Move a single top disk that sits on another disk in its source peg onto the top disk of another peg.
  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?d2 - disk ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d ?from)
      (top ?d2 ?to)
      (smaller ?d ?d2)
      (different ?from ?to)
      (current ?s)
      (next ?s ?s2)
      (on-stack ?d ?from)
      (on-stack ?below ?from)
      (on-stack ?d2 ?to)
    )
    :effect (and
      ;; stage progression
      (not (current ?s))
      (current ?s2)

      ;; remove moved disk's relations from source
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (not (on-stack ?d ?from))

      ;; the disk below becomes the new top on the source peg
      (top ?below ?from)

      ;; update target: previous top no longer top, new on-disk relation and top, and on-stack membership
      (not (top ?d2 ?to))
      (on-disk ?d ?d2)
      (top ?d ?to)
      (on-stack ?d ?to)

      ;; target is no longer empty
      (not (empty ?to))

      ;; source remains non-empty because ?below remains
      (not (empty ?from))
    )
  )
)