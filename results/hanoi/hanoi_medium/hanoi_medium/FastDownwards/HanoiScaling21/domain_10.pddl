(define (domain hanoi-5-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-disk ?d - disk ?below - disk)    ; disk ?d is directly on disk ?below
    (on-peg ?d - disk ?p - peg)          ; disk ?d is directly on peg ?p
    (top ?d - disk)                      ; disk ?d has nothing above it
    (smaller ?d1 - disk ?d2 - disk)      ; d1 is smaller than d2
    (peg-empty ?p - peg)                 ; peg has no disks
    (at-stage ?s - stage)                ; current active stage
    (next ?s1 - stage ?s2 - stage)       ; successor relation between stages
  )

  ;; move a top disk that is on another disk onto another disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s-next - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s-next)
      (on-disk ?d ?from)
      (top ?d)
      (top ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (not (top ?to))
      (top ?d)
      (top ?from)
      (not (at-stage ?s))
      (at-stage ?s-next)
    )
  )

  ;; move a top disk that is on another disk onto an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?p - peg ?s - stage ?s-next - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s-next)
      (on-disk ?d ?from)
      (top ?d)
      (peg-empty ?p)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?p)
      (not (peg-empty ?p))
      (top ?d)
      (top ?from)
      (not (at-stage ?s))
      (at-stage ?s-next)
    )
  )

  ;; move a top disk that is on a peg onto another disk
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s-next - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s-next)
      (on-peg ?d ?from)
      (top ?d)
      (top ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (not (top ?to))
      (top ?d)
      (peg-empty ?from)
      (not (at-stage ?s))
      (at-stage ?s-next)
    )
  )

  ;; move a top disk that is on a peg onto an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s-next - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s-next)
      (on-peg ?d ?from)
      (top ?d)
      (peg-empty ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (peg-empty ?from)
      (not (peg-empty ?to))
      (top ?d)
      (not (at-stage ?s))
      (at-stage ?s-next)
    )
  )
)