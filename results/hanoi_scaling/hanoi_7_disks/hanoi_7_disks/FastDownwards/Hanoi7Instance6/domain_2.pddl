(define (domain hanoi7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?x - object)
    (clear ?x - object)
    (handempty)
    (holding ?d - disk)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action pickup-from-peg
    :parameters (?d - disk ?p - peg)
    :precondition (and (on ?d ?p) (clear ?d) (handempty))
    :effect (and
      (holding ?d)
      (not (on ?d ?p))
      (not (handempty))
      (clear ?p)
      (not (clear ?d))
    )
  )

  (:action pickup-from-disk
    :parameters (?d - disk ?below - disk)
    :precondition (and (on ?d ?below) (clear ?d) (handempty))
    :effect (and
      (holding ?d)
      (not (on ?d ?below))
      (not (handempty))
      (clear ?below)
      (not (clear ?d))
    )
  )

  (:action put-on-peg
    :parameters (?d - disk ?p - peg)
    :precondition (and (holding ?d) (clear ?p))
    :effect (and
      (not (holding ?d))
      (handempty)
      (on ?d ?p)
      (not (clear ?p))
      (clear ?d)
    )
  )

  (:action put-on-disk
    :parameters (?d - disk ?below - disk)
    :precondition (and (holding ?d) (clear ?below) (smaller ?d ?below))
    :effect (and
      (not (holding ?d))
      (handempty)
      (on ?d ?below)
      (not (clear ?below))
      (clear ?d)
    )
  )
)