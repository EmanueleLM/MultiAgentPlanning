(define (domain multi-agent-blocks)
  (:requirements :strips :typing)
  (:types agent block)

  (:predicates
    (on ?b - block ?s - block)        ; block b is on block s
    (ontable ?b - block)              ; block is on the table
    (clear ?b - block)                ; nothing on top of block
    (holding ?a - agent ?b - block)   ; agent a is holding block b
    (handempty ?a - agent)            ; agent a's hand is empty
    (vowel-block ?b - block)          ; block is assigned to vowel agent
    (consonant-block ?b - block)      ; block is assigned to consonant agent
    (vowel-agent ?a - agent)          ; agent is the vowel agent
    (consonant-agent ?a - agent)      ; agent is the consonant agent
  )

  ;; Actions for the vowel_agent
  (:action vowel_pickup
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (vowel-agent ?ag)
      (vowel-block ?b)
      (ontable ?b)
      (clear ?b)
      (handempty ?ag)
    )
    :effect (and
      (holding ?ag ?b)
      (not (ontable ?b))
      (not (handempty ?ag))
      (not (clear ?b))
    )
  )

  (:action vowel_unstack
    :parameters (?ag - agent ?b - block ?s - block)
    :precondition (and
      (vowel-agent ?ag)
      (vowel-block ?b)
      (on ?b ?s)
      (clear ?b)
      (handempty ?ag)
    )
    :effect (and
      (holding ?ag ?b)
      (not (on ?b ?s))
      (clear ?s)
      (not (handempty ?ag))
      (not (clear ?b))
    )
  )

  (:action vowel_stack
    :parameters (?ag - agent ?b - block ?s - block)
    :precondition (and
      (vowel-agent ?ag)
      (vowel-block ?b)
      (holding ?ag ?b)
      (clear ?s)
      (not (= ?b ?s))
    )
    :effect (and
      (on ?b ?s)
      (clear ?b)
      (not (clear ?s))
      (not (holding ?ag ?b))
      (handempty ?ag)
    )
  )

  (:action vowel_putdown
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (vowel-agent ?ag)
      (vowel-block ?b)
      (holding ?ag ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?ag ?b))
      (handempty ?ag)
    )
  )

  ;; Actions for the consonant_agent
  (:action consonant_pickup
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (consonant-agent ?ag)
      (consonant-block ?b)
      (ontable ?b)
      (clear ?b)
      (handempty ?ag)
    )
    :effect (and
      (holding ?ag ?b)
      (not (ontable ?b))
      (not (handempty ?ag))
      (not (clear ?b))
    )
  )

  (:action consonant_unstack
    :parameters (?ag - agent ?b - block ?s - block)
    :precondition (and
      (consonant-agent ?ag)
      (consonant-block ?b)
      (on ?b ?s)
      (clear ?b)
      (handempty ?ag)
    )
    :effect (and
      (holding ?ag ?b)
      (not (on ?b ?s))
      (clear ?s)
      (not (handempty ?ag))
      (not (clear ?b))
    )
  )

  (:action consonant_stack
    :parameters (?ag - agent ?b - block ?s - block)
    :precondition (and
      (consonant-agent ?ag)
      (consonant-block ?b)
      (holding ?ag ?b)
      (clear ?s)
      (not (= ?b ?s))
    )
    :effect (and
      (on ?b ?s)
      (clear ?b)
      (not (clear ?s))
      (not (holding ?ag ?b))
      (handempty ?ag)
    )
  )

  (:action consonant_putdown
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (consonant-agent ?ag)
      (consonant-block ?b)
      (holding ?ag ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?ag ?b))
      (handempty ?ag)
    )
  )
)