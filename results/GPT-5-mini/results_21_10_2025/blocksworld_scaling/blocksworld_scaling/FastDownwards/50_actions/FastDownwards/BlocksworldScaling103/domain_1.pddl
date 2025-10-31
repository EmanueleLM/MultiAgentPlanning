(define (domain BlocksworldScaling103)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)
  (:constants vowel_agent consonant_agent orchestrator - agent)

  (:predicates
    (on ?b - block ?x - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?ag - agent ?b - block)
    (handempty ?ag - agent)
    (vowel ?b - block)
    (consonant ?b - block)
  )

  ;; Vowel agent actions
  (:action vowel_agent-pick-from-table
    :parameters (?b - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (handempty vowel_agent))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty vowel_agent))
      (holding vowel_agent ?b)
    )
  )

  (:action vowel_agent-pick-from-block
    :parameters (?b - block ?x - block)
    :precondition (and (vowel ?b) (on ?b ?x) (clear ?b) (handempty vowel_agent))
    :effect (and
      (not (on ?b ?x))
      (not (clear ?b))
      (not (handempty vowel_agent))
      (holding vowel_agent ?b)
      (clear ?x)
    )
  )

  (:action vowel_agent-place-on-table
    :parameters (?b - block)
    :precondition (and (vowel ?b) (holding vowel_agent ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty vowel_agent)
      (not (holding vowel_agent ?b))
    )
  )

  (:action vowel_agent-place-on-block
    :parameters (?b - block ?y - block)
    :precondition (and (vowel ?b) (holding vowel_agent ?b) (clear ?y))
    :effect (and
      (on ?b ?y)
      (clear ?b)
      (handempty vowel_agent)
      (not (holding vowel_agent ?b))
      (not (clear ?y))
    )
  )

  ;; Consonant agent actions
  (:action consonant_agent-pick-from-table
    :parameters (?b - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (handempty consonant_agent))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty consonant_agent))
      (holding consonant_agent ?b)
    )
  )

  (:action consonant_agent-pick-from-block
    :parameters (?b - block ?x - block)
    :precondition (and (consonant ?b) (on ?b ?x) (clear ?b) (handempty consonant_agent))
    :effect (and
      (not (on ?b ?x))
      (not (clear ?b))
      (not (handempty consonant_agent))
      (holding consonant_agent ?b)
      (clear ?x)
    )
  )

  (:action consonant_agent-place-on-table
    :parameters (?b - block)
    :precondition (and (consonant ?b) (holding consonant_agent ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty consonant_agent)
      (not (holding consonant_agent ?b))
    )
  )

  (:action consonant_agent-place-on-block
    :parameters (?b - block ?y - block)
    :precondition (and (consonant ?b) (holding consonant_agent ?b) (clear ?y))
    :effect (and
      (on ?b ?y)
      (clear ?b)
      (handempty consonant_agent)
      (not (holding consonant_agent ?b))
      (not (clear ?y))
    )
  )
)