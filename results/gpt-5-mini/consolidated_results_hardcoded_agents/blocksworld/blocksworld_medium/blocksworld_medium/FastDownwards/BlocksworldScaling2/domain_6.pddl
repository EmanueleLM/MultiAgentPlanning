(define (domain blocks-world-ordered)
  (:requirements :strips :typing :negative-preconditions)
  (:types block phase)
  (:predicates
    (on ?b - block ?x - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (current ?p - phase)
    (next ?p1 - phase ?p2 - phase)
  )

  (:action unstack
    :parameters (?b - block ?c - block ?p - phase ?pnext - phase)
    :precondition (and (on ?b ?c) (clear ?b) (handempty) (current ?p) (next ?p ?pnext))
    :effect (and
      (holding ?b)
      (not (on ?b ?c))
      (not (ontable ?b))
      (clear ?c)
      (not (clear ?b))
      (not (handempty))
      (not (current ?p))
      (current ?pnext)
    )
  )

  (:action putdown
    :parameters (?b - block ?p - phase ?pnext - phase)
    :precondition (and (holding ?b) (current ?p) (next ?p ?pnext))
    :effect (and
      (ontable ?b)
      (not (holding ?b))
      (clear ?b)
      (handempty)
      (not (current ?p))
      (current ?pnext)
    )
  )

  (:action pickup
    :parameters (?b - block ?p - phase ?pnext - phase)
    :precondition (and (ontable ?b) (clear ?b) (handempty) (current ?p) (next ?p ?pnext))
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (not (current ?p))
      (current ?pnext)
    )
  )

  (:action stack
    :parameters (?b - block ?c - block ?p - phase ?pnext - phase)
    :precondition (and (holding ?b) (clear ?c) (current ?p) (next ?p ?pnext))
    :effect (and
      (on ?b ?c)
      (not (ontable ?b))
      (not (holding ?b))
      (handempty)
      (not (clear ?c))
      (clear ?b)
      (not (current ?p))
      (current ?pnext)
    )
  )
)