(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  ;; Actions performed by the block_stacker agent (namespaced to keep agent-origin explicit)
  (:action block_stacker-pick-up
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty))
              (holding ?b)
            )
  )

  (:action block_stacker-unstack
    :parameters (?b - block ?below - block)
    :precondition (and (on ?b ?below) (clear ?b) (handempty))
    :effect (and
              (not (on ?b ?below))
              (holding ?b)
              (not (clear ?b))
              (clear ?below)
              (not (handempty))
            )
  )

  (:action block_stacker-put-down
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty)
              (not (holding ?b))
            )
  )

  (:action block_stacker-stack
    :parameters (?b - block ?target - block)
    :precondition (and (holding ?b) (clear ?target))
    :effect (and
              (on ?b ?target)
              (clear ?b)
              (not (holding ?b))
              (handempty)
              (not (clear ?target))
            )
  )
)