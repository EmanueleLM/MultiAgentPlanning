(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types support peg disk)
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?d1 - disk ?d2 - disk)
    (largest ?d - disk)
    (is-target ?p - peg)
    (is-source ?p - peg)
    (moved-disk6)
  )

  ; Move a non-largest disk onto another disk (must be smaller than destination disk)
  (:action move-to-disk
    :parameters (?d - disk ?from - support ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (on ?d ?to))
      (not (largest ?d))
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (not (clear ?to))
      (on ?d ?to)
      (clear ?from)
    )
  )

  ; Move a non-largest disk to a peg that is NOT the target (pegL) - allowed in Phase A
  (:action move-to-peg-nontarget
    :parameters (?d - disk ?from - support ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (on ?d ?to))
      (not (largest ?d))
      (not (is-target ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (not (clear ?to))
      (on ?d ?to)
      (clear ?from)
    )
  )

  ; Move a non-largest disk to the target peg (pegL) - only allowed after disk6 has been moved
  (:action move-to-peg-target
    :parameters (?d - disk ?from - support ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (on ?d ?to))
      (not (largest ?d))
      (is-target ?to)
      (moved-disk6)
    )
    :effect (and
      (not (on ?d ?from))
      (not (clear ?to))
      (on ?d ?to)
      (clear ?from)
    )
  )

  ; Special, unique action to move the largest disk (disk6) from the designated source (pegR) to the designated target (pegL).
  ; This action is the only way disk6 may be moved and enforces that the five smaller disks are stacked on pegM in correct order (block A completed).
  (:action move-largest-disk6-R-to-L
    :parameters (?from - support ?to - peg)
    :precondition (and
      (on disk6 ?from)
      (clear disk6)
      (clear ?to)
      (not (on disk6 ?to))
      (is-source ?from)
      (is-target ?to)
      ; Require the full ordered stack of disks 1..5 on pegM before moving disk6
      (on disk5 pegM)
      (on disk4 disk5)
      (on disk3 disk4)
      (on disk2 disk3)
      (on disk1 disk2)
    )
    :effect (and
      (not (on disk6 ?from))
      (not (clear ?to))
      (on disk6 ?to)
      (clear ?from)
      (moved-disk6)
    )
  )
)