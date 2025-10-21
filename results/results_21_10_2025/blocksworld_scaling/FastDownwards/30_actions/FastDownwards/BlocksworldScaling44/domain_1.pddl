(define (domain blocksworld_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table)

  (:predicates
    (vowel ?x - block)
    (consonant ?x - block)
    (clear ?x - block)
    (on ?x - block ?y - (either block table))
    (different ?x - block ?y - block)
  )

  ;; Vowel-agent actions: can move only vowel-labelled blocks (A, E, I)
  (:action vowel_agent_move_vowel_onto_block_from_block
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and
                    (vowel ?x)
                    (clear ?x)
                    (clear ?to)
                    (on ?x ?from)
                    (different ?x ?to)
                  )
    :effect (and
              (not (on ?x ?from))
              (on ?x ?to)
              (not (clear ?to))
              (clear ?x)
              (clear ?from)
            )
  )

  (:action vowel_agent_move_vowel_onto_block_from_table
    :parameters (?x - block ?to - block)
    :precondition (and
                    (vowel ?x)
                    (clear ?x)
                    (clear ?to)
                    (on ?x table)
                    (different ?x ?to)
                  )
    :effect (and
              (not (on ?x table))
              (on ?x ?to)
              (not (clear ?to))
              (clear ?x)
            )
  )

  (:action vowel_agent_move_vowel_onto_table_from_block
    :parameters (?x - block ?from - block)
    :precondition (and
                    (vowel ?x)
                    (clear ?x)
                    (on ?x ?from)
                  )
    :effect (and
              (not (on ?x ?from))
              (on ?x table)
              (clear ?x)
              (clear ?from)
            )
  )

  ;; Consonant-agent actions: can move only consonant-labelled blocks (all non-vowel)
  (:action consonant_agent_move_block_onto_block_from_block
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and
                    (consonant ?x)
                    (clear ?x)
                    (clear ?to)
                    (on ?x ?from)
                    (different ?x ?to)
                  )
    :effect (and
              (not (on ?x ?from))
              (on ?x ?to)
              (not (clear ?to))
              (clear ?x)
              (clear ?from)
            )
  )

  (:action consonant_agent_move_block_onto_block_from_table
    :parameters (?x - block ?to - block)
    :precondition (and
                    (consonant ?x)
                    (clear ?x)
                    (clear ?to)
                    (on ?x table)
                    (different ?x ?to)
                  )
    :effect (and
              (not (on ?x table))
              (on ?x ?to)
              (not (clear ?to))
              (clear ?x)
            )
  )

  (:action consonant_agent_move_block_to_table_from_block
    :parameters (?x - block ?from - block)
    :precondition (and
                    (consonant ?x)
                    (clear ?x)
                    (on ?x ?from)
                  )
    :effect (and
              (not (on ?x ?from))
              (on ?x table)
              (clear ?x)
              (clear ?from)
            )
  )
)