(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?b - block)
    (handempty ?a - agent)
    (is-vowel ?b - block)
    (is-consonant ?b - block)
    (vowel-agent ?a - agent)
    (consonant-agent ?a - agent)
  )

  ;; Vowel-agent: pick up from table
  (:action pick-up-from-table-vowel
    :parameters (?a - agent ?b - block)
    :precondition (and (handempty ?a) (ontable ?b) (clear ?b) (vowel-agent ?a) (is-vowel ?b))
    :effect (and (not (ontable ?b)) (not (handempty ?a)) (holding ?a ?b))
  )

  ;; Consonant-agent: pick up from table
  (:action pick-up-from-table-consonant
    :parameters (?a - agent ?b - block)
    :precondition (and (handempty ?a) (ontable ?b) (clear ?b) (consonant-agent ?a) (is-consonant ?b))
    :effect (and (not (ontable ?b)) (not (handempty ?a)) (holding ?a ?b))
  )

  ;; Vowel-agent: pick up from another block
  (:action pick-up-from-block-vowel
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and (handempty ?a) (on ?b ?c) (clear ?b) (vowel-agent ?a) (is-vowel ?b))
    :effect (and (not (on ?b ?c)) (clear ?c) (not (handempty ?a)) (holding ?a ?b))
  )

  ;; Consonant-agent: pick up from another block
  (:action pick-up-from-block-consonant
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and (handempty ?a) (on ?b ?c) (clear ?b) (consonant-agent ?a) (is-consonant ?b))
    :effect (and (not (on ?b ?c)) (clear ?c) (not (handempty ?a)) (holding ?a ?b))
  )

  ;; Vowel-agent: put down to table
  (:action putdown-to-table-vowel
    :parameters (?a - agent ?b - block)
    :precondition (and (holding ?a ?b) (vowel-agent ?a) (is-vowel ?b))
    :effect (and (ontable ?b) (clear ?b) (handempty ?a) (not (holding ?a ?b)))
  )

  ;; Consonant-agent: put down to table
  (:action putdown-to-table-consonant
    :parameters (?a - agent ?b - block)
    :precondition (and (holding ?a ?b) (consonant-agent ?a) (is-consonant ?b))
    :effect (and (ontable ?b) (clear ?b) (handempty ?a) (not (holding ?a ?b)))
  )

  ;; Vowel-agent: stack onto another block
  (:action stack-onto-vowel
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and (holding ?a ?b) (clear ?c) (vowel-agent ?a) (is-vowel ?b))
    :effect (and (on ?b ?c) (clear ?b) (not (clear ?c)) (handempty ?a) (not (holding ?a ?b)))
  )

  ;; Consonant-agent: stack onto another block
  (:action stack-onto-consonant
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and (holding ?a ?b) (clear ?c) (consonant-agent ?a) (is-consonant ?b))
    :effect (and (on ?b ?c) (clear ?b) (not (clear ?c)) (handempty ?a) (not (holding ?a ?b)))
  )
)