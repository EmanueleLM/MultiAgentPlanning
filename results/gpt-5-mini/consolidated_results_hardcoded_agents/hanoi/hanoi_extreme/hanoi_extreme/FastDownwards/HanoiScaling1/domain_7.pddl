(define (domain hanoi7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk is directly on a peg (bottom-most support)
    (on-disk ?d - disk ?below - disk)  ; disk is directly on another disk
    (top ?d - disk ?p - peg)           ; disk is the top disk on peg
    (clear-peg ?p - peg)               ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk)    ; static size ordering: d1 is smaller than d2
    (current ?t - stage)               ; current stage token (exactly one holds)
    (succ ?t1 - stage ?t2 - stage)     ; successor relation between stages
    (different ?p1 - peg ?p2 - peg)    ; pegs are different (declared in init)
  )

  (:action move-from-disk-to-disk
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?top - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)

      (top ?d ?from)
      (on-disk ?d ?below)

      (top ?top ?to)
      (smaller ?d ?top)

      (different ?from ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?below))
      (not (top ?d ?from))

      (top ?below ?from)

      (not (top ?top ?to))
      (on-disk ?d ?top)
      (top ?d ?to)
    )
  )

  (:action move-from-disk-to-empty
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)

      (top ?d ?from)
      (on-disk ?d ?below)

      (clear-peg ?to)
      (different ?from ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?below))
      (not (top ?d ?from))

      (top ?below ?from)

      (not (clear-peg ?to))
      (on-peg ?d ?to)
      (top ?d ?to)
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?top - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)

      (top ?d ?from)
      (on-peg ?d ?from)

      (top ?top ?to)
      (smaller ?d ?top)

      (different ?from ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-peg ?d ?from))
      (not (top ?d ?from))

      (clear-peg ?from)

      (not (top ?top ?to))
      (on-disk ?d ?top)
      (top ?d ?to)
    )
  )

  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)

      (top ?d ?from)
      (on-peg ?d ?from)

      (clear-peg ?to)
      (different ?from ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-peg ?d ?from))
      (not (top ?d ?from))

      (clear-peg ?from)

      (not (clear-peg ?to))
      (on-peg ?d ?to)
      (top ?d ?to)
    )
  )
)