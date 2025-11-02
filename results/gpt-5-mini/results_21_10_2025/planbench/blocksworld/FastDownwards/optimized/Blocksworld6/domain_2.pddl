(define (domain multi_agent_block_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types support block - support)

  (:predicates
    (on ?x - block ?y - support)
    (clear ?x - block)
    (holding-v ?x - block)
    (holding-c ?x - block)
    (handempty-v)
    (handempty-c)
    (vowel ?x - block)
    (consonant ?x - block)
  )

  (:action vowel-pickup-from-table
    :parameters (?b - block ?t - support)
    :precondition (and (vowel ?b) (on ?b ?t) (clear ?b) (handempty-v) (not (on ?b ?b)))
    :effect (and
      (not (on ?b ?t))
      (holding-v ?b)
      (not (clear ?b))
      (not (handempty-v))
    )
  )

  (:action vowel-unstack
    :parameters (?b - block ?s - block)
    :precondition (and (vowel ?b) (on ?b ?s) (clear ?b) (handempty-v))
    :effect (and
      (not (on ?b ?s))
      (holding-v ?b)
      (clear ?s)
      (not (clear ?b))
      (not (handempty-v))
    )
  )

  (:action vowel-putdown-on-table
    :parameters (?b - block ?t - support)
    :precondition (and (vowel ?b) (holding-v ?b))
    :effect (and
      (on ?b ?t)
      (clear ?b)
      (not (holding-v ?b))
      (handempty-v)
    )
  )

  (:action vowel-stack-on-block
    :parameters (?b - block ?s - block)
    :precondition (and (vowel ?b) (holding-v ?b) (clear ?s) (not (on ?b ?s)))
    :effect (and
      (on ?b ?s)
      (not (clear ?s))
      (clear ?b)
      (not (holding-v ?b))
      (handempty-v)
    )
  )

  (:action cons-pickup-from-table
    :parameters (?b - block ?t - support)
    :precondition (and (consonant ?b) (on ?b ?t) (clear ?b) (handempty-c))
    :effect (and
      (not (on ?b ?t))
      (holding-c ?b)
      (not (clear ?b))
      (not (handempty-c))
    )
  )

  (:action cons-unstack
    :parameters (?b - block ?s - block)
    :precondition (and (consonant ?b) (on ?b ?s) (clear ?b) (handempty-c))
    :effect (and
      (not (on ?b ?s))
      (holding-c ?b)
      (clear ?s)
      (not (clear ?b))
      (not (handempty-c))
    )
  )

  (:action cons-putdown-on-table
    :parameters (?b - block ?t - support)
    :precondition (and (consonant ?b) (holding-c ?b))
    :effect (and
      (on ?b ?t)
      (clear ?b)
      (not (holding-c ?b))
      (handempty-c)
    )
  )

  (:action cons-stack-on-block
    :parameters (?b - block ?s - block)
    :precondition (and (consonant ?b) (holding-c ?b) (clear ?s) (not (on ?b ?s)))
    :effect (and
      (on ?b ?s)
      (not (clear ?s))
      (clear ?b)
      (not (holding-c ?b))
      (handempty-c)
    )
  )
)