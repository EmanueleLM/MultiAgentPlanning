(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)
  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (place = disk or peg)
    (clear ?p - place)              ; nothing is on top of place ?p
    (smaller ?d1 - disk ?d2 - disk) ; ?d1 is strictly smaller than ?d2
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?src - place ?dst - peg)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (clear ?dst)
      (not (= ?src ?dst))
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?dst)
      (not (clear ?dst))
      (clear ?src)
    )
  )

  ;; Move a top disk onto a larger top disk
  (:action move-to-disk
    :parameters (?d - disk ?src - place ?dst - disk)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (clear ?dst)
      (smaller ?d ?dst)
      (not (= ?src ?dst))
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?dst)
      (not (clear ?dst))
      (clear ?src)
    )
  )
)