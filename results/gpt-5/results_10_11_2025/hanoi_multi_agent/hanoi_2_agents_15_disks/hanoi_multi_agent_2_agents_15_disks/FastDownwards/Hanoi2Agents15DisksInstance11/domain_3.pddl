(define (domain hanoi-2agents-classical-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    stage
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
    ; discrete stage progression
    (current ?t - stage)
    (next ?t - stage ?u - stage)
  )

  ; Move a clear disk from some support onto an empty peg, advancing one stage
  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - support ?p - peg ?t - stage ?u - stage)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
      (current ?t)
      (next ?t ?u)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (clear ?from)
      (not (clear ?p))
      (not (current ?t))
      (current ?u)
    )
  )

  ; Move a clear disk from some support onto the top of a clear larger disk, advancing one stage
  (:action move-to-disk
    :parameters (?a - agent ?d - disk ?from - support ?tgt - disk ?t - stage ?u - stage)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?tgt)
      (smaller ?d ?tgt)
      (current ?t)
      (next ?t ?u)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?tgt)
      (clear ?from)
      (not (clear ?tgt))
      (not (current ?t))
      (current ?u)
    )
  )
)