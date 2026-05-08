(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ; placement relations (direct)
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?below - disk)

    ; top-of-peg and peg emptiness (global, non-stage-indexed; updated as actions fire)
    (top ?d - disk ?p - peg)
    (empty ?p - peg)

    ; static size ordering
    (smaller ?d1 - disk ?d2 - disk)

    ; stage control: exactly one current stage holds; actions advance current stage via succ
    (current ?s - stage)
    (succ ?s - stage ?s2 - stage)
  )

  ; Move a disk that is directly on a peg to an empty peg.
  (:action move-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (top ?d ?from)
      (on-peg ?d ?from)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      ; advance stage
      (not (current ?s))
      (current ?s2)

      ; remove old placement/top at source peg
      (not (on-peg ?d ?from))
      (not (top ?d ?from))

      ; source peg becomes empty
      (empty ?from)

      ; place disk on target peg and update target top/empty
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
    )
  )

  ; Move a disk that is directly on a peg to be on top of another disk on a (non-empty) target peg.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (top ?d ?from)
      (on-peg ?d ?from)
      (top ?below ?to)
      (smaller ?d ?below)
      (not (= ?from ?to))
    )
    :effect (and
      ; advance stage
      (not (current ?s))
      (current ?s2)

      ; remove old placement/top at source peg
      (not (on-peg ?d ?from))
      (not (top ?d ?from))

      ; source peg becomes empty
      (empty ?from)

      ; place moved disk on target disk, update tops
      (on-disk ?d ?below)
      (top ?d ?to)
      (not (top ?below ?to))
    )
  )

  ; Move a disk that is atop another disk to an empty target peg.
  (:action move-disk-to-empty
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (top ?d ?from)
      (on-disk ?d ?below)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      ; advance stage
      (not (current ?s))
      (current ?s2)

      ; remove old on-disk/top at source peg
      (not (on-disk ?d ?below))
      (not (top ?d ?from))

      ; below disk becomes top at source peg
      (top ?below ?from)

      ; place moved disk on target peg and update target top/empty
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
    )
  )

  ; Move a disk that is atop another disk to be atop another disk on a target peg.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?above - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (top ?d ?from)
      (on-disk ?d ?below)
      (top ?above ?to)
      (smaller ?d ?above)
      (not (= ?from ?to))
    )
    :effect (and
      ; advance stage
      (not (current ?s))
      (current ?s2)

      ; remove old on-disk/top at source peg
      (not (on-disk ?d ?below))
      (not (top ?d ?from))

      ; below disk becomes top at source peg
      (top ?below ?from)

      ; place moved disk on target disk and update tops
      (on-disk ?d ?above)
      (top ?d ?to)
      (not (top ?above ?to))
    )
  )
)