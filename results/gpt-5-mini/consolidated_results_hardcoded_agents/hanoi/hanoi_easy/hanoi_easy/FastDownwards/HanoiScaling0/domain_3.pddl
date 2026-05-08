(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk ?d is directly on peg ?p
    (on-disk ?d - disk ?below - disk)  ; disk ?d is directly on top of disk ?below
    (clear-peg ?p - peg)               ; peg ?p currently has no disk on top
    (clear-disk ?d - disk)             ; disk ?d currently has no disk on top
    (smaller ?x - disk ?y - disk)      ; static size ordering: ?x is smaller than ?y
    (at-stage ?s - stage)              ; current discrete stage
    (succ ?s1 - stage ?s2 - stage)     ; stage ordering relation
  )

  ;; move top disk that is directly on a peg to another empty peg
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
    )
  )

  ;; move top disk that is directly on a peg onto the top of another disk
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

  ;; move top disk that is directly on another disk to an empty peg
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

  ;; move top disk that is directly on another disk onto the top of a different disk
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