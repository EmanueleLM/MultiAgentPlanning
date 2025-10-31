(define (domain blocks_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?b - block ?x - block)     ;; block ?b is on block ?x
    (ontable ?b - block)           ;; block ?b is on the table
    (clear ?b - block)             ;; nothing is on top of ?b
    (vowel ?b - block)             ;; block is vowel-labelled (A, E, I)
    (consonant ?b - block)         ;; block is consonant-labelled (others)
  )

  ;; ACTIONS FOR VOWEL AGENT (vowel_agent may move only A, E, I)
  ;; Move a vowel block from one block to another block
  (:action vowel_agent-move_block_block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
                    (vowel ?b)
                    (on ?b ?from)
                    (clear ?b)
                    (clear ?to)
                  )
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  ;; Move a vowel block from the table onto a block
  (:action vowel_agent-move_table_block
    :parameters (?b - block ?to - block)
    :precondition (and
                    (vowel ?b)
                    (ontable ?b)
                    (clear ?b)
                    (clear ?to)
                  )
    :effect (and
              (not (ontable ?b))
              (on ?b ?to)
              (not (clear ?to))
            )
  )

  ;; Move a vowel block from a block onto the table
  (:action vowel_agent-move_block_table
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
            )
  )

  ;; ACTIONS FOR CONSONANT AGENT (consonant_agent may move only consonant-labelled blocks)
  ;; Move a consonant block from one block to another block
  (:action consonant_agent-move_block_block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
                    (consonant ?b)
                    (on ?b ?from)
                    (clear ?b)
                    (clear ?to)
                  )
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  ;; Move a consonant block from the table onto a block
  (:action consonant_agent-move_table_block
    :parameters (?b - block ?to - block)
    :precondition (and
                    (consonant ?b)
                    (ontable ?b)
                    (clear ?b)
                    (clear ?to)
                  )
    :effect (and
              (not (ontable ?b))
              (on ?b ?to)
              (not (clear ?to))
            )
  )

  ;; Move a consonant block from a block onto the table
  (:action consonant_agent-move_block_table
    :parameters (?b - block ?from - block)
    :precondition (and
                    (consonant ?b)
                    (on ?b ?from)
                    (clear ?b)
                  )
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
            )
  )
)