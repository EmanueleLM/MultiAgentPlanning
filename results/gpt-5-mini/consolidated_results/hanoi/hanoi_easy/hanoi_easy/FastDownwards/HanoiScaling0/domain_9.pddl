(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; ?d is directly on peg ?p
    (on-disk ?d - disk ?below - disk)  ; ?d is directly on top of disk ?below
    (clear-peg ?p - peg)               ; peg ?p currently has no disk directly on it
    (clear-disk ?d - disk)             ; disk ?d has no disk on top of it (is top)
    (smaller ?x - disk ?y - disk)      ; static size ordering: ?x is smaller than ?y
    (at-stage ?s - stage)              ; marker for the current discrete stage
    (succ ?s1 - stage ?s2 - stage)     ; immediate successor relation between stages
    (same-peg ?p1 - peg ?p2 - peg)     ; equality relation for pegs (only reflexives initialized)
    (same-disk ?d1 - disk ?d2 - disk)  ; equality relation for disks (only reflexives initialized)
  )

  ;; Move a top disk that is directly on a peg to another empty peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s) (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (not (same-peg ?from ?to))
    )
    :effect (and
      ;; advance stage
      (not (at-stage ?s)) (at-stage ?s2)

      ;; relocate disk
      (not (on-peg ?d ?from)) (on-peg ?d ?to)

      ;; update clears: source peg becomes empty; target peg is no longer empty
      (clear-peg ?from)
      (not (clear-peg ?to))
    )
  )

  ;; Move a top disk that is directly on a peg onto another top disk (must be larger).
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s) (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (not (same-disk ?d ?to))
    )
    :effect (and
      (not (at-stage ?s)) (at-stage ?s2)

      (not (on-peg ?d ?from)) (on-disk ?d ?to)

      (clear-peg ?from)
      (not (clear-disk ?to))
    )
  )

  ;; Move a top disk that is on top of another disk onto an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s) (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (not (same-disk ?d ?from))
    )
    :effect (and
      (not (at-stage ?s)) (at-stage ?s2)

      (not (on-disk ?d ?from)) (on-peg ?d ?to)

      ;; disk below becomes top; target peg is no longer empty
      (clear-disk ?from)
      (not (clear-peg ?to))
    )
  )

  ;; Move a top disk that is on top of another disk onto another top disk (must be larger).
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s) (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (not (same-disk ?d ?to))
      (not (same-disk ?from ?to))
    )
    :effect (and
      (not (at-stage ?s)) (at-stage ?s2)

      (not (on-disk ?d ?from)) (on-disk ?d ?to)

      ;; disk below becomes top; target disk is no longer top
      (clear-disk ?from)
      (not (clear-disk ?to))
    )
  )
)