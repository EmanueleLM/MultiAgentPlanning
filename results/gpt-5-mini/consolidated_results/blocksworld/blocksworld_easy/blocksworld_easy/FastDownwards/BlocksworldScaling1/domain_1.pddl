(define (domain BlocksworldScaling1)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?b - block ?b2 - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (at-stage ?s - stage)
    (next ?s - stage ?s2 - stage)
  )

  ;; Pick up a block from the table.
  (:action pick-up
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))         ;; per spec: a block is not clear while picked up
      (not (handempty))
      (holding ?b)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Unstack a block from on top of another block.
  (:action unstack
    :parameters (?b - block ?bbelow - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?b ?bbelow)
      (clear ?b)
      (handempty)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?b ?bbelow))
      (holding ?b)
      (clear ?bbelow)         ;; removing top makes below clear
      (not (clear ?b))        ;; held blocks are not clear per spec
      (not (handempty))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Put down a held block onto the table.
  (:action put-down
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (holding ?b))
      (ontable ?b)
      (clear ?b)             ;; block on table with nothing on top is clear
      (handempty)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Stack a held block onto another clear block.
  (:action stack
    :parameters (?b - block ?bbelow - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?bbelow)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (holding ?b))
      (on ?b ?bbelow)
      (not (clear ?bbelow))  ;; once you stack on top, the below block is no longer clear
      (clear ?b)             ;; the newly stacked block has nothing on top
      (handempty)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)