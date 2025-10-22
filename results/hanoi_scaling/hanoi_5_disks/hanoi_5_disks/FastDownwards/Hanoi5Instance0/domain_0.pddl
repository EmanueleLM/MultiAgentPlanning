(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (disk ?o - object)
    (peg ?o - object)
    (on ?d - object ?p - object)           ; disk ?d is directly on place ?p (place may be a peg or a disk)
    (clear ?o - object)                    ; nothing on top of this object (object can be a peg or a disk)
    (smaller ?d1 - object ?d2 - object)    ; ?d1 is strictly smaller than ?d2
  )

  ; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - object ?from - object ?peg - object)
    :precondition (and
      (disk ?d)
      (peg ?peg)
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
    :parameters (?d - object ?from - object ?dest - object)
    :precondition (and
      (disk ?d)
      (disk ?dest)
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