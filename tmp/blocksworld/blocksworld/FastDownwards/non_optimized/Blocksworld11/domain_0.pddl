(define (domain multiagent-blocks)
  (:requirements :strips :typing)
  (:types block agent agent-vowel agent-cons - agent)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?b - block)
    (handempty ?a - agent)
  )

  ;; Actions for the vowel_agent (agent of type agent-vowel)
  (:action vowel-pickup-from-table
    :parameters (?a - agent-vowel ?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty ?a))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty ?a))
              (holding ?a ?b))
  )

  (:action vowel-pickup-from-block
    :parameters (?a - agent-vowel ?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty ?a))
    :effect (and
              (not (on ?b ?c))
              (not (clear ?b))
              (not (handempty ?a))
              (clear ?c)
              (holding ?a ?b))
  )

  (:action vowel-putdown-to-table
    :parameters (?a - agent-vowel ?b - block)
    :precondition (holding ?a ?b)
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty ?a)
              (not (holding ?a ?b)))
  )

  (:action vowel-stack-onto
    :parameters (?a - agent-vowel ?b - block ?c - block)
    :precondition (and (holding ?a ?b) (clear ?c))
    :effect (and
              (on ?b ?c)
              (clear ?b)
              (handempty ?a)
              (not (holding ?a ?b))
              (not (clear ?c)))
  )

  ;; Actions for the consonant_agent (agent of type agent-cons)
  (:action consonant-pickup-from-table
    :parameters (?a - agent-cons ?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty ?a))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty ?a))
              (holding ?a ?b))
  )

  (:action consonant-pickup-from-block
    :parameters (?a - agent-cons ?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty ?a))
    :effect (and
              (not (on ?b ?c))
              (not (clear ?b))
              (not (handempty ?a))
              (clear ?c)
              (holding ?a ?b))
  )

  (:action consonant-putdown-to-table
    :parameters (?a - agent-cons ?b - block)
    :precondition (holding ?a ?b)
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty ?a)
              (not (holding ?a ?b)))
  )

  (:action consonant-stack-onto
    :parameters (?a - agent-cons ?b - block ?c - block)
    :precondition (and (holding ?a ?b) (clear ?c))
    :effect (and
              (on ?b ?c)
              (clear ?b)
              (handempty ?a)
              (not (holding ?a ?b))
              (not (clear ?c)))
  )
)