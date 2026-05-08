(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg place) ;; peg and disk are subtypes of place in object declarations below

  (:predicates
    (on ?d - disk ?p - place)               ;; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)                     ;; place ?p has no disk on top
    (smaller ?d1 - disk ?d2 - disk)        ;; ?d1 is smaller than ?d2
    (can-move-a1 ?d - disk)                ;; agent 1 may move ?d
    (can-move-a2 ?d - disk)                ;; agent 2 may move ?d
    (can-move-a3 ?d - disk)                ;; agent 3 may move ?d
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Agent 1 actions (can move disks A B C D E F G)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Move a disk to a peg by agent 1
  (:action move-to-peg-agent1
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (can-move-a1 ?d)
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

  ;; Move a disk onto another disk by agent 1 (only allowed if ?d is smaller than ?to)
  (:action move-to-disk-agent1
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (can-move-a1 ?d)
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

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Agent 2 actions (can move disks H I J K L M N)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:action move-to-peg-agent2
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (can-move-a2 ?d)
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

  (:action move-to-disk-agent2
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (can-move-a2 ?d)
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

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Agent 3 actions (can move disks O P Q R S T)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:action move-to-peg-agent3
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (can-move-a3 ?d)
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

  (:action move-to-disk-agent3
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (can-move-a3 ?d)
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