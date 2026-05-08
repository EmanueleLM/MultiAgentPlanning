(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    peg - object
    disk - object
    disk_s disk_l - disk
  )

  (:predicates
    ;; disk ?d is immediately on object ?x (disk or peg)
    (on ?d - disk ?x - object)
    ;; nothing is on top of object ?x (object can be peg or disk)
    (clear ?x - object)
    ;; ordering: ?a is strictly smaller than ?b (disks and pegs can appear here; every disk is smaller than every peg)
    (smaller ?a - object ?b - object)
  )

  ;; Agent 1 may move only small disks (A-J)
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

  ;; Agent 2 may move only large disks (K-T)
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