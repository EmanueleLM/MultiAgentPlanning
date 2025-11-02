(define (domain hanoi)
  (:requirements :strips :typing)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?o - object)    ; disk ?d is directly on object ?o (disk or peg)
    (clear ?o - object)           ; nothing on top of object ?o
    (smaller ?d1 - disk ?d2 - disk) ; ?d1 is strictly smaller than ?d2
  )

  ;; Move a top disk onto an empty peg
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
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
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
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )
)