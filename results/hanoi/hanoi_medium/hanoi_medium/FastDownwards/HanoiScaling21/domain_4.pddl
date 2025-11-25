(define (domain hanoi-5-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-disk ?d - disk ?below - disk)   ; disk ?d is directly on disk ?below (i.e., ?d above ?below)
    (on-peg ?d - disk ?p - peg)         ; disk ?d is directly on peg ?p
    (top ?d - disk)                     ; disk ?d has no disk on top of it
    (peg-empty ?p - peg)                ; peg ?p currently has no disk directly on it
    (smaller ?d1 - disk ?d2 - disk)     ; static size ordering: ?d1 is smaller than ?d2
    (at-stage ?s - stage)               ; current global stage is ?s
    (next ?s1 - stage ?s2 - stage)      ; stage successor relation (static)
  )

  (:action move-from-disk-to-disk
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
      (top ?from)
      (not (top ?to))
      (not (at-stage ?s))
      (at-stage ?s-next)
    )
  )

  (:action move-from-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s-next - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s-next)
      (on-disk ?d ?from)
      (top ?d)
      (peg-empty ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (top ?from)
      (not (peg-empty ?to))
      (not (at-stage ?s))
      (at-stage ?s-next)
    )
  )

  (:action move-from-peg-to-disk
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
      (peg-empty ?from)
      (not (top ?to))
      (not (at-stage ?s))
      (at-stage ?s-next)
    )
  )

  (:action move-from-peg-to-peg
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
      (not (at-stage ?s))
      (at-stage ?s-next)
    )
  )
)