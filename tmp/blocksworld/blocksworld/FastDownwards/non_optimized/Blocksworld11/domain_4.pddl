(define (domain multiagent-blocks)
  (:requirements :strips :typing)
  (:types block agent-vowel agent-cons)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
    (holding-vowel ?a - agent-vowel ?b - block)
    (holding-cons ?a - agent-cons ?b - block)
    (handempty-vowel ?a - agent-vowel)
    (handempty-cons ?a - agent-cons)
  )

  (:action vowel-pickup-from-table
    :parameters (?a - agent-vowel ?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty-vowel ?a) (vowel ?b))
    :effect (and
              (not (ontable ?b))
              (not (handempty-vowel ?a))
              (holding-vowel ?a ?b))
  )

  (:action vowel-pickup-from-block
    :parameters (?a - agent-vowel ?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty-vowel ?a) (vowel ?b))
    :effect (and
              (not (on ?b ?c))
              (not (handempty-vowel ?a))
              (clear ?c)
              (holding-vowel ?a ?b))
  )

  (:action vowel-putdown-to-table
    :parameters (?a - agent-vowel ?b - block)
    :precondition (holding-vowel ?a ?b)
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty-vowel ?a)
              (not (holding-vowel ?a ?b)))
  )

  (:action vowel-stack-onto
    :parameters (?a - agent-vowel ?b - block ?c - block)
    :precondition (and (holding-vowel ?a ?b) (clear ?c))
    :effect (and
              (on ?b ?c)
              (clear ?b)
              (handempty-vowel ?a)
              (not (holding-vowel ?a ?b))
              (not (clear ?c)))
  )

  (:action consonant-pickup-from-table
    :parameters (?a - agent-cons ?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty-cons ?a) (consonant ?b))
    :effect (and
              (not (ontable ?b))
              (not (handempty-cons ?a))
              (holding-cons ?a ?b))
  )

  (:action consonant-pickup-from-block
    :parameters (?a - agent-cons ?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty-cons ?a) (consonant ?b))
    :effect (and
              (not (on ?b ?c))
              (not (handempty-cons ?a))
              (clear ?c)
              (holding-cons ?a ?b))
  )

  (:action consonant-putdown-to-table
    :parameters (?a - agent-cons ?b - block)
    :precondition (holding-cons ?a ?b)
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty-cons ?a)
              (not (holding-cons ?a ?b)))
  )

  (:action consonant-stack-onto
    :parameters (?a - agent-cons ?b - block ?c - block)
    :precondition (and (holding-cons ?a ?b) (clear ?c))
    :effect (and
              (on ?b ?c)
              (clear ?b)
              (handempty-cons ?a)
              (not (holding-cons ?a ?b))
              (not (clear ?c)))
  )
)