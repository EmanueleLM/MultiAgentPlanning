(define (domain hanoi-5-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object stage)

  (:predicates
    ; disk is directly on an object (another disk or a peg)
    (on ?d - disk ?x - object)
    ; disk has no disk above it (is top of its stack)
    (top ?d - disk)
    ; peg has no disks on it
    (peg-empty ?p - peg)
    ; size ordering: smaller d1 than d2
    (smaller ?d1 - disk ?d2 - disk)
    ; discrete stage/time bookkeeping
    (at-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk that sits on one disk onto another disk (both source and destination are disks)
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s-next - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s-next)
      (on ?d ?from)
      (top ?d)
      (top ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?to))
      (top ?d)
      (top ?from)
      (not (at-stage ?s))
      (at-stage ?s-next)
    )
  )

  ;; Move a top disk that sits on a disk onto an empty peg
  (:action move-disk-to-empty-peg
    :parameters (?d - disk ?from - disk ?p - peg ?s - stage ?s-next - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s-next)
      (on ?d ?from)
      (top ?d)
      (peg-empty ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (not (peg-empty ?p))
      (top ?d)
      (top ?from)
      (not (at-stage ?s))
      (at-stage ?s-next)
    )
  )

  ;; Move a top disk that sits on a peg onto a disk
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s-next - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s-next)
      (on ?d ?from)
      (top ?d)
      (top ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?to))
      (top ?d)
      (peg-empty ?from)
      (not (at-stage ?s))
      (at-stage ?s-next)
    )
  )

  ;; Move a top disk that sits on a peg onto an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s-next - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s-next)
      (on ?d ?from)
      (top ?d)
      (peg-empty ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (peg-empty ?from)
      (not (peg-empty ?to))
      (top ?d)
      (not (at-stage ?s))
      (at-stage ?s-next)
    )
  )
)