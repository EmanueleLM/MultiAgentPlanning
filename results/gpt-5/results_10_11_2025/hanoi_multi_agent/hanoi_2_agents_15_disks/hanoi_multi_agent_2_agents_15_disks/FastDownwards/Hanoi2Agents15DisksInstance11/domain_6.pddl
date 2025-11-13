(define (domain hanoi-2agents-classical-staged-lockedseq-v3)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    stage
    support
    disk peg - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (can-move ?a - agent ?d - disk)
    (current ?t - stage)
    (next ?t - stage ?u - stage)
    (allowed-peg ?t - stage ?a - agent ?d - disk ?from - support ?p - peg)
    (allowed-disk ?t - stage ?a - agent ?d - disk ?from - support ?tgt - disk)
  )
  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - support ?p - peg ?t - stage ?u - stage)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
      (current ?t)
      (next ?t ?u)
      (allowed-peg ?t ?a ?d ?from ?p)
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
      (allowed-disk ?t ?a ?d ?from ?tgt)
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