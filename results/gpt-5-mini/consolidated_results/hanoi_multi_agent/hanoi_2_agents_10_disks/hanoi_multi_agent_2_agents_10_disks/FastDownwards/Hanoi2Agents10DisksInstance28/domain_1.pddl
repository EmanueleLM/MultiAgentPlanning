(define (domain hanoi-2agents-10)
  (:requirements :typing :negative-preconditions)
  (:types disk peg)
  (:predicates
    (on ?d - disk ?p - peg)    ; disk ?d is currently on peg ?p
  )

  ;; Agent 1 actions: can move disks A-E only.
  ;; Each action ensures the disk is on the source peg,
  ;; that no smaller disk is on the source (so the disk is top),
  ;; and that no smaller disk is on the destination (so we do not place a larger disk on a smaller).
  (:action agent_1-move-A
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on A ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on A ?from))
      (on A ?to)
    )
  )

  (:action agent_1-move-B
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on B ?from)
      (not (= ?from ?to))
      (not (on A ?from))    ; A is smaller than B => must not be above B on source
      (not (on A ?to))      ; A must not be on destination (would block placing B)
    )
    :effect (and
      (not (on B ?from))
      (on B ?to)
    )
  )

  (:action agent_1-move-C
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on C ?from)
      (not (= ?from ?to))
      (not (on A ?from))
      (not (on B ?from))
      (not (on A ?to))
      (not (on B ?to))
    )
    :effect (and
      (not (on C ?from))
      (on C ?to)
    )
  )

  (:action agent_1-move-D
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on D ?from)
      (not (= ?from ?to))
      (not (on A ?from))
      (not (on B ?from))
      (not (on C ?from))
      (not (on A ?to))
      (not (on B ?to))
      (not (on C ?to))
    )
    :effect (and
      (not (on D ?from))
      (on D ?to)
    )
  )

  (:action agent_1-move-E
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on E ?from)
      (not (= ?from ?to))
      (not (on A ?from))
      (not (on B ?from))
      (not (on C ?from))
      (not (on D ?from))
      (not (on A ?to))
      (not (on B ?to))
      (not (on C ?to))
      (not (on D ?to))
    )
    :effect (and
      (not (on E ?from))
      (on E ?to)
    )
  )

  ;; Agent 2 actions: can move disks F-J only.
  (:action agent_2-move-F
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on F ?from)
      (not (= ?from ?to))
      (not (on A ?from))
      (not (on B ?from))
      (not (on C ?from))
      (not (on D ?from))
      (not (on E ?from))
      (not (on A ?to))
      (not (on B ?to))
      (not (on C ?to))
      (not (on D ?to))
      (not (on E ?to))
    )
    :effect (and
      (not (on F ?from))
      (on F ?to)
    )
  )

  (:action agent_2-move-G
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on G ?from)
      (not (= ?from ?to))
      (not (on A ?from))
      (not (on B ?from))
      (not (on C ?from))
      (not (on D ?from))
      (not (on E ?from))
      (not (on F ?from))
      (not (on A ?to))
      (not (on B ?to))
      (not (on C ?to))
      (not (on D ?to))
      (not (on E ?to))
      (not (on F ?to))
    )
    :effect (and
      (not (on G ?from))
      (on G ?to)
    )
  )

  (:action agent_2-move-H
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on H ?from)
      (not (= ?from ?to))
      (not (on A ?from))
      (not (on B ?from))
      (not (on C ?from))
      (not (on D ?from))
      (not (on E ?from))
      (not (on F ?from))
      (not (on G ?from))
      (not (on A ?to))
      (not (on B ?to))
      (not (on C ?to))
      (not (on D ?to))
      (not (on E ?to))
      (not (on F ?to))
      (not (on G ?to))
    )
    :effect (and
      (not (on H ?from))
      (on H ?to)
    )
  )

  (:action agent_2-move-I
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on I ?from)
      (not (= ?from ?to))
      (not (on A ?from))
      (not (on B ?from))
      (not (on C ?from))
      (not (on D ?from))
      (not (on E ?from))
      (not (on F ?from))
      (not (on G ?from))
      (not (on H ?from))
      (not (on A ?to))
      (not (on B ?to))
      (not (on C ?to))
      (not (on D ?to))
      (not (on E ?to))
      (not (on F ?to))
      (not (on G ?to))
      (not (on H ?to))
    )
    :effect (and
      (not (on I ?from))
      (on I ?to)
    )
  )

  (:action agent_2-move-J
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on J ?from)
      (not (= ?from ?to))
      (not (on A ?from))
      (not (on B ?from))
      (not (on C ?from))
      (not (on D ?from))
      (not (on E ?from))
      (not (on F ?from))
      (not (on G ?from))
      (not (on H ?from))
      (not (on I ?from))
      (not (on A ?to))
      (not (on B ?to))
      (not (on C ?to))
      (not (on D ?to))
      (not (on E ?to))
      (not (on F ?to))
      (not (on G ?to))
      (not (on H ?to))
      (not (on I ?to))
    )
    :effect (and
      (not (on J ?from))
      (on J ?to)
    )
  )
)