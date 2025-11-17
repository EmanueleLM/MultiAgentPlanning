(define (domain hanoi3agents20)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent support
    disk peg - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (can-move ?a - agent ?d - disk)
  )

  ;; Move a clear disk onto an empty peg
  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - support ?to - peg)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Move a clear disk onto a clear disk that is larger
  (:action move-onto-disk
    :parameters (?a - agent ?d - disk ?from - support ?to - disk)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)