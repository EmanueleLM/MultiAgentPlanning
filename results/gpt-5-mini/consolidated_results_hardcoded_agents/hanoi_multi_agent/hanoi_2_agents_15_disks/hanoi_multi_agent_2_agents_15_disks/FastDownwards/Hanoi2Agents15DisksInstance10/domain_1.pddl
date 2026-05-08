(define (domain multi-agent-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg place)

  (:predicates
    (on ?d - disk ?p - place)            ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)                  ; place ?p has nothing on top
    (can-move-agent1 ?d - disk)         ; agent_1 is permitted to move disk ?d
    (can-move-agent2 ?d - disk)         ; agent_2 is permitted to move disk ?d
    (smaller ?d1 - disk ?d2 - disk)     ; disk d1 is smaller than disk d2
  )

  ;; agent_1 moving a disk to an empty peg
  (:action move-agent1-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move-agent1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?d)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; agent_1 moving a disk onto another disk (destination disk ?to must be larger)
  (:action move-agent1-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move-agent1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?d)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; agent_2 moving a disk to an empty peg
  (:action move-agent2-to-peg
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
      (clear ?d)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; agent_2 moving a disk onto another disk (destination disk ?to must be larger)
  (:action move-agent2-to-disk
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
      (clear ?d)
      (not (clear ?to))
      (clear ?from)
    )
  )
)