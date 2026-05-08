(define (domain blocksworld-scaling10-domain)
  (:requirements :strips :typing)
  (:types block stage)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (at-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Pick up a clear block from the table into the hand,
  ;; consuming the current stage and producing its successor.
  (:action pick-up
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (next ?s ?s2) (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (holding ?b)
      (not (handempty))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Unstack a clear block from on top of another block into the hand,
  ;; making the supporting block clear, consuming the current stage and producing its successor.
  (:action unstack
    :parameters (?b - block ?p - block ?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (next ?s ?s2) (on ?b ?p) (clear ?b) (handempty))
    :effect (and
      (not (on ?b ?p))
      (not (clear ?b))
      (holding ?b)
      (clear ?p)
      (not (handempty))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Put down a held block onto the table, consuming the current stage and producing its successor.
  (:action put-down
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (next ?s ?s2) (holding ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?b))
      (handempty)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Stack a held block onto a clear block, consuming the current stage and producing its successor.
  (:action stack
    :parameters (?b - block ?p - block ?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (next ?s ?s2) (holding ?b) (clear ?p))
    :effect (and
      (on ?b ?p)
      (clear ?b)
      (not (clear ?p))
      (not (holding ?b))
      (handempty)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)