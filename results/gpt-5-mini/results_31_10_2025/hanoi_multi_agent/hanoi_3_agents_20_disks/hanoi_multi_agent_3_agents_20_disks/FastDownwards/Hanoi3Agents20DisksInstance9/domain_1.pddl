(define (domain hanoi-3agents-20)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d1 - disk ?d2 - disk)
    (agent1 ?d - disk)
    (agent2 ?d - disk)
    (agent3 ?d - disk)
  )

  ;; agent_1 actions: can move their disks (A..G)
  (:action move-agent_1-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (agent1 ?d))
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  (:action move-agent_1-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to) (agent1 ?d))
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  ;; agent_2 actions: can move their disks (H..N)
  (:action move-agent_2-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (agent2 ?d))
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  (:action move-agent_2-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to) (agent2 ?d))
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  ;; agent_3 actions: can move their disks (O..T)
  (:action move-agent_3-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (agent3 ?d))
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  (:action move-agent_3-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to) (agent3 ?d))
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )
)