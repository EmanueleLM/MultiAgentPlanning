(define (domain hanoi-two-agents-10)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; disk on (either disk or peg)
    (on ?d - disk ?s - (either disk peg))
    ;; nothing directly on ?x (disk or peg)
    (clear ?x - (either disk peg))
    ;; move permissions
    (agent1 ?d - disk)
    (agent2 ?d - disk)
    ;; size ordering: ?big is larger than ?small
    (larger ?big - disk ?small - disk)
  )

  ;; Agent 1 moves (disks A-E)
  (:action move-agent1-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?peg - peg)
    :precondition (and
      (agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?peg)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      ;; source becomes clear (since ?d was the top)
      (clear ?from)
      ;; destination now has a disk directly on it
      (not (clear ?peg))
      ;; moved disk has nothing on it
      (clear ?d)
    )
  )

  (:action move-agent1-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk)
    :precondition (and
      (agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  ;; Agent 2 moves (disks F-J)
  (:action move-agent2-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?peg - peg)
    :precondition (and
      (agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?peg)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)
      (not (clear ?peg))
      (clear ?d)
    )
  )

  (:action move-agent2-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk)
    :precondition (and
      (agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )
)