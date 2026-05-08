(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg object)
  ; Note: disks and pegs are declared as their own types; they implicitly belong to the universal "object" type above.
  (:predicates
    (disk ?d - disk)
    (peg ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)  ; static size ordering: true iff d1 is strictly smaller than d2
    (on ?d - disk ?s - object)        ; immediate support: disk ?d is immediately on support ?s (peg or disk)
    (top ?d - disk ?p - peg)         ; disk ?d is the top disk on peg ?p
    (empty ?p - peg)                 ; peg ?p currently empty
  )

  ; Move a top disk from a peg to another peg that is empty,
  ; and there is a disk directly under the moved disk (the disk B becomes the new top on From).
  (:action move-to-empty-with-under
    :parameters (?d - disk ?from - peg ?to - peg ?b - disk)
    :precondition (and
      (top ?d ?from)
      (empty ?to)
      (on ?b ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (empty ?to))
      (top ?b ?from)
    )
  )

  ; Move a top disk from a peg to another peg that is empty,
  ; and there is no disk under the moved disk (the from-peg becomes empty).
  ; The precondition explicitly ensures no disk X is on ?d by negative preconditions for all disk constants.
  (:action move-to-empty-no-under
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d ?from)
      (empty ?to)
      (not (on A ?d))
      (not (on B ?d))
      (not (on C ?d))
      (not (on D ?d))
      (not (on E ?d))
      (not (on F ?d))
      (not (on G ?d))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  ; Move a top disk from a peg to another peg whose top disk is ?t,
  ; and there is a disk directly under the moved disk (?b becomes new top on From).
  (:action move-to-disk-with-under
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk ?b - disk)
    :precondition (and
      (top ?d ?from)
      (top ?t ?to)
      (smaller ?d ?t)
      (on ?b ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (top ?t ?to))
      (not (top ?d ?from))
      (top ?d ?to)
      (top ?b ?from)
    )
  )

  ; Move a top disk from a peg to another peg whose top disk is ?t,
  ; and there is no disk under the moved disk (From becomes empty).
  (:action move-to-disk-no-under
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?d ?from)
      (top ?t ?to)
      (smaller ?d ?t)
      (not (on A ?d))
      (not (on B ?d))
      (not (on C ?d))
      (not (on D ?d))
      (not (on E ?d))
      (not (on F ?d))
      (not (on G ?d))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (top ?t ?to))
      (not (top ?d ?from))
      (top ?d ?to)
      (empty ?from)
    )
  )

)