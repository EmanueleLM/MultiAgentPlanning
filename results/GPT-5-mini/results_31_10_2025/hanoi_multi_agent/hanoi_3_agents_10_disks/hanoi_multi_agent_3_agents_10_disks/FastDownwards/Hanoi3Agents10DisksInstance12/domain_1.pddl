(define (domain hanoi-3agents-10disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types place peg disk)
  ;; pegs and disks are both of type place (peg - place, disk - place)
  (:predicates
    (on ?d - disk ?p - place)        ; disk d is immediately on place p (peg or disk)
    (clear ?p - place)               ; nothing on top of place p (peg or disk)
    (can-place ?d - disk ?p - place) ; disk d may be placed on place p (peg or a larger disk)
    (agent1_allowed ?d - disk)       ; disk can be moved by agent_1
    (agent2_allowed ?d - disk)       ; disk can be moved by agent_2
    (agent3_allowed ?d - disk)       ; disk can be moved by agent_3
  )

  ;; agent_1 moves (disks A..D)
  (:action move-agent1
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (agent1_allowed ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; agent_2 moves (disks E..G)
  (:action move-agent2
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (agent2_allowed ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; agent_3 moves (disks H..J)
  (:action move-agent3
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (agent3_allowed ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
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