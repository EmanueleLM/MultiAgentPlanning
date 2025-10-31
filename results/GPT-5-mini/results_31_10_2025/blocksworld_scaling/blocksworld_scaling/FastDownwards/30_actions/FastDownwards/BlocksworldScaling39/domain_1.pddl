; Domain: Two-agent blocks world for FastDownwards
; Assumptions/comments:
; - Two active movers: vowel_agent (moves only A,E,I) and consonant_agent (moves all other letters).
; - Orchestrator is present as an agent object but has no move capability.
; - Actions manipulate only top-of-stack blocks, one block at a time.
; - clear(X) means nothing sits on X (top of a stack).
(define (domain two-agent-blocks)
  (:requirements :strips :typing)
  (:types block agent)

  (:predicates
    (on ?b - block ?below - block)
    (on-table ?b - block)
    (clear ?b - block)
    (holding ?ag - agent ?b - block)
    (handempty ?ag - agent)
    (is_vowel ?b - block)
    (is_consonant ?b - block)
    (vowel_controller ?ag - agent)
    (consonant_controller ?ag - agent)
  )

  ; Vowel agent pickups and putdowns
  (:action pickup-vowel-from-block
    :parameters (?ag - agent ?v - block ?below - block)
    :precondition (and
      (vowel_controller ?ag)
      (is_vowel ?v)
      (on ?v ?below)
      (clear ?v)
      (handempty ?ag)
    )
    :effect (and
      (holding ?ag ?v)
      (not (on ?v ?below))
      (clear ?below)
      (not (handempty ?ag))
    )
  )

  (:action pickup-vowel-from-table
    :parameters (?ag - agent ?v - block)
    :precondition (and
      (vowel_controller ?ag)
      (is_vowel ?v)
      (on-table ?v)
      (clear ?v)
      (handempty ?ag)
    )
    :effect (and
      (holding ?ag ?v)
      (not (on-table ?v))
      (not (handempty ?ag))
    )
  )

  (:action putdown-vowel-on-block
    :parameters (?ag - agent ?v - block ?dest - block)
    :precondition (and
      (vowel_controller ?ag)
      (is_vowel ?v)
      (holding ?ag ?v)
      (clear ?dest)
    )
    :effect (and
      (on ?v ?dest)
      (not (clear ?dest))
      (not (holding ?ag ?v))
      (handempty ?ag)
      (clear ?v)
    )
  )

  (:action putdown-vowel-on-table
    :parameters (?ag - agent ?v - block)
    :precondition (and
      (vowel_controller ?ag)
      (is_vowel ?v)
      (holding ?ag ?v)
    )
    :effect (and
      (on-table ?v)
      (not (holding ?ag ?v))
      (handempty ?ag)
      (clear ?v)
    )
  )

  ; Consonant agent pickups and putdowns
  (:action pickup-consonant-from-block
    :parameters (?ag - agent ?x - block ?below - block)
    :precondition (and
      (consonant_controller ?ag)
      (is_consonant ?x)
      (on ?x ?below)
      (clear ?x)
      (handempty ?ag)
    )
    :effect (and
      (holding ?ag ?x)
      (not (on ?x ?below))
      (clear ?below)
      (not (handempty ?ag))
    )
  )

  (:action pickup-consonant-from-table
    :parameters (?ag - agent ?x - block)
    :precondition (and
      (consonant_controller ?ag)
      (is_consonant ?x)
      (on-table ?x)
      (clear ?x)
      (handempty ?ag)
    )
    :effect (and
      (holding ?ag ?x)
      (not (on-table ?x))
      (not (handempty ?ag))
    )
  )

  (:action putdown-consonant-on-block
    :parameters (?ag - agent ?x - block ?dest - block)
    :precondition (and
      (consonant_controller ?ag)
      (is_consonant ?x)
      (holding ?ag ?x)
      (clear ?dest)
    )
    :effect (and
      (on ?x ?dest)
      (not (clear ?dest))
      (not (holding ?ag ?x))
      (handempty ?ag)
      (clear ?x)
    )
  )

  (:action putdown-consonant-on-table
    :parameters (?ag - agent ?x - block)
    :precondition (and
      (consonant_controller ?ag)
      (is_consonant ?x)
      (holding ?ag ?x)
    )
    :effect (and
      (on-table ?x)
      (not (holding ?ag ?x))
      (handempty ?ag)
      (clear ?x)
    )
  )
)