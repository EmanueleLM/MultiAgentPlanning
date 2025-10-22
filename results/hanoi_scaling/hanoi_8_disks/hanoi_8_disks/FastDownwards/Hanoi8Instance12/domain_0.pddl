(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)
  (:predicates
    (on ?d - disk ?p - place)      ; disk ?d is directly on place ?p (place = disk or peg)
    (clear ?p - place)            ; nothing is on top of place ?p
    (smaller ?d1 - disk ?d2 - disk) ; disk ?d1 is smaller than disk ?d2 (static)
  )

  ; Move a top disk onto an empty place (peg or disk-place if empty)
  (:action move-to-empty
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ; Move a top disk onto another disk that is currently clear and larger
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?t - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
      (not (= ?d ?t))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (clear ?from)
      (not (clear ?t))
    )
  )
)