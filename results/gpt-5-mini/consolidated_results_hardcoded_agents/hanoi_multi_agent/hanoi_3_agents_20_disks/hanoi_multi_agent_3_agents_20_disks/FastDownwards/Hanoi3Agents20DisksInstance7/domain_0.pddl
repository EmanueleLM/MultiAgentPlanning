(define (domain hanoi_multiagent)
  (:requirements :strips :typing)
  (:types
    place
    peg disk - place
    disk1 disk2 disk3 - disk
  )

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Agent 1 actions (can move disks A..G, typed disk1)
  (:action agent_1_move-to-peg
    :parameters (?d - disk1 ?from - place ?to - peg)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action agent_1_move-to-disk
    :parameters (?d - disk1 ?from - place ?to - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 2 actions (can move disks H..N, typed disk2)
  (:action agent_2_move-to-peg
    :parameters (?d - disk2 ?from - place ?to - peg)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action agent_2_move-to-disk
    :parameters (?d - disk2 ?from - place ?to - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 3 actions (can move disks O..T, typed disk3)
  (:action agent_3_move-to-peg
    :parameters (?d - disk3 ?from - place ?to - peg)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action agent_3_move-to-disk
    :parameters (?d - disk3 ?from - place ?to - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)