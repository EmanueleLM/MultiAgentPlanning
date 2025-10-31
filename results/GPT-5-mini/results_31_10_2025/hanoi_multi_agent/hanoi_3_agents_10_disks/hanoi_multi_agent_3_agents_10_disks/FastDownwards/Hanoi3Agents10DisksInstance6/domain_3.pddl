(define (domain hanoi-3agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk directly on a peg
    (on-disk ?d - disk ?d2 - disk)    ; disk on top of another disk
    (clear-disk ?d - disk)            ; no disk on top of this disk
    (clear-peg ?p - peg)              ; peg has no disk directly on it (empty)
    (smaller ?d1 - disk ?d2 - disk)   ; d1 is smaller than d2 (static)
    (can-move-agent1 ?d - disk)
    (can-move-agent2 ?d - disk)
    (can-move-agent3 ?d - disk)
  )

  ; Agent 1 actions
  (:action agent1-move-from-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and (on-peg ?d ?from) (clear-disk ?d) (clear-peg ?to) (can-move-agent1 ?d))
    :effect (and
              (not (on-peg ?d ?from))
              (not (clear-peg ?to))
              (on-peg ?d ?to)
              (clear-peg ?from)
            )
  )

  (:action agent1-move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and (on-peg ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to) (can-move-agent1 ?d))
    :effect (and
              (not (on-peg ?d ?from))
              (not (clear-disk ?to))
              (on-disk ?d ?to)
              (clear-peg ?from)
            )
  )

  (:action agent1-move-from-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and (on-disk ?d ?from) (clear-disk ?d) (clear-peg ?to) (can-move-agent1 ?d))
    :effect (and
              (not (on-disk ?d ?from))
              (not (clear-peg ?to))
              (on-peg ?d ?to)
              (clear-disk ?from)
            )
  )

  (:action agent1-move-from-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and (on-disk ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to) (can-move-agent1 ?d))
    :effect (and
              (not (on-disk ?d ?from))
              (not (clear-disk ?to))
              (on-disk ?d ?to)
              (clear-disk ?from)
            )
  )

  ; Agent 2 actions
  (:action agent2-move-from-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and (on-peg ?d ?from) (clear-disk ?d) (clear-peg ?to) (can-move-agent2 ?d))
    :effect (and
              (not (on-peg ?d ?from))
              (not (clear-peg ?to))
              (on-peg ?d ?to)
              (clear-peg ?from)
            )
  )

  (:action agent2-move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and (on-peg ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to) (can-move-agent2 ?d))
    :effect (and
              (not (on-peg ?d ?from))
              (not (clear-disk ?to))
              (on-disk ?d ?to)
              (clear-peg ?from)
            )
  )

  (:action agent2-move-from-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and (on-disk ?d ?from) (clear-disk ?d) (clear-peg ?to) (can-move-agent2 ?d))
    :effect (and
              (not (on-disk ?d ?from))
              (not (clear-peg ?to))
              (on-peg ?d ?to)
              (clear-disk ?from)
            )
  )

  (:action agent2-move-from-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and (on-disk ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to) (can-move-agent2 ?d))
    :effect (and
              (not (on-disk ?d ?from))
              (not (clear-disk ?to))
              (on-disk ?d ?to)
              (clear-disk ?from)
            )
  )

  ; Agent 3 actions
  (:action agent3-move-from-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and (on-peg ?d ?from) (clear-disk ?d) (clear-peg ?to) (can-move-agent3 ?d))
    :effect (and
              (not (on-peg ?d ?from))
              (not (clear-peg ?to))
              (on-peg ?d ?to)
              (clear-peg ?from)
            )
  )

  (:action agent3-move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and (on-peg ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to) (can-move-agent3 ?d))
    :effect (and
              (not (on-peg ?d ?from))
              (not (clear-disk ?to))
              (on-disk ?d ?to)
              (clear-peg ?from)
            )
  )

  (:action agent3-move-from-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and (on-disk ?d ?from) (clear-disk ?d) (clear-peg ?to) (can-move-agent3 ?d))
    :effect (and
              (not (on-disk ?d ?from))
              (not (clear-peg ?to))
              (on-peg ?d ?to)
              (clear-disk ?from)
            )
  )

  (:action agent3-move-from-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and (on-disk ?d ?from) (clear-disk ?d) (clear-disk ?to) (smaller ?d ?to) (can-move-agent3 ?d))
    :effect (and
              (not (on-disk ?d ?from))
              (not (clear-disk ?to))
              (on-disk ?d ?to)
              (clear-disk ?from)
            )
  )
)