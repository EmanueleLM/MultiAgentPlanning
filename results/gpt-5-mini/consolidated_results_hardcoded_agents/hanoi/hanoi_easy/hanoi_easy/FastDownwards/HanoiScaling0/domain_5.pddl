(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk ?d is directly on peg ?p (no disk directly below it)
    (on-disk ?d - disk ?below - disk)  ; disk ?d is directly on top of disk ?below
    (clear-peg ?p - peg)               ; peg ?p has no disk directly on it (empty)
    (clear-disk ?d - disk)             ; disk ?d has no disk on top of it (is top on its peg/stack)
    (smaller ?x - disk ?y - disk)      ; ?x is strictly smaller than ?y
    (at-stage ?s - stage)              ; current discrete stage/time
    (succ ?s1 - stage ?s2 - stage)     ; immediate successor relation between stages
  )

  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s) (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (at-stage ?s)) (at-stage ?s2)

      (not (on-peg ?d ?from)) (on-peg ?d ?to)

      (clear-peg ?from)         ; source peg becomes empty (disk was both top and directly on peg)
      (not (clear-peg ?to))     ; destination peg becomes non-empty
      ;; clear-disk ?d remains true (moved disk is top)
    )
  )

  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s) (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (at-stage ?s)) (at-stage ?s2)

      (not (on-peg ?d ?from)) (on-disk ?d ?to)

      (clear-peg ?from)         ; source peg becomes empty (disk was alone on peg)
      (not (clear-disk ?to))    ; destination disk is no longer top
      ;; moved disk remains clear (top)
    )
  )

  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s) (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (at-stage ?s)) (at-stage ?s2)

      (not (on-disk ?d ?from)) (on-peg ?d ?to)

      (clear-disk ?from)       ; disk below becomes top after removal
      (not (clear-peg ?to))    ; destination peg becomes non-empty
      ;; do NOT set clear-peg ?from here (peg may still have a disk directly on it)
      ;; moved disk remains clear (top)
    )
  )

  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s) (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (at-stage ?s)) (at-stage ?s2)

      (not (on-disk ?d ?from)) (on-disk ?d ?to)

      (clear-disk ?from)       ; disk below becomes top after removal
      (not (clear-disk ?to))   ; destination disk is no longer top
      ;; moved disk remains clear (top)
    )
  )
)