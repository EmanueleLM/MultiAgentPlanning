(define (domain hanoi_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent disk peg
  )
  (:predicates
    ; location of each disk
    (on ?d - disk ?p - peg)

    ; per-agent permission to move a disk
    (can-move ?a - agent ?d - disk)

    ; disks that are allowed to be moved in this task (A..C only)
    (task-disk ?d - disk)

    ; helper: disk is the top disk on a given peg (maintained only as needed for the sequence)
    (clear-on-peg ?d - disk ?p - peg)

    ; helper: it is legal to place disk on target peg in the current step
    (can-place ?d - disk ?p - peg)

    ; sequence-control: which move is currently enabled (agent, disk, from, to)
    (enabled ?a - agent ?d - disk ?from - peg ?to - peg)

    ; sequence successor: the next enabled tuple after applying the current move
    (succ ?a - agent ?d - disk ?from - peg ?to - peg
          ?na - agent ?nd - disk ?nfrom - peg ?nto - peg)
  )

  (:action move
    :parameters
      (?a - agent ?d - disk ?from - peg ?to - peg
       ?na - agent ?nd - disk ?nfrom - peg ?nto - peg)
    :precondition
      (and
        (can-move ?a ?d)
        (task-disk ?d)
        (enabled ?a ?d ?from ?to)
        (succ ?a ?d ?from ?to ?na ?nd ?nfrom ?nto)
        (on ?d ?from)
        (clear-on-peg ?d ?from)
        (can-place ?d ?to)
      )
    :effect
      (and
        (not (on ?d ?from))
        (on ?d ?to)
        (not (enabled ?a ?d ?from ?to))
        (enabled ?na ?nd ?nfrom ?nto)
        ; prepare the next step's top-of-source and placement permission
        (clear-on-peg ?nd ?nfrom)
        (can-place ?nd ?nto)
      )
  )
)