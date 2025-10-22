; Domain: Two-agent blocks world for FastDownwards
; Assumptions:
; - Two agents exist: vowel_agent (may move only vowel blocks A,E,I) and consonant_agent (may move only consonant blocks).
; - Table is represented via on-table predicates. Putting on the table is always allowed.
; - handempty(agent) denotes the agent's hand is free. Each agent has its own hand (single-handed agents).
; - clear(block) means there is no block on top of that block (a held block is still considered clear).
; - No conditional effects or negative-preconditions are used beyond standard STRIPS deletes/adds.
(define (domain two-agent-blocks)
  (:requirements :strips :typing)
  (:types block agent)

  (:predicates
    (on ?b - block ?support - block)      ; block on another block
    (on-table ?b - block)                 ; block directly on the table
    (clear ?b - block)                    ; nothing on top of block
    (holding ?ag - agent ?b - block)      ; agent is holding block
    (handempty ?ag - agent)               ; agent's hand is empty
    (is_vowel ?b - block)
    (is_consonant ?b - block)
    (vowel_controller ?ag - agent)
    (consonant_controller ?ag - agent)
  )

  ; Vowel agent: pickup from block
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

  ; Vowel agent: pickup from table
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

  ; Vowel agent: putdown on block
  (:action putdown-vowel-on-block
    :parameters (?ag - agent ?v - block ?dest - block)
    :precondition (and
      (vowel_controller ?ag)
      (is_vowel ?v)
      (holding ?ag ?v)
      (clear ?dest)
      (not (= ?v ?dest))
    )
    :effect (and
      (on ?v ?dest)
      (not (clear ?dest))
      (not (holding ?ag ?v))
      (handempty ?ag)
      (clear ?v)
    )
  )

  ; Vowel agent: putdown on table
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

  ; Consonant agent: pickup from block
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

  ; Consonant agent: pickup from table
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

  ; Consonant agent: putdown on block
  (:action putdown-consonant-on-block
    :parameters (?ag - agent ?x - block ?dest - block)
    :precondition (and
      (consonant_controller ?ag)
      (is_consonant ?x)
      (holding ?ag ?x)
      (clear ?dest)
      (not (= ?x ?dest))
    )
    :effect (and
      (on ?x ?dest)
      (not (clear ?dest))
      (not (holding ?ag ?x))
      (handempty ?ag)
      (clear ?x)
    )
  )

  ; Consonant agent: putdown on table
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