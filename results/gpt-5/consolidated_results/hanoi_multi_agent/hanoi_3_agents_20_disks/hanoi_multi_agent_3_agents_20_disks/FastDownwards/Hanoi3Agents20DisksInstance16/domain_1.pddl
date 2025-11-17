(define (domain hanoi-3agent-20-coop)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    peg - support
    disk - support
    step
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - support ?y - support)
    (top ?d - disk ?p - peg) ; declared for completeness (not used)
    (at-peg ?d - disk ?p - peg)
    (can-move ?a - agent ?d - disk)
    (support-of ?s - support ?p - peg) ; the current top support on a peg (peg itself if empty)

    ; step-control predicates to enforce the validated order
    (current-step ?s - step)
    (next ?s1 - step ?s2 - step)
    (step-disk ?s - step ?d - disk)
    (step-from ?s - step ?p - peg)
    (step-to ?s - step ?p - peg)
    (step-below ?s - step ?b - support)
  )

  (:action move_agent_1
    :parameters (?d - disk ?from - peg ?to - peg ?sfrom - support ?below - support ?si - step ?sj - step)
    :precondition (and
      (current-step ?si)
      (next ?si ?sj)
      (step-disk ?si ?d)
      (step-from ?si ?from)
      (step-to ?si ?to)
      (step-below ?si ?below)
      (can-move agent_1 ?d)

      ; source legality: top disk on ?from
      (at-peg ?d ?from)
      (on ?d ?sfrom)
      (clear ?d)
      (support-of ?d ?from)

      ; destination legality: place on the current top of ?to
      (support-of ?below ?to)
      (clear ?below)
      (smaller ?d ?below)
    )
    :effect (and
      (not (current-step ?si))
      (current-step ?sj)

      ; remove from source stack
      (not (on ?d ?sfrom))
      (clear ?sfrom)

      ; place on destination
      (on ?d ?below)
      (not (clear ?below))

      ; move peg location
      (not (at-peg ?d ?from))
      (at-peg ?d ?to)

      ; update top-of-peg pointers
      (not (support-of ?d ?from))
      (support-of ?sfrom ?from)
      (not (support-of ?below ?to))
      (support-of ?d ?to)
    )
  )

  (:action move_agent_2
    :parameters (?d - disk ?from - peg ?to - peg ?sfrom - support ?below - support ?si - step ?sj - step)
    :precondition (and
      (current-step ?si)
      (next ?si ?sj)
      (step-disk ?si ?d)
      (step-from ?si ?from)
      (step-to ?si ?to)
      (step-below ?si ?below)
      (can-move agent_2 ?d)

      (at-peg ?d ?from)
      (on ?d ?sfrom)
      (clear ?d)
      (support-of ?d ?from)

      (support-of ?below ?to)
      (clear ?below)
      (smaller ?d ?below)
    )
    :effect (and
      (not (current-step ?si))
      (current-step ?sj)
      (not (on ?d ?sfrom))
      (clear ?sfrom)
      (on ?d ?below)
      (not (clear ?below))
      (not (at-peg ?d ?from))
      (at-peg ?d ?to)
      (not (support-of ?d ?from))
      (support-of ?sfrom ?from)
      (not (support-of ?below ?to))
      (support-of ?d ?to)
    )
  )

  (:action move_agent_3
    :parameters (?d - disk ?from - peg ?to - peg ?sfrom - support ?below - support ?si - step ?sj - step)
    :precondition (and
      (current-step ?si)
      (next ?si ?sj)
      (step-disk ?si ?d)
      (step-from ?si ?from)
      (step-to ?si ?to)
      (step-below ?si ?below)
      (can-move agent_3 ?d)

      (at-peg ?d ?from)
      (on ?d ?sfrom)
      (clear ?d)
      (support-of ?d ?from)

      (support-of ?below ?to)
      (clear ?below)
      (smaller ?d ?below)
    )
    :effect (and
      (not (current-step ?si))
      (current-step ?sj)
      (not (on ?d ?sfrom))
      (clear ?sfrom)
      (on ?d ?below)
      (not (clear ?below))
      (not (at-peg ?d ?from))
      (at-peg ?d ?to)
      (not (support-of ?d ?from))
      (support-of ?sfrom ?from)
      (not (support-of ?below ?to))
      (support-of ?d ?to)
    )
  )
)