(define (domain multi_agent_blocks_v2)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)          ; ?x is on top of ?y
    (ontable ?x - block)                ; ?x is on the table
    (clear ?x - block)                  ; nothing on ?x AND it is not held
    (handempty ?a - agent)              ; agent's hand is empty
    (holding ?a - agent ?b - block)     ; agent is holding block
    (vowel ?b - block)                  ; block is vowel-labeled (movable by vowel agent)
    (consonant ?b - block)              ; block is consonant-labeled (movable by consonant agent)
    (is_vowel_agent ?a - agent)         ; agent is the vowel agent
    (is_consonant_agent ?a - agent)     ; agent is the consonant agent
  )

  ;; Vowel-agent actions (can move only vowel-labeled blocks). Actions use agent parameter
  (:action vowel_pickup
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (is_vowel_agent ?ag)
      (handempty ?ag)
      (ontable ?b)
      (clear ?b)
      (vowel ?b)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
    )
  )

  (:action vowel_unstack
    :parameters (?ag - agent ?b - block ?under - block)
    :precondition (and
      (is_vowel_agent ?ag)
      (handempty ?ag)
      (on ?b ?under)
      (clear ?b)
      (vowel ?b)
    )
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (not (clear ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
    )
  )

  (:action vowel_putdown
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (is_vowel_agent ?ag)
      (holding ?ag ?b)
    )
    :effect (and
      (not (holding ?ag ?b))
      (handempty ?ag)
      (ontable ?b)
      (clear ?b)
    )
  )

  (:action vowel_stack
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and
      (is_vowel_agent ?ag)
      (holding ?ag ?b)
      (clear ?to)
      (vowel ?b)
    )
    :effect (and
      (not (holding ?ag ?b))
      (handempty ?ag)
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  ;; Consonant-agent actions (can move only consonant-labeled blocks)
  (:action consonant_pickup
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (is_consonant_agent ?ag)
      (handempty ?ag)
      (ontable ?b)
      (clear ?b)
      (consonant ?b)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
    )
  )

  (:action consonant_unstack
    :parameters (?ag - agent ?b - block ?under - block)
    :precondition (and
      (is_consonant_agent ?ag)
      (handempty ?ag)
      (on ?b ?under)
      (clear ?b)
      (consonant ?b)
    )
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (not (clear ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
    )
  )

  (:action consonant_putdown
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (is_consonant_agent ?ag)
      (holding ?ag ?b)
    )
    :effect (and
      (not (holding ?ag ?b))
      (handempty ?ag)
      (ontable ?b)
      (clear ?b)
    )
  )

  (:action consonant_stack
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and
      (is_consonant_agent ?ag)
      (holding ?ag ?b)
      (clear ?to)
      (consonant ?b)
    )
    :effect (and
      (not (holding ?ag ?b))
      (handempty ?ag)
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )
)