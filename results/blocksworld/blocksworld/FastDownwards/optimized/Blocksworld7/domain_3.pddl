(define (domain combined-vowel-consonant)
  (:requirements :strips :typing :equality)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
    (agent-vowel ?a - agent)
    (agent-consonant ?a - agent)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)
  )

  (:action pickup-vowel-from-table
    :parameters (?a - agent ?x - block)
    :precondition (and (agent-vowel ?a) (vowel ?x) (ontable ?x) (clear ?x) (handempty ?a))
    :effect (and (holding ?a ?x) (not (ontable ?x)) (not (handempty ?a)))
  )

  (:action unstack-vowel
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (agent-vowel ?a) (vowel ?x) (on ?x ?y) (clear ?x) (handempty ?a))
    :effect (and (holding ?a ?x) (not (on ?x ?y)) (clear ?y) (not (handempty ?a)))
  )

  (:action putdown-vowel
    :parameters (?a - agent ?x - block)
    :precondition (and (agent-vowel ?a) (holding ?a ?x))
    :effect (and (ontable ?x) (clear ?x) (not (holding ?a ?x)) (handempty ?a))
  )

  (:action stack-vowel
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (agent-vowel ?a) (vowel ?x) (holding ?a ?x) (clear ?y) (not (= ?x ?y)))
    :effect (and (on ?x ?y) (clear ?x) (not (clear ?y)) (not (holding ?a ?x)) (handempty ?a))
  )

  (:action pickup-consonant-from-table
    :parameters (?a - agent ?x - block)
    :precondition (and (agent-consonant ?a) (consonant ?x) (ontable ?x) (clear ?x) (handempty ?a))
    :effect (and (holding ?a ?x) (not (ontable ?x)) (not (handempty ?a)))
  )

  (:action unstack-consonant
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (agent-consonant ?a) (consonant ?x) (on ?x ?y) (clear ?x) (handempty ?a))
    :effect (and (holding ?a ?x) (not (on ?x ?y)) (clear ?y) (not (handempty ?a)))
  )

  (:action putdown-consonant
    :parameters (?a - agent ?x - block)
    :precondition (and (agent-consonant ?a) (holding ?a ?x))
    :effect (and (ontable ?x) (clear ?x) (not (holding ?a ?x)) (handempty ?a))
  )

  (:action stack-consonant
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (agent-consonant ?a) (consonant ?x) (holding ?a ?x) (clear ?y) (not (= ?x ?y)))
    :effect (and (on ?x ?y) (clear ?x) (not (clear ?y)) (not (holding ?a ?x)) (handempty ?a))
  )
)