(define (domain blocks-world-ordered-sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types block step)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (current ?s - step)
    (next ?s1 - step ?s2 - step)
    (expect1 ?s - step ?b - block)          ; for pickup/putdown steps
    (expect2 ?s - step ?b - block ?c - block) ; for unstack/stack steps
  )

  ;; Unstack action constrained to a specific (step, block pair) and ordered via next/current
  (:action unstack-step
    :parameters (?s - step ?s2 - step ?b - block ?c - block)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (expect2 ?s ?b ?c)
      (on ?b ?c)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (holding ?b)
      (clear ?c)
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Stack action constrained to a specific (step, block pair) and ordered via next/current
  (:action stack-step
    :parameters (?s - step ?s2 - step ?b - block ?c - block)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (expect2 ?s ?b ?c)
      (holding ?b)
      (clear ?c)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?c))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Pickup from table action constrained similarly
  (:action pickup-step
    :parameters (?s - step ?s2 - step ?b - block)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (expect1 ?s ?b)
      (ontable ?b)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Put down to table action constrained similarly
  (:action putdown-step
    :parameters (?s - step ?s2 - step ?b - block)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (expect1 ?s ?b)
      (holding ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (current ?s))
      (current ?s2)
    )
  )
)