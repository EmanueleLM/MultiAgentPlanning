(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table place)
  ;; declare subtyping: blocks and table are kinds of place
  ;; (PDDL syntax for subtypes: list subtypes followed by '-' parent)
  (:types block table - place)

  (:predicates
    (on ?b - block ?p - place)     ; block ?b is on place ?p (block or table)
    (clear ?b - block)             ; nothing on top of ?b
    (vowel ?b - block)             ; block belongs to vowel agent (only vowels can be moved by vowel actions)
    (consonant ?b - block)         ; block belongs to consonant agent (only consonants can be moved by consonant actions)
  )

  ;; Vowel agent actions (only moves blocks marked (vowel ?b))
  ;; Move from a block to a block
  (:action vowel-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
              (clear ?b)
            )
  )

  ;; Move from table to a block
  (:action vowel-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (vowel ?b) (on ?b table) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b table))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?b)
            )
  )

  ;; Move from a block to the table
  (:action vowel-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (on ?b table)
              (clear ?from)
              (clear ?b)
            )
  )

  ;; Consonant agent actions (only moves blocks marked (consonant ?b))
  ;; Move from a block to a block
  (:action cons-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
              (clear ?b)
            )
  )

  ;; Move from table to a block
  (:action cons-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (consonant ?b) (on ?b table) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b table))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?b)
            )
  )

  ;; Move from a block to the table
  (:action cons-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (on ?b table)
              (clear ?from)
              (clear ?b)
            )
  )
)