(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)
  (:predicates
    (on ?d - disk ?p - place)    ; disk ?d is directly on place ?p (disk or peg)
    (clear ?p - place)          ; nothing is on top of place ?p (disk or peg)
    (smaller ?d1 - disk ?d2 - disk) ; ?d1 is strictly smaller than ?d2
  )

  ;; Move a clear disk from any place onto an empty peg
  (:action move-to-peg
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

  ;; Move a clear disk from any place onto a larger, clear disk
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
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