(define (domain hanoi-2agents-classical)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    disk peg - support
  )
  (:predicates
    ; on(d, s): disk d is directly on support s (a peg or another disk)
    (on ?d - disk ?s - support)
    ; clear(s): support s has nothing on top (top disk or empty peg)
    (clear ?s - support)
    ; smaller(x, y): strict size order, x is smaller than y
    (smaller ?x - disk ?y - disk)
    ; capability restriction: which agent may move which disk
    (can-move ?a - agent ?d - disk)
  )

  ; Move a clear disk from some support onto an empty peg
  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - support ?p - peg)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (clear ?from)
      (not (clear ?p))
    )
  )

  ; Move a clear disk from some support onto the top of a clear larger disk
  (:action move-to-disk
    :parameters (?a - agent ?d - disk ?from - support ?t - disk)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (clear ?from)
      (not (clear ?t))
    )
  )
)