(define (domain blocks-multiagent-twoagents)
  (:requirements :typing :negative-preconditions)
  (:types block support agent)

  (:constants table - support)

  (:predicates
    (on ?b - block ?s - support)
    (clear ?b - block)
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
    (canmove ?a - agent ?b - block)
  )

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
      (not (clear ?b))
      (clear ?c)
    )
  )

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