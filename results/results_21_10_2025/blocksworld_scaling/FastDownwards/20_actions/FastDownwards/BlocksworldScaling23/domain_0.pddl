(define (domain blocks-multiagent)
  (:requirements :strips :typing)
  (:types support block) ; blocks are a subtype of support so a block can be used as a support too
  (:predicates
    (on ?b - block ?s - support)        ; block ?b is directly on support ?s (block or table)
    (clear ?b - block)                  ; ?b has nothing on top (is top of its stack)
    (vowel ?b - block)                  ; label ?b is a vowel
    (consonant ?b - block)              ; label ?b is a consonant
  )

  ;; VOWEL-AGENT ACTIONS
  ;; Move a vowel block from a block support to the table (creates/uses a table stack)
  (:action vowel-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (on ?b ?from) (clear ?b) (vowel ?b))
    :effect (and
              (not (on ?b ?from))
              (on ?b table)
              (clear ?from)
              (clear ?b)
            )
  )

  ;; Move a vowel block that is on the table onto another (top) block
  (:action vowel-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (on ?b table) (clear ?b) (clear ?to) (vowel ?b))
    :effect (and
              (not (on ?b table))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?b)
            )
  )

  ;; Move a vowel block from one block to another block (both blocks are explicit)
  (:action vowel-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to) (vowel ?b))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
              (not (clear ?to))
              (clear ?b)
            )
  )

  ;; CONSONANT-AGENT ACTIONS
  ;; Move a consonant block from a block support to the table
  (:action consonant-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (on ?b ?from) (clear ?b) (consonant ?b))
    :effect (and
              (not (on ?b ?from))
              (on ?b table)
              (clear ?from)
              (clear ?b)
            )
  )

  ;; Move a consonant block that is on the table onto another (top) block
  (:action consonant-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (on ?b table) (clear ?b) (clear ?to) (consonant ?b))
    :effect (and
              (not (on ?b table))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?b)
            )
  )

  ;; Move a consonant block from one block to another block
  (:action consonant-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to) (consonant ?b))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
              (not (clear ?to))
              (clear ?b)
            )
  )
)