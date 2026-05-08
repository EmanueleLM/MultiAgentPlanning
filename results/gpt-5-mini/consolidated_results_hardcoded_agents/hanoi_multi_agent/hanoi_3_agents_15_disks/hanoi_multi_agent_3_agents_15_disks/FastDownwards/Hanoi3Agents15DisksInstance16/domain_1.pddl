(define (domain hanoi-3agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    ;; disk on an object (disk or peg)
    (on ?d - disk ?s - object)
    ;; nothing on top of object (disk or peg)
    (clear ?x - object)

    ;; ownership: which agent may move which disk
    (can-move-agent_1 ?d - disk)
    (can-move-agent_2 ?d - disk)
    (can-move-agent_3 ?d - disk)

    ;; size ordering: smaller ?s ?b means ?s is strictly smaller than ?b
    (smaller ?s - disk ?b - disk)
  )

  ;; Agent 1 actions: move a disk that agent_1 is allowed to move
  (:action agent_1-move-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (can-move-agent_1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; after move, destination no longer clear, source becomes clear, moved disk is top (clear)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  (:action agent_1-move-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (can-move-agent_1 ?d)
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
      (clear ?d)
    )
  )

  ;; Agent 2 actions
  (:action agent_2-move-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (can-move-agent_2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  (:action agent_2-move-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (can-move-agent_2 ?d)
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
      (clear ?d)
    )
  )

  ;; Agent 3 actions
  (:action agent_3-move-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (can-move-agent_3 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  (:action agent_3-move-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (can-move-agent_3 ?d)
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
      (clear ?d)
    )
  )
)