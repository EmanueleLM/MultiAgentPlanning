(define (domain blocks-multi)
  :requirements :strips :typing :negative-preconditions
  :types block agent
  :predicates
    (handempty ?ag - agent)
    (holding ?ag - agent ?b - block)
    (ontable ?b - block)
    (on ?b - block ?c - block)
    (clear ?b - block)
  )

  ;; pick-up: pick a block from the table into the agent's hand
  (:action pick-up
    :parameters (?ag - agent ?b - block)
    :precondition (and
                    (ontable ?b)
                    (clear ?b)
                    (handempty ?ag))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty ?ag))
              (holding ?ag ?b))
  )

  ;; unstack: pick a block that is on top of another block
  (:action unstack
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and
                    (on ?b ?c)
                    (clear ?b)
                    (handempty ?ag))
    :effect (and
              (not (on ?b ?c))
              (not (clear ?b))
              (not (handempty ?ag))
              (holding ?ag ?b)
              (clear ?c))
  )

  ;; put-down: put a held block down onto the table
  (:action put-down
    :parameters (?ag - agent ?b - block)
    :precondition (and
                    (holding ?ag ?b))
    :effect (and
              (not (holding ?ag ?b))
              (handempty ?ag)
              (ontable ?b)
              (clear ?b))
  )

  ;; stack: place a held block onto another block
  (:action stack
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and
                    (holding ?ag ?b)
                    (clear ?c))
    :effect (and
              (not (holding ?ag ?b))
              (handempty ?ag)
              (on ?b ?c)
              (not (clear ?c))
              (clear ?b))
  )
)