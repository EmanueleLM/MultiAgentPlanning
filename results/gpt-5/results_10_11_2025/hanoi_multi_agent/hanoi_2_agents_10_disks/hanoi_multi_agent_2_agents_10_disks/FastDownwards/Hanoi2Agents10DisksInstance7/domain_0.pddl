; To run with FastDownward:
; fast-downward.py domain.pddl problem.pddl --search 'astar(lmcut)'

(define (domain hanoi-3peg-ordered)
  (:requirements :strips :typing)
  (:types
    agent
    step
    place
    peg disk - place
  )
  (:predicates
    ; topology
    (on ?d - disk ?p - place)
    (clear ?x - place)
    (smaller ?d1 - disk ?d2 - disk)

    ; permissions
    (allowed ?a - agent ?d - disk)

    ; schedule to enforce the approved ordered moves
    (at-step ?s - step)
    (succ ?s1 - step ?s2 - step)
    (scheduled-peg ?s - step ?a - agent ?d - disk ?from - place ?to - peg)
    (scheduled-disk ?s - step ?a - agent ?d - disk ?from - place ?to - disk)
  )

  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - place ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (at-step ?s)
      (succ ?s ?s2)
      (scheduled-peg ?s ?a ?d ?from ?to)
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)         ; top disk only
      (clear ?to)        ; destination clear
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  (:action move-to-disk
    :parameters (?a - agent ?d - disk ?from - place ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (at-step ?s)
      (succ ?s ?s2)
      (scheduled-disk ?s ?a ?d ?from ?to)
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)         ; top disk only
      (clear ?to)        ; destination clear
      (smaller ?d ?to)   ; size constraint
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)