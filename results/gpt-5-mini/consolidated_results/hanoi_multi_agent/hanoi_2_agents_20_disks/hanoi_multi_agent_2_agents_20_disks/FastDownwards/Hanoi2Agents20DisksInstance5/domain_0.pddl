(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk peg - object
    disk_s disk_l - disk
  )

  (:predicates
    (on ?d - disk ?x - object)        ; disk ?d is immediately on object ?x (disk or peg)
    (clear ?x - object)              ; nothing is on top of object ?x
    (smaller ?a - object ?b - object) ; ?a is strictly smaller than ?b
  )

  ;; Agent 1 may only move small disks (A-J)
  (:action move-agent_1
    :parameters (?d - disk_s ?from - object ?to - object)
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

  ;; Agent 2 may only move large disks (K-T)
  (:action move-agent_2
    :parameters (?d - disk_l ?from - object ?to - object)
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