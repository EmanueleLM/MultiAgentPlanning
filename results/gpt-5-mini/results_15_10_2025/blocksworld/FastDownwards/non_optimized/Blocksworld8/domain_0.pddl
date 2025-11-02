(define (domain multiagent-blocks-combined)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?b - block ?b2 - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?a - agent ?b - block)
    (handempty ?a - agent)
    (vowel ?b - block)
    (is-consonant ?b - block)
    (vowel-agent ?a - agent)
    (consonant-agent ?a - agent)
  )

  ;; Vowel-agent actions (prefixed vowel_)
  (:action vowel_pickup_from_table
    :parameters (?a - agent ?b - block)
    :precondition (and (vowel-agent ?a) (vowel ?b) (ontable ?b) (clear ?b) (handempty ?a))
    :effect (and
      (not (ontable ?b))
      (not (handempty ?a))
      (holding ?a ?b)
    )
  )

  (:action vowel_unstack
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and (vowel-agent ?a) (vowel ?b) (on ?b ?c) (clear ?b) (handempty ?a))
    :effect (and
      (not (on ?b ?c))
      (not (handempty ?a))
      (holding ?a ?b)
      (clear ?c)
    )
  )

  (:action vowel_stack
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and (vowel-agent ?a) (vowel ?b) (holding ?a ?b) (clear ?c))
    :effect (and
      (not (holding ?a ?b))
      (handempty ?a)
      (on ?b ?c)
      (not (clear ?c))
      (clear ?b)
    )
  )

  (:action vowel_putdown
    :parameters (?a - agent ?b - block)
    :precondition (and (vowel-agent ?a) (vowel ?b) (holding ?a ?b))
    :effect (and
      (not (holding ?a ?b))
      (handempty ?a)
      (ontable ?b)
      (clear ?b)
    )
  )

  ;; Consonant-agent actions (prefixed cons_)
  ;; These are harmonized to follow the same convention as vowel actions but require is-consonant.
  (:action cons_pickup_from_table
    :parameters (?a - agent ?b - block)
    :precondition (and (consonant-agent ?a) (is-consonant ?b) (ontable ?b) (clear ?b) (handempty ?a))
    :effect (and
      (not (ontable ?b))
      (not (handempty ?a))
      (holding ?a ?b)
    )
  )

  (:action cons_unstack
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and (consonant-agent ?a) (is-consonant ?b) (on ?b ?c) (clear ?b) (handempty ?a))
    :effect (and
      (not (on ?b ?c))
      (not (handempty ?a))
      (holding ?a ?b)
      (clear ?c)
    )
  )

  (:action cons_stack
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and (consonant-agent ?a) (is-consonant ?b) (holding ?a ?b) (clear ?c))
    :effect (and
      (not (holding ?a ?b))
      (handempty ?a)
      (on ?b ?c)
      (not (clear ?c))
      (clear ?b)
    )
  )

  (:action cons_putdown
    :parameters (?a - agent ?b - block)
    :precondition (and (consonant-agent ?a) (is-consonant ?b) (holding ?a ?b))
    :effect (and
      (not (holding ?a ?b))
      (handempty ?a)
      (ontable ?b)
      (clear ?b)
    )
  )
)