(define (domain hanoi_multiagent_ordered)
  (:requirements :strips :typing :negative-preconditions)
  (:types object step)

  (:predicates
    (on ?d - object ?s - object)
    (clear ?s - object)
    (smaller ?d1 - object ?d2 - object)
    (agent1_allowed ?d - object)
    (agent2_allowed ?d - object)
    (agent3_allowed ?d - object)
    (ready ?s - step)
  )

  (:action move1_to_peg
    :parameters (?d - object ?from - object ?peg - object ?s - step ?s2 - step)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?peg) (agent1_allowed ?d) (ready ?s))
    :effect (and
      (not (on ?d ?from)) (on ?d ?peg)
      (clear ?from)
      (not (clear ?peg))
      (not (ready ?s)) (ready ?s2)
    )
  )

  (:action move1_to_disk
    :parameters (?d - object ?from - object ?target - object ?s - step ?s2 - step)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?target) (smaller ?d ?target) (agent1_allowed ?d) (ready ?s))
    :effect (and
      (not (on ?d ?from)) (on ?d ?target)
      (clear ?from)
      (not (clear ?target))
      (not (ready ?s)) (ready ?s2)
    )
  )

  (:action move2_to_peg
    :parameters (?d - object ?from - object ?peg - object ?s - step ?s2 - step)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?peg) (agent2_allowed ?d) (ready ?s))
    :effect (and
      (not (on ?d ?from)) (on ?d ?peg)
      (clear ?from)
      (not (clear ?peg))
      (not (ready ?s)) (ready ?s2)
    )
  )

  (:action move2_to_disk
    :parameters (?d - object ?from - object ?target - object ?s - step ?s2 - step)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?target) (smaller ?d ?target) (agent2_allowed ?d) (ready ?s))
    :effect (and
      (not (on ?d ?from)) (on ?d ?target)
      (clear ?from)
      (not (clear ?target))
      (not (ready ?s)) (ready ?s2)
    )
  )

  (:action move3_to_peg
    :parameters (?d - object ?from - object ?peg - object ?s - step ?s2 - step)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?peg) (agent3_allowed ?d) (ready ?s))
    :effect (and
      (not (on ?d ?from)) (on ?d ?peg)
      (clear ?from)
      (not (clear ?peg))
      (not (ready ?s)) (ready ?s2)
    )
  )

  (:action move3_to_disk
    :parameters (?d - object ?from - object ?target - object ?s - step ?s2 - step)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?target) (smaller ?d ?target) (agent3_allowed ?d) (ready ?s))
    :effect (and
      (not (on ?d ?from)) (on ?d ?target)
      (clear ?from)
      (not (clear ?target))
      (not (ready ?s)) (ready ?s2)
    )
  )
)