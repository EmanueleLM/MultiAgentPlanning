(define (domain blocks-multiagent-twoagents)
  (:requirements :strips :typing :negative-preconditions)
  (:types block support agent)

  (:predicates
    (on ?b - block ?s - support)         ; block ?b is directly on support ?s (block or table)
    (clear ?b - block)                   ; nothing on top of block ?b
    (handempty ?a - agent)               ; agent's hand is empty
    (holding ?a - agent ?b - block)      ; agent is holding block
    (vowel ?b - block)                   ; block is a vowel-type (A,E,I)
    (consonant ?b - block)               ; block is a consonant-type
    (canmove ?a - agent ?b - block)      ; agent is allowed to move this block
  )

  ;; Vowel-agent: unstack a vowel block from on top of another block
  (:action vowel_unstack
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and
      (canmove ?a ?b)
      (vowel ?b)
      (on ?b ?c)
      (clear ?b)
      (handempty ?a)
    )
    :effect (and
      (not (on ?b ?c))
      (holding ?a ?b)
      (not (handempty ?a))
      (not (clear ?b))   ; picked up => not clear
      (clear ?c)         ; block below becomes clear
    )
  )

  ;; Consonant-agent: unstack a consonant block from on top of another block
  (:action consonant_unstack
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and
      (canmove ?a ?b)
      (consonant ?b)
      (on ?b ?c)
      (clear ?b)
      (handempty ?a)
    )
    :effect (and
      (not (on ?b ?c))
      (holding ?a ?b)
      (not (handempty ?a))
      (not (clear ?b))
      (clear ?c)
    )
  )

  ;; Vowel-agent: pick up a vowel block from the table
  (:action vowel_pickup_table
    :parameters (?a - agent ?b - block)
    :precondition (and
      (canmove ?a ?b)
      (vowel ?b)
      (on ?b table)
      (clear ?b)
      (handempty ?a)
    )
    :effect (and
      (not (on ?b table))
      (holding ?a ?b)
      (not (handempty ?a))
      (not (clear ?b))
    )
  )

  ;; Consonant-agent: pick up a consonant block from the table
  (:action consonant_pickup_table
    :parameters (?a - agent ?b - block)
    :precondition (and
      (canmove ?a ?b)
      (consonant ?b)
      (on ?b table)
      (clear ?b)
      (handempty ?a)
    )
    :effect (and
      (not (on ?b table))
      (holding ?a ?b)
      (not (handempty ?a))
      (not (clear ?b))
    )
  )

  ;; Vowel-agent: put down a vowel block onto the table
  (:action vowel_putdown_table
    :parameters (?a - agent ?b - block)
    :precondition (and
      (holding ?a ?b)
      (vowel ?b)
      (canmove ?a ?b)
    )
    :effect (and
      (not (holding ?a ?b))
      (handempty ?a)
      (on ?b table)
      (clear ?b)
    )
  )

  ;; Consonant-agent: put down a consonant block onto the table
  (:action consonant_putdown_table
    :parameters (?a - agent ?b - block)
    :precondition (and
      (holding ?a ?b)
      (consonant ?b)
      (canmove ?a ?b)
    )
    :effect (and
      (not (holding ?a ?b))
      (handempty ?a)
      (on ?b table)
      (clear ?b)
    )
  )

  ;; Vowel-agent: stack a vowel block (that is being held) onto another block
  (:action vowel_stack_on
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and
      (holding ?a ?b)
      (vowel ?b)
      (canmove ?a ?b)
      (clear ?c)
    )
    :effect (and
      (not (holding ?a ?b))
      (handempty ?a)
      (on ?b ?c)
      (not (clear ?c))
      (clear ?b)
    )
  )

  ;; Consonant-agent: stack a consonant block (that is being held) onto another block
  (:action consonant_stack_on
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and
      (holding ?a ?b)
      (consonant ?b)
      (canmove ?a ?b)
      (clear ?c)
    )
    :effect (and
      (not (holding ?a ?b))
      (handempty ?a)
      (on ?b ?c)
      (not (clear ?c))
      (clear ?b)
    )
  )
)