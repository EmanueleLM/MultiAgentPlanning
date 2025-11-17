(define (domain hanoi-2agents-15)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; location predicates: a disk may be directly on a peg or directly on another disk
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?under - disk)

    ;; clear predicates: nothing directly on top of disk/peg
    (clear-disk ?d - disk)
    (clear-peg ?p - peg)

    ;; order and agent capability predicates (static facts go into problem)
    (smaller ?d1 - disk ?d2 - disk)
    (agent1-can ?d - disk)
    (agent2-can ?d - disk)
  )

  ;; Agent 1 actions (can move disks A..H => a..h)
  (:action move-a1-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and (on-peg ?d ?from) (clear-disk ?d) (clear-peg ?to) (agent1-can ?d))
    :effect (and
              (not (on-peg ?d ?from))
              (on-peg ?d ?to)
              (not (clear-peg ?to))
              (clear-peg ?from)
            )
  )

  (:action move-a1-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and (on-peg ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to) (agent1-can ?d))
    :effect (and
              (not (on-peg ?d ?from))
              (on-disk ?d ?to)
              (not (clear-disk ?to))
              (clear-peg ?from)
            )
  )

  (:action move-a1-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and (on-disk ?d ?from) (clear-disk ?d) (clear-peg ?to) (agent1-can ?d))
    :effect (and
              (not (on-disk ?d ?from))
              (on-peg ?d ?to)
              (not (clear-peg ?to))
              (clear-disk ?from)
            )
  )

  (:action move-a1-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and (on-disk ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to) (agent1-can ?d))
    :effect (and
              (not (on-disk ?d ?from))
              (on-disk ?d ?to)
              (not (clear-disk ?to))
              (clear-disk ?from)
            )
  )

  ;; Agent 2 actions (can move disks I..O => i..o)
  (:action move-a2-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and (on-peg ?d ?from) (clear-disk ?d) (clear-peg ?to) (agent2-can ?d))
    :effect (and
              (not (on-peg ?d ?from))
              (on-peg ?d ?to)
              (not (clear-peg ?to))
              (clear-peg ?from)
            )
  )

  (:action move-a2-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and (on-peg ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to) (agent2-can ?d))
    :effect (and
              (not (on-peg ?d ?from))
              (on-disk ?d ?to)
              (not (clear-disk ?to))
              (clear-peg ?from)
            )
  )

  (:action move-a2-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and (on-disk ?d ?from) (clear-disk ?d) (clear-peg ?to) (agent2-can ?d))
    :effect (and
              (not (on-disk ?d ?from))
              (on-peg ?d ?to)
              (not (clear-peg ?to))
              (clear-disk ?from)
            )
  )

  (:action move-a2-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and (on-disk ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to) (agent2-can ?d))
    :effect (and
              (not (on-disk ?d ?from))
              (on-disk ?d ?to)
              (not (clear-disk ?to))
              (clear-disk ?from)
            )
  )
)