(define (domain hanoi_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; disk on (either a disk or a peg)
    (on ?d - disk ?s - (either disk peg))
    ;; nothing on top of this disk or peg
    (clear ?x - (either disk peg))
    ;; static size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; agent permissions
    (can-move1 ?d - disk)
    (can-move2 ?d - disk)
    (can-move3 ?d - disk)
  )

  ;; Agent 1 actions (allowed to move disks A..G)
  (:action agent1-move-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg)
    :precondition (and (can-move1 ?d) (on ?d ?from) (clear ?d) (clear ?to))
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action agent1-move-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk)
    :precondition (and (can-move1 ?d) (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  ;; Agent 2 actions (allowed to move disks H..N)
  (:action agent2-move-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg)
    :precondition (and (can-move2 ?d) (on ?d ?from) (clear ?d) (clear ?to))
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action agent2-move-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk)
    :precondition (and (can-move2 ?d) (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  ;; Agent 3 actions (allowed to move disks O..T)
  (:action agent3-move-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg)
    :precondition (and (can-move3 ?d) (on ?d ?from) (clear ?d) (clear ?to))
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action agent3-move-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk)
    :precondition (and (can-move3 ?d) (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )
)