(define (domain hanoi-multiagent-classical)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent
    support
    disk peg - support
  )

  (:predicates
    (on ?d - disk ?s - support)        ; disk ?d is directly on support ?s (either a peg or another disk)
    (clear ?s - support)               ; support ?s has nothing on it (peg empty or disk top-of-stack)
    (smaller ?x - disk ?y - disk)      ; strict size order: x is smaller than y
    (can-move ?a - agent ?d - disk)    ; capability restriction: which agent may move which disk
  )

  ; Move a clear disk onto an empty peg
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

  ; Move a clear disk onto the top of another clear disk, respecting size order
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