(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (disk or peg)
    (clear ?p - place)              ; nothing is on top of place ?p
    (agent1-disk ?d - disk)         ; disk handled only by agent_1
    (agent2-disk ?d - disk)         ; disk handled only by agent_2
    (smaller ?a - disk ?b - disk)   ; disk ?a is smaller than disk ?b
  )

  ;; Agent 1 actions (moves disks A-J)
  (:action agent1-move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (agent1-disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action agent1-move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (agent1-disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 2 actions (moves disks K-T)
  (:action agent2-move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (agent2-disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action agent2-move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (agent2-disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)