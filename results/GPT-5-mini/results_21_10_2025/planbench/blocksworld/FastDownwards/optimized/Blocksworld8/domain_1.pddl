(define (domain multiagent-blocks-combined)
  :requirements :strips :typing :negative-preconditions
  :types block agent

  :predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)
    (is-vowel ?x - block)
    (is-consonant ?x - block)
  ;; -- Vowel-agent actions (prefixed vowel-). Only manipulates blocks labeled as vowels.
  (:action vowel-pick-from-table
    :parameters (?b - block)
    :precondition (and (handempty vowel_agent) (ontable ?b) (clear ?b) (is-vowel ?b))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty vowel_agent))
      (holding vowel_agent ?b)
    )
  )

  (:action vowel-pick-from-block
    :parameters (?b - block ?below - block)
    :precondition (and (handempty vowel_agent) (on ?b ?below) (clear ?b) (is-vowel ?b))
    :effect (and
      (not (on ?b ?below))
      (clear ?below)
      (not (clear ?b))
      (not (handempty vowel_agent))
      (holding vowel_agent ?b)
    )
  )

  (:action vowel-put-to-table
    :parameters (?b - block)
    :precondition (holding vowel_agent ?b)
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty vowel_agent)
      (not (holding vowel_agent ?b))
    )
  )

  (:action vowel-put-on-block
    :parameters (?b - block ?target - block)
    :precondition (and (holding vowel_agent ?b) (clear ?target) (is-vowel ?b))
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (handempty vowel_agent)
      (not (holding vowel_agent ?b))
    )
  )

  ;; -- Consonant-agent actions (prefixed consonant-). Only manipulates consonant-labeled blocks.
  (:action consonant-pick-from-table
    :parameters (?b - block)
    :precondition (and (handempty consonant_agent) (ontable ?b) (clear ?b) (is-consonant ?b))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty consonant_agent))
      (holding consonant_agent ?b)
    )
  )

  (:action consonant-pick-from-block
    :parameters (?b - block ?below - block)
    :precondition (and (handempty consonant_agent) (on ?b ?below) (clear ?b) (is-consonant ?b))
    :effect (and
      (not (on ?b ?below))
      (clear ?below)
      (not (clear ?b))
      (not (handempty consonant_agent))
      (holding consonant_agent ?b)
    )
  )

  (:action consonant-put-to-table
    :parameters (?b - block)
    :precondition (holding consonant_agent ?b)
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty consonant_agent)
      (not (holding consonant_agent ?b))
    )
  )

  (:action consonant-put-on-block
    :parameters (?b - block ?target - block)
    :precondition (and (holding consonant_agent ?b) (clear ?target) (is-consonant ?b))
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (handempty consonant_agent)
      (not (holding consonant_agent ?b))
    )
  )
)