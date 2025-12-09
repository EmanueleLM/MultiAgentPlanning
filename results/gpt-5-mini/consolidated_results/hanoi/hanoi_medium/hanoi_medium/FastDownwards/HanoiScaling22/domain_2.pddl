(define (domain hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk d is directly on top of disk s
    (on-disk ?d - disk ?s - disk)
    ;; disk d is directly on top of peg p
    (on-peg ?d - disk ?p - peg)

    ;; top-ness / emptiness predicates
    (clear-disk ?d - disk)    ; nothing on top of this disk
    (clear-peg ?p - peg)      ; peg has no disk directly on it

    ;; strict size ordering: smaller ?d1 ?d2 means ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; explicit staged progression (discrete time steps)
    (at-stage ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  ;; Move a top disk from a peg to another peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
      ;; moving a top disk preserves that it has nothing on top
      (clear-disk ?d)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk from a peg to be on top of another disk
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?support - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?support)
      (smaller ?d ?support)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?support)
      (clear-peg ?from)
      (not (clear-disk ?support))
      (clear-disk ?d)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk from atop another disk to a peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      ;; the disk that supported ?d becomes clear
      (clear-disk ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk from atop one disk to atop another disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)