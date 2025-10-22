(define (domain hanoi7instance8)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (on ?d ?x)
    (clear ?x)
    (smaller ?d1 ?d2)
    (disk ?d)
    (peg ?p)
  )

  (:action move-to-peg
    :parameters (?d ?from ?peg)
    :precondition (and
      (disk ?d)
      (on ?d ?from)
      (clear ?d)
      (peg ?peg)
      (clear ?peg)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)
      (not (clear ?peg))
    )
  )

  (:action move-to-disk
    :parameters (?d ?from ?target)
    :precondition (and
      (disk ?d)
      (on ?d ?from)
      (clear ?d)
      (disk ?target)
      (clear ?target)
      (smaller ?d ?target)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?target)
      (clear ?from)
      (not (clear ?target))
    )
  )
)