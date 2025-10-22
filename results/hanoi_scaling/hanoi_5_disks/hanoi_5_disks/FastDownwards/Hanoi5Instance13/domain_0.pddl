(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?x - object)         ; disk ?d is directly on object ?x (disk or peg)
    (clear ?x - object)               ; nothing is on top of object ?x
    (smaller ?d1 - disk ?d2 - disk)   ; ?d1 is smaller than ?d2
  )

  ;; Move a clear disk ?d from whatever it's on (?from) onto an empty peg ?to
  (:action move-to-empty-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Move a clear disk ?d from whatever it's on (?from) onto a clear disk ?to,
  ;; allowed only if ?d is smaller than ?to
  (:action move-onto-disk
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
      (not (clear ?to))
      (clear ?from)
    )
  )
)