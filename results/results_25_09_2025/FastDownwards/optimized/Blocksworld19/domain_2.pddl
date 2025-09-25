(define (domain integrated-blocks)
  (:requirements :strips :typing :fluents :action-costs)
  (:types agent block)

  (:predicates
    (on ?b - block ?c - block)
    (on-table ?b - block)
    (clear ?b - block)
    (holding ?a - agent ?b - block)
    (handempty ?a - agent)
    (vowel ?b - block)
    (consonant ?b - block)
    (vowel-agent ?a - agent)
    (consonant-agent ?a - agent)
    (can-move ?a - agent ?b - block)
  )

  (:functions (total-cost))

  (:action pickup-from-table-vowel
    :parameters (?a - agent ?x - block)
    :precondition (and (vowel-agent ?a) (vowel ?x) (on-table ?x) (clear ?x) (handempty ?a) (can-move ?a ?x))
    :effect (and
      (not (on-table ?x))
      (not (clear ?x))
      (not (handempty ?a))
      (holding ?a ?x)
      (increase (total-cost) 1)
    )
  )

  (:action pickup-from-block-vowel
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (vowel-agent ?a) (vowel ?x) (on ?x ?y) (clear ?x) (handempty ?a) (can-move ?a ?x))
    :effect (and
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?x))
      (not (handempty ?a))
      (holding ?a ?x)
      (increase (total-cost) 1)
    )
  )

  (:action putdown-vowel
    :parameters (?a - agent ?x - block)
    :precondition (and (vowel-agent ?a) (vowel ?x) (holding ?a ?x))
    :effect (and
      (on-table ?x)
      (clear ?x)
      (not (holding ?a ?x))
      (handempty ?a)
      (increase (total-cost) 1)
    )
  )

  (:action stack-vowel
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (vowel-agent ?a) (vowel ?x) (holding ?a ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (not (holding ?a ?x))
      (handempty ?a)
      (increase (total-cost) 1)
    )
  )

  (:action pickup-from-table-consonant
    :parameters (?a - agent ?x - block)
    :precondition (and (consonant-agent ?a) (consonant ?x) (on-table ?x) (clear ?x) (handempty ?a) (can-move ?a ?x))
    :effect (and
      (not (on-table ?x))
      (not (clear ?x))
      (not (handempty ?a))
      (holding ?a ?x)
      (increase (total-cost) 1)
    )
  )

  (:action pickup-from-block-consonant
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (consonant-agent ?a) (consonant ?x) (on ?x ?y) (clear ?x) (handempty ?a) (can-move ?a ?x))
    :effect (and
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?x))
      (not (handempty ?a))
      (holding ?a ?x)
      (increase (total-cost) 1)
    )
  )

  (:action putdown-consonant
    :parameters (?a - agent ?x - block)
    :precondition (and (consonant-agent ?a) (consonant ?x) (holding ?a ?x))
    :effect (and
      (on-table ?x)
      (clear ?x)
      (not (holding ?a ?x))
      (handempty ?a)
      (increase (total-cost) 1)
    )
  )

  (:action stack-consonant
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (consonant-agent ?a) (consonant ?x) (holding ?a ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (not (holding ?a ?x))
      (handempty ?a)
      (increase (total-cost) 1)
    )
  )
)