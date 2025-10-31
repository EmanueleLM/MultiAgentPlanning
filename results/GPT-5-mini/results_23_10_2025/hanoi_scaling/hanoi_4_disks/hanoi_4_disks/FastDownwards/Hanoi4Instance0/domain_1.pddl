(define (domain hanoi-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on-peg ?d - disk ?p - peg)      ; disk ?d is directly on peg ?p
    (on-disk ?d - disk ?under - disk) ; disk ?d is directly on disk ?under
    (top ?d - disk ?p - peg)         ; disk ?d is the top disk on peg ?p
    (empty ?p - peg)                 ; peg ?p is empty (no disks)
    (clear ?d - disk)                ; no disk on top of disk ?d (it is clear)
    (smaller ?a - disk ?b - disk)    ; disk ?a is smaller than disk ?b
  )

  ; Move when disk is directly on a peg and destination peg is empty
  (:action move-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on-peg ?d ?from)
      (empty ?to)
      (clear ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?d ?to)
      (empty ?from)
    )
  )

  ; Move when disk is directly on a peg and destination peg has a top disk
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?dsttop - disk)
    :precondition (and
      (top ?d ?from)
      (on-peg ?d ?from)
      (top ?dsttop ?to)
      (clear ?d)
      (smaller ?d ?dsttop)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (not (top ?dsttop ?to))
      (not (clear ?dsttop))
      (on-disk ?d ?dsttop)
      (top ?d ?to)
      (empty ?from)
    )
  )

  ; Move when disk is on another disk and destination peg is empty
  (:action move-disk-to-empty
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on-disk ?d ?under)
      (empty ?to)
      (clear ?d)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (not (top ?d ?from))
      (top ?under ?from)
      (clear ?under)
      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?d ?to)
    )
  )

  ; Move when disk is on another disk and destination peg has a top disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg ?dsttop - disk)
    :precondition (and
      (top ?d ?from)
      (on-disk ?d ?under)
      (top ?dsttop ?to)
      (clear ?d)
      (smaller ?d ?dsttop)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (not (top ?d ?from))
      (top ?under ?from)
      (clear ?under)
      (not (top ?dsttop ?to))
      (not (clear ?dsttop))
      (on-disk ?d ?dsttop)
      (top ?d ?to)
    )
  )
)