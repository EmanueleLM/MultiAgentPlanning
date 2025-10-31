(define (domain blocks-multiagent)
  (:requirements :strips :typing)
  (:types block agent vowel_agent consonant_agent)

  (:predicates
    (ontable ?b - block)
    (on ?b - block ?c - block)
    (clear ?b - block)
    (holding ?ag - agent ?b - block)
    (handempty ?ag - agent)
    (vowel ?b - block)
    (consonant ?b - block)
  )

  ;; Vowel-agent actions (may move only vowel-labeled blocks)
  (:action pick-vowel-from-table
    :parameters (?ag - vowel_agent ?b - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (handempty ?ag))
    :effect (and
      (not (ontable ?b))
      (not (handempty ?ag))
      (not (clear ?b))
      (holding ?ag ?b)
    )
  )

  (:action pick-vowel-from-block
    :parameters (?ag - vowel_agent ?b - block ?below - block)
    :precondition (and (vowel ?b) (on ?b ?below) (clear ?b) (handempty ?ag))
    :effect (and
      (not (on ?b ?below))
      (not (handempty ?ag))
      (not (clear ?b))
      (holding ?ag ?b)
      (clear ?below)
    )
  )

  (:action put-vowel-to-table
    :parameters (?ag - vowel_agent ?b - block)
    :precondition (and (vowel ?b) (holding ?ag ?b))
    :effect (and
      (ontable ?b)
      (handempty ?ag)
      (clear ?b)
      (not (holding ?ag ?b))
    )
  )

  (:action put-vowel-to-block
    :parameters (?ag - vowel_agent ?b - block ?target - block)
    :precondition (and (vowel ?b) (holding ?ag ?b) (clear ?target))
    :effect (and
      (on ?b ?target)
      (handempty ?ag)
      (clear ?b)
      (not (holding ?ag ?b))
      (not (clear ?target))
    )
  )

  ;; Consonant-agent actions (may move only consonant-labeled blocks)
  (:action pick-consonant-from-table
    :parameters (?ag - consonant_agent ?b - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (handempty ?ag))
    :effect (and
      (not (ontable ?b))
      (not (handempty ?ag))
      (not (clear ?b))
      (holding ?ag ?b)
    )
  )

  (:action pick-consonant-from-block
    :parameters (?ag - consonant_agent ?b - block ?below - block)
    :precondition (and (consonant ?b) (on ?b ?below) (clear ?b) (handempty ?ag))
    :effect (and
      (not (on ?b ?below))
      (not (handempty ?ag))
      (not (clear ?b))
      (holding ?ag ?b)
      (clear ?below)
    )
  )

  (:action put-consonant-to-table
    :parameters (?ag - consonant_agent ?b - block)
    :precondition (and (consonant ?b) (holding ?ag ?b))
    :effect (and
      (ontable ?b)
      (handempty ?ag)
      (clear ?b)
      (not (holding ?ag ?b))
    )
  )

  (:action put-consonant-to-block
    :parameters (?ag - consonant_agent ?b - block ?target - block)
    :precondition (and (consonant ?b) (holding ?ag ?b) (clear ?target))
    :effect (and
      (on ?b ?target)
      (handempty ?ag)
      (clear ?b)
      (not (holding ?ag ?b))
      (not (clear ?target))
    )
  )
)