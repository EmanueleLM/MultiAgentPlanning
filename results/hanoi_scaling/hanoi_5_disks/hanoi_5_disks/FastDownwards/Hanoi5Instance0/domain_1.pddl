(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?p - object)       ; disk ?d is directly on place ?p (peg or disk)
    (clear ?o - object)             ; nothing on top of this object (peg or disk)
    (smaller ?d1 - disk ?d2 - disk) ; ?d1 is strictly smaller than ?d2
  )

  ; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?peg - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?peg)
      (not (= ?from ?peg))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)
      (not (clear ?peg))
    )
  )

  ; Move a top disk onto a larger disk
  (:action move-to-disk
    :parameters (?d - disk ?from - object ?dest - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?dest)
      (smaller ?d ?dest)
      (not (= ?from ?dest))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?dest)
      (clear ?from)
      (not (clear ?dest))
    )
  )
)