(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    (agent ?a - agent)
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?p - disk)
    (top ?d - disk)
    (empty ?p - peg)
    ;; static size ordering: (smaller ?small ?large)
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; move a top disk from a peg to an empty peg
  (:action move-from-peg-to-peg
    :parameters (?ag - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (agent ?ag)
      (on-peg ?d ?from)
      (top ?d)
      (empty ?to)
      (not (on-peg ?d ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  ;; move a top disk from a peg onto a top disk (destination must be larger)
  (:action move-from-peg-to-disk
    :parameters (?ag - agent ?d - disk ?from - peg ?to - disk)
    :precondition (and
      (agent ?ag)
      (on-peg ?d ?from)
      (top ?d)
      (top ?to)
      (smaller ?d ?to)
      (not (on-disk ?d ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (not (top ?to))
      (empty ?from)
    )
  )

  ;; move a top disk from on top of a disk onto an empty peg
  (:action move-from-disk-to-peg
    :parameters (?ag - agent ?d - disk ?from - disk ?to - peg)
    :precondition (and
      (agent ?ag)
      (on-disk ?d ?from)
      (top ?d)
      (empty ?to)
      (not (on-peg ?d ?to))
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (not (empty ?to))
      (top ?from)
    )
  )

  ;; move a top disk from on top of a disk onto another top disk (destination must be larger)
  (:action move-from-disk-to-disk
    :parameters (?ag - agent ?d - disk ?from - disk ?to - disk)
    :precondition (and
      (agent ?ag)
      (on-disk ?d ?from)
      (top ?d)
      (top ?to)
      (smaller ?d ?to)
      (not (on-disk ?d ?to))
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (not (top ?to))
      (top ?from)
    )
  )
)