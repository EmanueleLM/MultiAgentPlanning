(define (domain two-agent-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?u - disk)
    (clear-disk ?d - disk)
    (clear-peg ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
    (a1disk ?d - disk)
    (a2disk ?d - disk)
  )

  ; Agent 1 actions (disks A-H)
  (:action move-a1-from-peg-to-peg
    :parameters (?d - disk ?p1 - peg ?p2 - peg)
    :precondition (and (a1disk ?d) (on-peg ?d ?p1) (clear-disk ?d) (clear-peg ?p2))
    :effect (and
      (not (on-peg ?d ?p1))
      (on-peg ?d ?p2)
      (clear-peg ?p1)
      (not (clear-peg ?p2))
    )
  )

  (:action move-a1-from-peg-to-disk
    :parameters (?d - disk ?p1 - peg ?u - disk)
    :precondition (and (a1disk ?d) (on-peg ?d ?p1) (clear-disk ?d) (clear-disk ?u) (smaller ?d ?u))
    :effect (and
      (not (on-peg ?d ?p1))
      (on-disk ?d ?u)
      (clear-peg ?p1)
      (not (clear-disk ?u))
    )
  )

  (:action move-a1-from-disk-to-peg
    :parameters (?d - disk ?u - disk ?p2 - peg)
    :precondition (and (a1disk ?d) (on-disk ?d ?u) (clear-disk ?d) (clear-peg ?p2))
    :effect (and
      (not (on-disk ?d ?u))
      (on-peg ?d ?p2)
      (clear-disk ?u)
      (not (clear-peg ?p2))
    )
  )

  (:action move-a1-from-disk-to-disk
    :parameters (?d - disk ?u - disk ?v - disk)
    :precondition (and (a1disk ?d) (on-disk ?d ?u) (clear-disk ?d) (clear-disk ?v) (smaller ?d ?v))
    :effect (and
      (not (on-disk ?d ?u))
      (on-disk ?d ?v)
      (clear-disk ?u)
      (not (clear-disk ?v))
    )
  )

  ; Agent 2 actions (disks I-O)
  (:action move-a2-from-peg-to-peg
    :parameters (?d - disk ?p1 - peg ?p2 - peg)
    :precondition (and (a2disk ?d) (on-peg ?d ?p1) (clear-disk ?d) (clear-peg ?p2))
    :effect (and
      (not (on-peg ?d ?p1))
      (on-peg ?d ?p2)
      (clear-peg ?p1)
      (not (clear-peg ?p2))
    )
  )

  (:action move-a2-from-peg-to-disk
    :parameters (?d - disk ?p1 - peg ?u - disk)
    :precondition (and (a2disk ?d) (on-peg ?d ?p1) (clear-disk ?d) (clear-disk ?u) (smaller ?d ?u))
    :effect (and
      (not (on-peg ?d ?p1))
      (on-disk ?d ?u)
      (clear-peg ?p1)
      (not (clear-disk ?u))
    )
  )

  (:action move-a2-from-disk-to-peg
    :parameters (?d - disk ?u - disk ?p2 - peg)
    :precondition (and (a2disk ?d) (on-disk ?d ?u) (clear-disk ?d) (clear-peg ?p2))
    :effect (and
      (not (on-disk ?d ?u))
      (on-peg ?d ?p2)
      (clear-disk ?u)
      (not (clear-peg ?p2))
    )
  )

  (:action move-a2-from-disk-to-disk
    :parameters (?d - disk ?u - disk ?v - disk)
    :precondition (and (a2disk ?d) (on-disk ?d ?u) (clear-disk ?d) (clear-disk ?v) (smaller ?d ?v))
    :effect (and
      (not (on-disk ?d ?u))
      (on-disk ?d ?v)
      (clear-disk ?u)
      (not (clear-disk ?v))
    )
  )
)