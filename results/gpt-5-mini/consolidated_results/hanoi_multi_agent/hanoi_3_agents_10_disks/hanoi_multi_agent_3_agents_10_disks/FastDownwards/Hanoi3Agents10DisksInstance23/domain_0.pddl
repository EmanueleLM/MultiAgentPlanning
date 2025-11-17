(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - location)

  (:predicates
    (on ?d - disk ?loc - location)         ; disk ?d is directly on location ?loc (disk or peg)
    (clear ?loc - location)                ; ?loc has nothing directly on it
    (smaller ?d1 - disk ?d2 - disk)        ; ?d1 is smaller than ?d2
    (can-move-agent1 ?d - disk)
    (can-move-agent2 ?d - disk)
    (can-move-agent3 ?d - disk)
  )

  ;; Agent 1 actions: may move A B C D
  (:action move-agent1-to-peg
    :parameters (?d - disk ?from - location ?peg - peg)
    :precondition (and (can-move-agent1 ?d) (on ?d ?from) (clear ?d) (clear ?peg))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (not (clear ?peg))
      (clear ?from)
    )
  )

  (:action move-agent1-to-disk
    :parameters (?d - disk ?from - location ?dst - disk)
    :precondition (and (can-move-agent1 ?d) (on ?d ?from) (clear ?d) (clear ?dst) (smaller ?d ?dst))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?dst)
      (not (clear ?dst))
      (clear ?from)
    )
  )

  ;; Agent 2 actions: may move E F G
  (:action move-agent2-to-peg
    :parameters (?d - disk ?from - location ?peg - peg)
    :precondition (and (can-move-agent2 ?d) (on ?d ?from) (clear ?d) (clear ?peg))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (not (clear ?peg))
      (clear ?from)
    )
  )

  (:action move-agent2-to-disk
    :parameters (?d - disk ?from - location ?dst - disk)
    :precondition (and (can-move-agent2 ?d) (on ?d ?from) (clear ?d) (clear ?dst) (smaller ?d ?dst))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?dst)
      (not (clear ?dst))
      (clear ?from)
    )
  )

  ;; Agent 3 actions: may move H I J
  (:action move-agent3-to-peg
    :parameters (?d - disk ?from - location ?peg - peg)
    :precondition (and (can-move-agent3 ?d) (on ?d ?from) (clear ?d) (clear ?peg))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (not (clear ?peg))
      (clear ?from)
    )
  )

  (:action move-agent3-to-disk
    :parameters (?d - disk ?from - location ?dst - disk)
    :precondition (and (can-move-agent3 ?d) (on ?d ?from) (clear ?d) (clear ?dst) (smaller ?d ?dst))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?dst)
      (not (clear ?dst))
      (clear ?from)
    )
  )
)