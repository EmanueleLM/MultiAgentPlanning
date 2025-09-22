(define (domain multi-agent-blocksworld)
  (:requirements :strips :typing)
  (:types block agent)

  (:constants
    vowel_agent consonant_agent - agent
  )

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)
  )

  ;; Actions belonging to the vowel_agent
  (:action vowel-pickup
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty vowel_agent))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty vowel_agent))
              (holding vowel_agent ?b))
  )

  (:action vowel-putdown
    :parameters (?b - block)
    :precondition (holding vowel_agent ?b)
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty vowel_agent)
              (not (holding vowel_agent ?b)))
  )

  (:action vowel-stack
    :parameters (?b - block ?target - block)
    :precondition (and (holding vowel_agent ?b) (clear ?target))
    :effect (and
              (on ?b ?target)
              (clear ?b)
              (handempty vowel_agent)
              (not (holding vowel_agent ?b))
              (not (clear ?target)))
  )

  (:action vowel-unstack
    :parameters (?b - block ?below - block)
    :precondition (and (on ?b ?below) (clear ?b) (handempty vowel_agent))
    :effect (and
              (holding vowel_agent ?b)
              (clear ?below)
              (not (on ?b ?below))
              (not (clear ?b))
              (not (handempty vowel_agent)))
  )

  ;; Actions belonging to the consonant_agent
  (:action consonant-pickup
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty consonant_agent))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty consonant_agent))
              (holding consonant_agent ?b))
  )

  (:action consonant-putdown
    :parameters (?b - block)
    :precondition (holding consonant_agent ?b)
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty consonant_agent)
              (not (holding consonant_agent ?b)))
  )

  (:action consonant-stack
    :parameters (?b - block ?target - block)
    :precondition (and (holding consonant_agent ?b) (clear ?target))
    :effect (and
              (on ?b ?target)
              (clear ?b)
              (handempty consonant_agent)
              (not (holding consonant_agent ?b))
              (not (clear ?target)))
  )

  (:action consonant-unstack
    :parameters (?b - block ?below - block)
    :precondition (and (on ?b ?below) (clear ?b) (handempty consonant_agent))
    :effect (and
              (holding consonant_agent ?b)
              (clear ?below)
              (not (on ?b ?below))
              (not (clear ?b))
              (not (handempty consonant_agent)))
  )
)