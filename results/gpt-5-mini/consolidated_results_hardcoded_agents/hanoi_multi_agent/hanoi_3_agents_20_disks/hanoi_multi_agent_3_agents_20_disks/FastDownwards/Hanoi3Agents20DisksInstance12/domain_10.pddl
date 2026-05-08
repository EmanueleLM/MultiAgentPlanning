(define (domain hanoi_multiagent_ordered)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (on ?d - object ?x - object)
    (clear ?x - object)
    (smaller ?d1 - object ?d2 - object)
    (agent1_allowed ?d - object)
    (agent2_allowed ?d - object)
    (agent3_allowed ?d - object)
    (peg ?p - object)
  )

  ;; Agent 1 actions (disks A..G)
  (:action move1-to-peg
    :parameters (?d - object ?from - object ?to - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (peg ?to)
      (agent1_allowed ?d)
    )
    :effect (and
      (not (on ?d ?from)) (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move1-to-disk
    :parameters (?d - object ?from - object ?target - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?target)
      (smaller ?d ?target)
      (not (peg ?target))
      (agent1_allowed ?d)
    )
    :effect (and
      (not (on ?d ?from)) (on ?d ?target)
      (clear ?from)
      (not (clear ?target))
    )
  )

  ;; Agent 2 actions (disks H..N)
  (:action move2-to-peg
    :parameters (?d - object ?from - object ?to - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (peg ?to)
      (agent2_allowed ?d)
    )
    :effect (and
      (not (on ?d ?from)) (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move2-to-disk
    :parameters (?d - object ?from - object ?target - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?target)
      (smaller ?d ?target)
      (not (peg ?target))
      (agent2_allowed ?d)
    )
    :effect (and
      (not (on ?d ?from)) (on ?d ?target)
      (clear ?from)
      (not (clear ?target))
    )
  )

  ;; Agent 3 actions (disks O..T)
  (:action move3-to-peg
    :parameters (?d - object ?from - object ?to - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (peg ?to)
      (agent3_allowed ?d)
    )
    :effect (and
      (not (on ?d ?from)) (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move3-to-disk
    :parameters (?d - object ?from - object ?target - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?target)
      (smaller ?d ?target)
      (not (peg ?target))
      (agent3_allowed ?d)
    )
    :effect (and
      (not (on ?d ?from)) (on ?d ?target)
      (clear ?from)
      (not (clear ?target))
    )
  )
)