(define (domain vowel-consonant-blocks-domain)
  (:requirements :strips :typing :adl)

  (:types
    block
    agent
  )

  (:predicates
    (on ?b1 - block ?b2 - block)
    (on-table ?b - block)
    (clear ?b - block)
    (hand-empty ?a - agent)
    (holding ?a - agent ?b - block)
    (is-vowel-block ?b - block)
    (is-consonant-block ?b - block)
    (is-vowel-handler ?a - agent)
    (is-consonant-handler ?a - agent)
  )

  ;; Action for picking up a block from the table
  (:action pick-up
    :parameters (?a - agent ?b - block)
    :precondition (and
                    (clear ?b)
                    (on-table ?b)
                    (hand-empty ?a)
                    (or
                      (and (is-vowel-block ?b) (is-vowel-handler ?a))
                      (and (is-consonant-block ?b) (is-consonant-handler ?a))
                    )
                  )
    :effect (and
              (not (on-table ?b))
              (not (clear ?b))
              (not (hand-empty ?a))
              (holding ?a ?b)
            )
  )

  ;; Action for putting down a block onto the table
  (:action put-down
    :parameters (?a - agent ?b - block)
    :precondition (holding ?a ?b)
    :effect (and
              (not (holding ?a ?b))
              (on-table ?b)
              (clear ?b)
              (hand-empty ?a)
            )
  )

  ;; Action for unstacking a block from another block
  (:action unstack
    :parameters (?a - agent ?b1 - block ?b2 - block)
    :precondition (and
                    (on ?b1 ?b2)
                    (clear ?b1)
                    (hand-empty ?a)
                    (or
                      (and (is-vowel-block ?b1) (is-vowel-handler ?a))
                      (and (is-consonant-block ?b1) (is-consonant-handler ?a))
                    )
                  )
    :effect (and
              (not (on ?b1 ?b2))
              (not (clear ?b1))
              (clear ?b2)
              (not (hand-empty ?a))
              (holding ?a ?b1)
            )
  )

  ;; Action for stacking a block onto another block
  (:action stack
    :parameters (?a - agent ?b1 - block ?b2 - block)
    :precondition (and
                    (holding ?a ?b1)
                    (clear ?b2)
                  )
    :effect (and
              (not (holding ?a ?b1))
              (not (clear ?b2))
              (clear ?b1)
              (hand-empty ?a)
              (on ?b1 ?b2)
            )
  )
)