(define (domain hanoi_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent disk peg
  )
  (:predicates
    ; disk location
    (on ?d - disk ?p - peg)

    ; agent permission to move a given disk
    (can-move ?a - agent ?d - disk)

    ; disks permitted to move in this task
    (task-disk ?d - disk)

    ; token that disk is the current top disk on a given peg (for the next enabled move)
    (clear-on-peg ?d - disk ?p - peg)

    ; token that placing this disk onto the given peg is currently legal (for the next enabled move)
    (can-place ?d - disk ?p - peg)

    ; which move (agent,disk,from,to) is currently enabled
    (enabled ?a - agent ?d - disk ?from - peg ?to - peg)

    ; successor control for the exact plan order
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

        ; prepare tokens for the next step (top disk and legal placement)
        (clear-on-peg ?nd ?nfrom)
        (can-place ?nd ?nto)
      )
  )
)