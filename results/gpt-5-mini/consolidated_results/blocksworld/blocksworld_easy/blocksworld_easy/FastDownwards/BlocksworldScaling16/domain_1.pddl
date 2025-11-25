(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Actions performed by the block_picker agent: pick-up a clear block from the table
  (:action block_picker-pick-up
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
                    (ontable ?b)
                    (clear ?b)
                    (handempty)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))        ;; not clear because being held
              (not (handempty))
              (holding ?b)
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; Actions performed by the block_picker agent: unstack a clear block from on top of another block
  (:action block_picker-unstack
    :parameters (?b - block ?below - block ?s - stage ?s2 - stage)
    :precondition (and
                    (on ?b ?below)
                    (clear ?b)
                    (handempty)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (not (on ?b ?below))
              (holding ?b)
              (not (clear ?b))       ;; being held -> not clear
              (clear ?below)         ;; below becomes clear when top removed
              (not (handempty))
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; Actions performed by the block_stacker agent: put down a held block onto the table
  (:action block_stacker-put-down
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
                    (holding ?b)
                    (current ?s)
                    (succ ?s ?s2)
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

  ;; Actions performed by the block_stacker agent: stack a held block on top of a clear block
  (:action block_stacker-stack
    :parameters (?b - block ?target - block ?s - stage ?s2 - stage)
    :precondition (and
                    (holding ?b)
                    (clear ?target)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (on ?b ?target)
              (clear ?b)
              (not (holding ?b))
              (handempty)
              (not (clear ?target))
              (not (current ?s))
              (current ?s2)
            )
  )
)