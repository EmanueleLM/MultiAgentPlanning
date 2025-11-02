(define (domain hanoi-3agents-20)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk1 disk2 disk3 - disk
    disk - place
    peg - place
    place
  )
  (:predicates
    (on ?d - disk ?p - place)    ; disk directly on place (disk or peg)
    (clear ?p - place)           ; nothing on top of this place (disk top or empty peg)
    (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
  )

  ;; agent 1 actions: can move disks A..G (disk1)
  (:action move_agent_1_to_peg
    :parameters (?d - disk1 ?from - place ?to - peg)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (not (= ?from ?to)))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent_1_to_disk
    :parameters (?d - disk1 ?from - place ?to - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to) (not (= ?from ?to)))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; agent 2 actions: can move disks H..N (disk2)
  (:action move_agent_2_to_peg
    :parameters (?d - disk2 ?from - place ?to - peg)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (not (= ?from ?to)))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent_2_to_disk
    :parameters (?d - disk2 ?from - place ?to - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to) (not (= ?from ?to)))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; agent 3 actions: can move disks O..T (disk3)
  (:action move_agent_3_to_peg
    :parameters (?d - disk3 ?from - place ?to - peg)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (not (= ?from ?to)))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent_3_to_disk
    :parameters (?d - disk3 ?from - place ?to - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to) (not (= ?from ?to)))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)