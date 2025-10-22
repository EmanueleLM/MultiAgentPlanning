(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)    ; disk ?d is directly on place ?p (place = peg or disk)
    (clear ?p - place)          ; nothing is on top of place ?p
    (smaller ?d1 - disk ?d2 - disk) ; ?d1 is strictly smaller than ?d2
  )

  ;; Move a clear disk onto an empty peg
  (:action move-to-empty
    :parameters (?d - disk ?from - place ?to - peg)
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

  ;; Move a clear disk onto a larger disk that is the current top of some peg
  (:action move-onto-disk
    :parameters (?d - disk ?from - place ?t - disk ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (on ?t ?to)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?from)
    )
  )
)