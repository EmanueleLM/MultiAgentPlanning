(define (domain hanoi)
  (:requirements :strips :typing)
  (:types object disk peg)
  (:predicates
    (on ?d - disk ?o - object)       ; disk ?d is directly on object ?o (disk or peg)
    (clear ?o - object)             ; nothing on top of object ?o
    (smaller ?d1 - disk ?d2 - disk) ; ?d1 is strictly smaller than ?d2
  )

  ;; Move a top disk onto a peg
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?d)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Move a top disk onto another disk (only if the moving disk is smaller)
  (:action move-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?d)
      (clear ?from)
      (not (clear ?to))
    )
  )
)