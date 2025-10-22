(define (domain hanoi-sequential)
  (:requirements :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?s - object)
    (clear ?x - object)
    (inhand ?d - disk)
    (handempty)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action pickup-from-peg
    :parameters (?d - disk ?p - peg)
    :precondition (and (on ?d ?p) (clear ?d) (handempty))
    :effect (and
      (not (on ?d ?p))
      (not (clear ?d))
      (inhand ?d)
      (not (handempty))
      (clear ?p)
    )
  )

  (:action pickup-from-disk
    :parameters (?d - disk ?under - disk)
    :precondition (and (on ?d ?under) (clear ?d) (handempty))
    :effect (and
      (not (on ?d ?under))
      (not (clear ?d))
      (inhand ?d)
      (not (handempty))
      (clear ?under)
    )
  )

  (:action putdown-to-peg
    :parameters (?d - disk ?p - peg)
    :precondition (and (inhand ?d) (clear ?p))
    :effect (and
      (on ?d ?p)
      (not (inhand ?d))
      (handempty)
      (not (clear ?p))
      (clear ?d)
    )
  )

  (:action putdown-to-disk
    :parameters (?d - disk ?t - disk)
    :precondition (and (inhand ?d) (clear ?t) (smaller ?d ?t))
    :effect (and
      (on ?d ?t)
      (not (inhand ?d))
      (handempty)
      (not (clear ?t))
      (clear ?d)
    )
  )
)