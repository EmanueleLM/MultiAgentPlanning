(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; stacking relations
    (on-peg ?d - disk ?p - peg)      ; disk ?d is directly on peg ?p
    (on-disk ?d - disk ?below - disk) ; disk ?d is directly on top of disk ?below

    ;; top-of support predicates
    (clear-peg ?p - peg)             ; peg ?p currently has no disk on top
    (clear-disk ?d - disk)           ; disk ?d currently has no disk on top

    ;; static size ordering (smaller X Y means X is strictly smaller than Y)
    (smaller ?x - disk ?y - disk)

    ;; explicit stage progression
    (at-stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk from a peg to an empty peg
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
      (clear-peg ?from) (not (clear-peg ?to))
      ;; clear-disk ?d stays true (it remains top)
    )
  )

  ;; Move a top disk from a peg onto a top disk (respecting size order)
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
      (clear-peg ?from) (not (clear-disk ?to))
    )
  )

  ;; Move a top disk from on top of a disk to an empty peg
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
      (clear-disk ?from) (not (clear-peg ?to))
    )
  )

  ;; Move a top disk from on top of a disk to on top of another disk (respecting size order)
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
      (clear-disk ?from) (not (clear-disk ?to))
    )
  )
)