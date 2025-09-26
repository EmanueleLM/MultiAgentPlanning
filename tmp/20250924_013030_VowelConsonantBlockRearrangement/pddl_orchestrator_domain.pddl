(define (domain multiagent-blocks)
  (:requirements :typing :negative-preconditions :fluents)
  (:types block agent)
  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)
    (vowel-capable ?b - block)
    (consonant-capable ?b - block)
  )
  (:functions
    (total-stacks)
  )

  ;; Vowel agent: pick a top block from the table
  (:action pick-vowel-from-table
    :parameters (?b - block ?a - agent)
    :precondition (and
      (= ?a vowel_agent)
      (vowel-capable ?b)
      (handempty ?a)
      (on-table ?b)
      (clear ?b)
    )
    :effect (and
      (not (on-table ?b))
      (not (clear ?b))
      (not (handempty ?a))
      (holding ?a ?b)
      (decrease (total-stacks) 1)
    )
  )

  ;; Vowel agent: pick a top block from on top of another block
  (:action pick-vowel-from-block
    :parameters (?b - block ?under - block ?a - agent)
    :precondition (and
      (= ?a vowel_agent)
      (vowel-capable ?b)
      (handempty ?a)
      (on ?b ?under)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?under))
      (not (clear ?b))
      (clear ?under)
      (not (handempty ?a))
      (holding ?a ?b)
    )
  )

  ;; Vowel agent: place a held block onto another block
  (:action place-vowel-on-block
    :parameters (?b - block ?target - block ?a - agent)
    :precondition (and
      (= ?a vowel_agent)
      (holding ?a ?b)
      (clear ?target)
      (not (holding consonant_agent ?target))
    )
    :effect (and
      (not (holding ?a ?b))
      (handempty ?a)
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
    )
  )

  ;; Vowel agent: place a held block onto the table (creates a new stack)
  (:action place-vowel-on-table
    :parameters (?b - block ?a - agent)
    :precondition (and
      (= ?a vowel_agent)
      (holding ?a ?b)
      (< (total-stacks) 3)
    )
    :effect (and
      (not (holding ?a ?b))
      (handempty ?a)
      (on-table ?b)
      (clear ?b)
      (increase (total-stacks) 1)
    )
  )

  ;; Consonant agent: pick a top block from the table
  (:action pick-consonant-from-table
    :parameters (?b - block ?a - agent)
    :precondition (and
      (= ?a consonant_agent)
      (consonant-capable ?b)
      (handempty ?a)
      (on-table ?b)
      (clear ?b)
    )
    :effect (and
      (not (on-table ?b))
      (not (clear ?b))
      (not (handempty ?a))
      (holding ?a ?b)
      (decrease (total-stacks) 1)
    )
  )

  ;; Consonant agent: pick a top block from on top of another block
  (:action pick-consonant-from-block
    :parameters (?b - block ?under - block ?a - agent)
    :precondition (and
      (= ?a consonant_agent)
      (consonant-capable ?b)
      (handempty ?a)
      (on ?b ?under)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?under))
      (not (clear ?b))
      (clear ?under)
      (not (handempty ?a))
      (holding ?a ?b)
    )
  )

  ;; Consonant agent: place a held block onto another block
  (:action place-consonant-on-block
    :parameters (?b - block ?target - block ?a - agent)
    :precondition (and
      (= ?a consonant_agent)
      (holding ?a ?b)
      (clear ?target)
      (not (holding vowel_agent ?target))
    )
    :effect (and
      (not (holding ?a ?b))
      (handempty ?a)
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
    )
  )

  ;; Consonant agent: place a held block onto the table (creates a new stack)
  (:action place-consonant-on-table
    :parameters (?b - block ?a - agent)
    :precondition (and
      (= ?a consonant_agent)
      (holding ?a ?b)
      (< (total-stacks) 3)
    )
    :effect (and
      (not (holding ?a ?b))
      (handempty ?a)
      (on-table ?b)
      (clear ?b)
      (increase (total-stacks) 1)
    )
  )
)