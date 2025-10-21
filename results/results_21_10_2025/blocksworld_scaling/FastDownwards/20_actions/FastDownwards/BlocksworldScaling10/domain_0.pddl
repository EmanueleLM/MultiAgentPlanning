(define (domain blocks-vowel-consonant)
  (:requirements :strips :typing :negative-preconditions)
  (:types surface block - surface)
  (:predicates
    (on ?b - block ?s - surface)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
  )

  ;; Vowel agent actions (can move only vowel blocks)

  ;; Vowel: move from a block to another block
  (:action vowel-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
                   (vowel ?b)
                   (on ?b ?from)
                   (clear ?b)
                   (clear ?to)
                   (not (= ?b ?to))
                   (not (= ?from ?to))
                  )
    :effect (and
             (not (on ?b ?from))
             (on ?b ?to)
             (clear ?from)
             (not (clear ?to))
            )
  )

  ;; Vowel: move from table to a block
  (:action vowel-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
                   (vowel ?b)
                   (on ?b table)
                   (clear ?b)
                   (clear ?to)
                   (not (= ?b ?to))
                  )
    :effect (and
             (not (on ?b table))
             (on ?b ?to)
             (not (clear ?to))
            )
  )

  ;; Vowel: move from a block to table
  (:action vowel-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
                   (vowel ?b)
                   (on ?b ?from)
                   (clear ?b)
                   (not (= ?b ?from))
                  )
    :effect (and
             (not (on ?b ?from))
             (on ?b table)
             (clear ?from)
            )
  )

  ;; Consonant agent actions (can move only consonant blocks)

  ;; Consonant: move from a block to another block
  (:action consonant-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
                   (consonant ?b)
                   (on ?b ?from)
                   (clear ?b)
                   (clear ?to)
                   (not (= ?b ?to))
                   (not (= ?from ?to))
                  )
    :effect (and
             (not (on ?b ?from))
             (on ?b ?to)
             (clear ?from)
             (not (clear ?to))
            )
  )

  ;; Consonant: move from table to a block
  (:action consonant-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
                   (consonant ?b)
                   (on ?b table)
                   (clear ?b)
                   (clear ?to)
                   (not (= ?b ?to))
                  )
    :effect (and
             (not (on ?b table))
             (on ?b ?to)
             (not (clear ?to))
            )
  )

  ;; Consonant: move from a block to table
  (:action consonant-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
                   (consonant ?b)
                   (on ?b ?from)
                   (clear ?b)
                   (not (= ?b ?from))
                  )
    :effect (and
             (not (on ?b ?from))
             (on ?b table)
             (clear ?from)
            )
  )

)