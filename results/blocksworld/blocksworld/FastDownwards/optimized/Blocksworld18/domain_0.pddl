(define (domain multiagent-blocks)
  (:requirements :strips :typing :equality :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?b - block ?s - block)    ; block ?b is on block ?s
    (ontable ?b - block)          ; block ?b is on the table
    (clear ?b - block)            ; nothing on top of block ?b
    (vowel ?b - block)            ; block is a vowel (movable by vowel_agent)
    (consonant ?b - block)        ; block is a consonant (movable by consonant_agent)
    (agent ?a - agent)            ; agent identity (for consonant agent actions)
  )

  ;; -------------------------
  ;; Vowel-agent actions
  ;; (these actions may only move blocks marked (vowel ?b))
  ;; -------------------------
  (:action vowel_agent-move-from-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
    )
  )

  (:action vowel_agent-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action vowel_agent-move-from-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )

  ;; -------------------------
  ;; Consonant-agent actions
  ;; (these actions require an agent object and may only move consonants)
  ;; -------------------------
  (:action consonant_agent-move-from-table-to-block
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and
      (agent ?ag)
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action consonant_agent-move-from-block-to-block
    :parameters (?ag - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (agent ?ag)
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action consonant_agent-move-from-block-to-table
    :parameters (?ag - agent ?b - block ?from - block)
    :precondition (and
      (agent ?ag)
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )
)