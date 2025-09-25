(define (domain multi-agent-stacks)
  (:requirements :strips :typing :action-costs :equality)
  (:types loc block - loc)
  (:constants table - loc)

  (:predicates
    (on ?b - block ?l - loc)
    (clear ?l - loc)
    (vowel ?b - block)
    (consonant ?b - block)
  )

  ;; Vowel agent actions
  (:action vowel_move_block_to_block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
    :cost 1
  )

  (:action vowel_move_block_to_table
    :parameters (?b - block ?from - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
    )
    :cost 1
  )

  (:action vowel_move_table_to_block
    :parameters (?b - block ?to - block)
    :precondition (and (vowel ?b) (on ?b table) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b table))
      (on ?b ?to)
      (not (clear ?to))
    )
    :cost 1
  )

  ;; Consonant agent actions
  (:action consonant_move_block_to_block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
    :cost 1
  )

  (:action consonant_move_block_to_table
    :parameters (?b - block ?from - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
    )
    :cost 1
  )

  (:action consonant_move_table_to_block
    :parameters (?b - block ?to - block)
    :precondition (and (consonant ?b) (on ?b table) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b table))
      (on ?b ?to)
      (not (clear ?to))
    )
    :cost 1
  )
)