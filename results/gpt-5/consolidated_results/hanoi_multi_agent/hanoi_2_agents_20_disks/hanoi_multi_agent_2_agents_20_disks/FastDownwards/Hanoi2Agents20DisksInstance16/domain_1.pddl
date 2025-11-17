(define (domain hanoi-3peg-20disks)
  (:requirements :strips :typing)
  (:types
    place
    peg - place
    disk - place
  )

  (:predicates
    (on ?d - disk ?s - place)
    (clear ?x - place)
    (smaller ?x - disk ?y - disk)
  )

  ;; Move a clear disk from any place to an empty peg
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

  ;; Move a clear disk from any place onto a clear larger disk
  (:action move-onto-disk
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