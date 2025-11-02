; Target: FastDownward
(define (domain hanoi_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place place)
  (:predicates
    (on ?d - disk ?p - place)       ; disk ?d is directly on place ?p (place = disk or peg)
    (clear ?p - place)             ; place ?p has nothing on top of it
    (smaller ?d - disk ?p - place) ; disk ?d is smaller than place ?p (place can be disk or peg)
  )

  ;; Agent 1 move: move a clear disk from one place to another clear place,
  ;; allowed only if the moving disk is smaller than the target place.
  (:action agent_1_move
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Agent 2 move: identical capability schema but distinct action name (agent-specific)
  (:action agent_2_move
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)