(define (domain blocks-multi)
  :requirements :strips :typing :negative-preconditions
  :types block agent stage
  :predicates
    (handempty ?ag - agent)
    (holding ?ag - agent ?b - block)
    (ontable ?b - block)
    (on ?b - block ?c - block)
    (clear ?b - block)
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; pick-up: pick a block from the table into the agent's hand,
  ;; advances the current stage to its successor (time progression)
  (:action pick-up
    :parameters (?ag - agent ?b - block ?s - stage ?s2 - stage)
    :precondition (and
                    (ontable ?b)
                    (clear ?b)
                    (handempty ?ag)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty ?ag))
              (holding ?ag ?b)
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; unstack: pick a block that is on top of another block,
  ;; frees the block below, advances stage
  (:action unstack
    :parameters (?ag - agent ?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
                    (on ?b ?c)
                    (clear ?b)
                    (handempty ?ag)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (not (on ?b ?c))
              (not (clear ?b))
              (not (handempty ?ag))
              (holding ?ag ?b)
              (clear ?c)
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; put-down: put a held block down onto the table, advances stage
  (:action put-down
    :parameters (?ag - agent ?b - block ?s - stage ?s2 - stage)
    :precondition (and
                    (holding ?ag ?b)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (not (holding ?ag ?b))
              (handempty ?ag)
              (ontable ?b)
              (clear ?b)
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; stack: place a held block onto another block, target must be clear, advances stage
  (:action stack
    :parameters (?ag - agent ?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
                    (holding ?ag ?b)
                    (clear ?c)
                    (current ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (not (holding ?ag ?b))
              (handempty ?ag)
              (on ?b ?c)
              (not (clear ?c))
              (clear ?b)
              (not (current ?s))
              (current ?s2)
            )
  )
)