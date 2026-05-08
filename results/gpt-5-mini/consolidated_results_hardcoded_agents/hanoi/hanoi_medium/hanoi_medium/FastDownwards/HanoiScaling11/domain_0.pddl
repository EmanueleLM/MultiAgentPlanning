(define (domain hanoi-5-peg3)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    ; disk on an object (either another disk or a peg)
    (on ?d - disk ?below - object)
    ; nothing on top of object (disk or peg)
    (clear ?o - object)
    ; disk ?d is the top-most disk on peg ?p
    (top-of-peg ?d - disk ?p - peg)
    ; peg is empty (no disks on it)
    (empty ?p - peg)
    ; disk ?d is located on peg ?p (peg that anchors its stack)
    (located ?d - disk ?p - peg)
    ; size ordering (true iff first disk is smaller than second)
    (smaller ?d1 - disk ?d2 - disk)
  )

  ; Move a top disk that is directly on a source peg onto an empty destination peg
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top-of-peg ?d ?from)
      (on ?d ?from)
      (clear ?d)
      (empty ?to)
      (located ?d ?from)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)
      (not (empty ?to))
      (empty ?from)
      (not (located ?d ?from))
      (located ?d ?to)
    )
  )

  ; Move a top disk that is directly on a source peg onto the top disk of a destination peg
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?destDisk - disk)
    :precondition (and
      (top-of-peg ?d ?from)
      (on ?d ?from)
      (clear ?d)
      (top-of-peg ?destDisk ?to)
      (smaller ?d ?destDisk)
      (located ?d ?from)
      (located ?destDisk ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?destDisk)
      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)
      (not (top-of-peg ?destDisk ?to))
      (not (clear ?destDisk))
      (empty ?from)
      (not (located ?d ?from))
      (located ?d ?to)
    )
  )

  ; Move a top disk that sits on another disk onto an empty destination peg
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg)
    :precondition (and
      (top-of-peg ?d ?from)
      (on ?d ?below)
      (clear ?d)
      (empty ?to)
      (located ?d ?from)
      (located ?below ?from)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)
      (not (empty ?to))
      (clear ?below)
      (top-of-peg ?below ?from)
      (not (located ?d ?from))
      (located ?d ?to)
    )
  )

  ; Move a top disk that sits on another disk onto the top disk of a destination peg
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?destDisk - disk)
    :precondition (and
      (top-of-peg ?d ?from)
      (on ?d ?below)
      (clear ?d)
      (top-of-peg ?destDisk ?to)
      (smaller ?d ?destDisk)
      (located ?d ?from)
      (located ?below ?from)
      (located ?destDisk ?to)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?destDisk)
      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)
      (not (top-of-peg ?destDisk ?to))
      (not (clear ?destDisk))
      (clear ?below)
      (top-of-peg ?below ?from)
      (not (located ?d ?from))
      (located ?d ?to)
    )
  )

)