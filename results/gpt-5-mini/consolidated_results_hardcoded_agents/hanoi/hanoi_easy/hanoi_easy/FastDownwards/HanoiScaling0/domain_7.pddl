(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk ?d is directly on peg ?p (no disk directly below it)
    (on-disk ?d - disk ?below - disk)  ; disk ?d is directly on top of disk ?below
    (clear-peg ?p - peg)               ; peg ?p has no disk directly on it (empty)
    (clear-disk ?d - disk)             ; disk ?d has no disk on top of it (is top on its peg/stack)
    (smaller ?x - disk ?y - disk)      ; ?x is strictly smaller than ?y (static)
    (at-stage ?s - stage)              ; current discrete stage/time
    (succ ?s1 - stage ?s2 - stage)     ; immediate successor relation between stages
  )

  ;; Move a top disk that is directly on a peg to an empty peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s) (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (not (= ?from ?to))
    )
    :effect (and
      ;; advance stage (consumed/produced to enforce one action per stage)
      (not (at-stage ?s)) (at-stage ?s2)

      ;; disk relocation
      (not (on-peg ?d ?from)) (on-peg ?d ?to)

      ;; peg occupancy updates
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
      (not (= ?d ?to))
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
      (not (= ?d ?from))
    )
    :effect (and
      (not (at-stage ?s)) (at-stage ?s2)

      (not (on-disk ?d ?from)) (on-peg ?d ?to)

      ;; disk below becomes top
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
      (not (= ?d ?from)) (not (= ?d ?to)) (not (= ?from ?to))
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