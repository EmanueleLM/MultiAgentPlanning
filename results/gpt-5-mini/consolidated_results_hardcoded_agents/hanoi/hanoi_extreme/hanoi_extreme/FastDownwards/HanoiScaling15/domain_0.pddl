(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ; disk directly on a peg
    (on-peg ?d - disk ?p - peg)
    ; disk directly on another disk
    (on-disk ?d - disk ?s - disk)
    ; top-of-peg: the current topmost disk on a peg
    (top ?p - peg ?d - disk)
    ; a disk has nothing on top
    (clear ?d - disk)
    ; a peg has no disks at all (its stack is empty)
    (empty ?p - peg)
    ; size ordering: (smaller d1 d2) means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ; Move a top disk that is directly on a peg to an empty peg
  (:action move-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (top ?from ?d)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?from ?d))
      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?to ?d)
      (empty ?from)
    )
  )

  ; Move a top disk that is directly on a peg onto the top disk of another (occupied) peg
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?tgt - disk)
    :precondition (and
      (on-peg ?d ?from)
      (top ?from ?d)
      (clear ?d)
      (top ?to ?tgt)
      (clear ?tgt)
      (smaller ?d ?tgt)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?from ?d))
      (not (top ?to ?tgt))
      (not (clear ?tgt))
      (on-disk ?d ?tgt)
      (top ?to ?d)
      (empty ?from)
    )
  )

  ; Move a top disk that is on another disk (not directly on a peg) to an empty peg
  (:action move-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (top ?from ?d)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (not (top ?from ?d))
      (top ?from ?below)
      (clear ?below)
      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?to ?d)
    )
  )

  ; Move a top disk that is on another disk onto the top disk of another (occupied) peg
  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?tgt - disk)
    :precondition (and
      (on-disk ?d ?below)
      (top ?from ?d)
      (clear ?d)
      (top ?to ?tgt)
      (clear ?tgt)
      (smaller ?d ?tgt)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (not (top ?from ?d))
      (top ?from ?below)
      (clear ?below)
      (not (top ?to ?tgt))
      (not (clear ?tgt))
      (on-disk ?d ?tgt)
      (top ?to ?d)
    )
  )
)