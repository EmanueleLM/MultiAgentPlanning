(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place
          step)
  (:predicates
    (on ?d - disk ?p - place)               ; disk d is directly on place p (disk or peg)
    (clear ?p - place)                     ; nothing is directly on place p
    (smaller ?d1 - disk ?d2 - disk)        ; d1 is strictly smaller than d2
    (can-move-agent1 ?d - disk)            ; agent_1 is allowed to move this disk
    (can-move-agent2 ?d - disk)            ; agent_2 is allowed to move this disk
    (required-order ?s - step ?d - disk ?from - place ?to - place) ; required move for step s
    (current-step ?s - step)               ; which sequencing step is currently active
    (next ?s - step ?s2 - step)            ; successor relation between steps
  )

  ;; Agent 1: moves disks in its allowed set, and is constrained to perform required moves in order.
  (:action agent1-move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?snext - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move-agent1 ?d)
      (required-order ?s ?d ?from ?to)
      (current-step ?s)
      (next ?s ?snext)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  (:action agent1-move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step ?snext - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move-agent1 ?d)
      (required-order ?s ?d ?from ?to)
      (current-step ?s)
      (next ?s ?snext)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Agent 2: may move disks in its allowed set, freely (no required-order constraints).
  (:action agent2-move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  (:action agent2-move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )
)