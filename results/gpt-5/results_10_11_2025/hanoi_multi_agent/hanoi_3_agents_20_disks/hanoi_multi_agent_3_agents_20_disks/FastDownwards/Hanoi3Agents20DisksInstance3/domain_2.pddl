(define (domain hanoi-3peg-20disk-agents-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent disk peg stage)
  (:predicates
    ; tower structure
    (on-peg ?d - disk ?p - peg)              ; disk is base of a stack on peg
    (on-disk ?top - disk ?bottom - disk)     ; top is directly on bottom
    (clear ?x - object)                      ; x (disk or peg) has nothing on top / is empty
    (smaller ?x - disk ?y - disk)            ; x is smaller than y

    ; agent permissions
    (can-move ?a - agent ?d - disk)

    ; stage control (explicit ordered progression)
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)

    ; per-stage allowed target (enforces exact plan without oscillation)
    (allowed-to-peg ?s - stage ?a - agent ?d - disk ?p - peg)
    (allowed-to-disk ?s - stage ?a - agent ?d - disk ?dest - disk)
  )

  (:action move-from-peg-to-peg
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (can-move ?a ?d)
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?to)
      (current ?s)
      (next ?s ?s2)
      (allowed-to-peg ?s ?a ?d ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (can-move ?a ?d)
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current ?s)
      (next ?s ?s2)
      (allowed-to-disk ?s ?a ?d ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action move-from-disk-to-peg
    :parameters (?a - agent ?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (can-move ?a ?d)
      (on-disk ?d ?from)
      (clear ?d)
      (clear ?to)
      (current ?s)
      (next ?s ?s2)
      (allowed-to-peg ?s ?a ?d ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action move-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (can-move ?a ?d)
      (on-disk ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current ?s)
      (next ?s ?s2)
      (allowed-to-disk ?s ?a ?d ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )
)