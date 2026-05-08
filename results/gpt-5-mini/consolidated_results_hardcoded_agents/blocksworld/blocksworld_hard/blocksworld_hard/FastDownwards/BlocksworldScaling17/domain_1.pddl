(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (holding ?b - block)
    (clear ?b - block)
    (on ?b1 - block ?b2 - block)
    (ontable ?b - block)
    (handempty)
    (at ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Unstack a block ?x from on top of block ?y, consuming one discrete stage step.
  (:action unstack-block
    :parameters (?x - block ?y - block ?s1 - stage ?s2 - stage)
    :precondition (and
                    (on ?x ?y)
                    (clear ?x)
                    (handempty)
                    (at ?s1)
                    (next ?s1 ?s2)
                  )
    :effect (and
              (holding ?x)
              (clear ?y)
              (not (on ?x ?y))
              (not (clear ?x))
              (not (handempty))
              (not (at ?s1))
              (at ?s2)
            )
  )

  ;; Stack a held block ?x onto block ?y, consuming one discrete stage step.
  (:action stack-block
    :parameters (?x - block ?y - block ?s1 - stage ?s2 - stage)
    :precondition (and
                    (holding ?x)
                    (clear ?y)
                    (at ?s1)
                    (next ?s1 ?s2)
                  )
    :effect (and
              (on ?x ?y)
              (clear ?x)
              (not (holding ?x))
              (not (clear ?y))
              (handempty)
              (not (at ?s1))
              (at ?s2)
            )
  )

  ;; Pick up a block ?x from the table into the hand, consuming one discrete stage step.
  (:action pickup-block
    :parameters (?x - block ?s1 - stage ?s2 - stage)
    :precondition (and
                    (ontable ?x)
                    (clear ?x)
                    (handempty)
                    (at ?s1)
                    (next ?s1 ?s2)
                  )
    :effect (and
              (holding ?x)
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty))
              (not (at ?s1))
              (at ?s2)
            )
  )

  ;; Put a held block ?x down on the table, consuming one discrete stage step.
  (:action putdown-block
    :parameters (?x - block ?s1 - stage ?s2 - stage)
    :precondition (and
                    (holding ?x)
                    (at ?s1)
                    (next ?s1 ?s2)
                  )
    :effect (and
              (ontable ?x)
              (clear ?x)
              (not (holding ?x))
              (handempty)
              (not (at ?s1))
              (at ?s2)
            )
  )
)