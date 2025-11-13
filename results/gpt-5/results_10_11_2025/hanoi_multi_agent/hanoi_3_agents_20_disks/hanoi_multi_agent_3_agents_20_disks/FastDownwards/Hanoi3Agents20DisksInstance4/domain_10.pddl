(define (domain hanoi-3agents-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    support
    peg - support
    disk - support
    disk_ag - disk
    disk_hn - disk
    disk_ot - disk
    stage
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - support)
    (at ?s - stage)
    (next ?s - stage ?t - stage)
    (allowed ?d - disk ?from - support ?to - support ?s - stage)
  )
  (:action move-agent_1
    :parameters (?d - disk_ag ?from - support ?to - support ?s - stage ?t - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (at ?s)
      (next ?s ?t)
      (allowed ?d ?from ?to ?s)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?s))
      (at ?t)
    )
  )
  (:action move-agent_2
    :parameters (?d - disk_hn ?from - support ?to - support ?s - stage ?t - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (at ?s)
      (next ?s ?t)
      (allowed ?d ?from ?to ?s)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?s))
      (at ?t)
    )
  )
  (:action move-agent_3
    :parameters (?d - disk_ot ?from - support ?to - support ?s - stage ?t - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (at ?s)
      (next ?s ?t)
      (allowed ?d ?from ?to ?s)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?s))
      (at ?t)
    )
  )
)