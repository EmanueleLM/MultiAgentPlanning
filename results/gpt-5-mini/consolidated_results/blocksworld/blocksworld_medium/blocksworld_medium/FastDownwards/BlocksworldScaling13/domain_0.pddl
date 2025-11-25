(define (domain blocks-world-agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block)

  (:predicates
    (on ?b - block ?c - block)        ; block b is on block c
    (on-table ?b - block)             ; block is on the table
    (clear ?b - block)                ; nothing on top of block
    (holding ?ag - agent ?b - block)  ; agent holding block
    (handempty ?ag - agent)           ; agent's hand is empty
  )

  ;; Agent picks up a clear block from the table
  (:action pick-up-agent
    :parameters (?ag - agent ?b - block)
    :precondition (and
                    (handempty ?ag)
                    (clear ?b)
                    (on-table ?b)
                  )
    :effect (and
              (not (on-table ?b))
              (not (handempty ?ag))
              (holding ?ag ?b)
            )
  )

  ;; Agent un-stacks a clear block from another block
  (:action unstack-agent
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and
                    (handempty ?ag)
                    (clear ?b)
                    (on ?b ?c)
                  )
    :effect (and
              (not (on ?b ?c))
              (not (handempty ?ag))
              (holding ?ag ?b)
              (clear ?c)
            )
  )

  ;; Agent puts a held block down onto the table
  (:action put-down-agent
    :parameters (?ag - agent ?b - block)
    :precondition (and
                    (holding ?ag ?b)
                  )
    :effect (and
              (on-table ?b)
              (handempty ?ag)
              (not (holding ?ag ?b))
              (clear ?b)
            )
  )

  ;; Agent stacks a held block onto a clear block
  (:action stack-agent
    :parameters (?ag - agent ?b - block ?c - block)
    :precondition (and
                    (holding ?ag ?b)
                    (clear ?c)
                  )
    :effect (and
              (not (holding ?ag ?b))
              (handempty ?ag)
              (on ?b ?c)
              (not (clear ?c))
              (clear ?b)
            )
  )
)