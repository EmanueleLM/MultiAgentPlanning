(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (disk ?x - obj)           ; object is a disk
    (peg ?x - obj)            ; object is a peg
    (on ?d - obj ?x - obj)    ; disk d is directly on object x (disk or peg)
    (clear ?x - obj)          ; nothing is on top of object x
    (smaller ?d1 - obj ?d2 - obj) ; d1 is strictly smaller than d2
  )

  ;; Move a single disk onto a peg. Only the top disk of its stack may move,
  ;; and the target peg must be clear.
  (:action move-to-peg
    :parameters (?d ?from ?to - obj)
    :precondition (and
      (disk ?d)
      (on ?d ?from)
      (clear ?d)
      (peg ?to)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Move a single disk onto another disk. Target disk must be clear and larger.
  (:action move-to-disk
    :parameters (?d ?from ?to - obj)
    :precondition (and
      (disk ?d)
      (on ?d ?from)
      (clear ?d)
      (disk ?to)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)