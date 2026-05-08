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

  ;; Unstack a block ?x from on top of ?y, advancing from stage ?s1 to successor ?s2.
  ;; Preconditions enforce hand is empty, the block is on the other block and clear,
  ;; and the block is not already held. The action moves the global stage forward.
  (:action unstack-block
    :parameters (?x - block ?y - block ?s1 - stage ?s2 - stage)
    :precondition (and
                    (on ?x ?y)
                    (clear ?x)
                    (handempty)
                    (not (holding ?x))
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

  ;; Stack a held block ?x onto a clear block ?y, advancing the stage.
  ;; Requires that the agent is holding ?x and that ?y is clear and not held.
  (:action stack-block
    :parameters (?x - block ?y - block ?s1 - stage ?s2 - stage)
    :precondition (and
                    (holding ?x)
                    (clear ?y)
                    (not (holding ?y))
                    (at ?s1)
                    (next ?s1 ?s2)
                  )
    :effect (and
              (on ?x ?y)
              (clear ?x)
              (not (holding ?x))
              (not (clear ?y))
              (handempty)
              (not (ontable ?x))
              (not (at ?s1))
              (at ?s2)
            )
  )

  ;; Pick up a clear block from the table, advancing the stage.
  (:action pickup-block
    :parameters (?x - block ?s1 - stage ?s2 - stage)
    :precondition (and
                    (ontable ?x)
                    (clear ?x)
                    (handempty)
                    (not (holding ?x))
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

  ;; Put down a held block onto the table, advancing the stage.
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