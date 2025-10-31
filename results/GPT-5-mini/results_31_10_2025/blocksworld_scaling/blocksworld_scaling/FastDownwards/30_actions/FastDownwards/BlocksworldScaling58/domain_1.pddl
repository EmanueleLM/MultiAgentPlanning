(define (domain blocks-vowel-consonant)
  (:requirements :strips :typing :negative-preconditions)
  (:types place block - place)

  (:predicates
    (on ?b - block ?p - place)    ; block ?b is directly on place ?p (block or table)
    (clear ?b - block)            ; no block on top of ?b
    (vowel ?b - block)            ; ?b is a vowel block (movable by vowel agent)
    (consonant ?b - block)        ; ?b is a consonant block (movable by consonant agent)
  )

  ;; Vowel agent actions
  (:action move-vowel-block-to-block
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
             (clear ?from)
             (not (clear ?to))
            )
  )

  (:action move-vowel-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
                    (vowel ?b)
                    (on ?b ?from)
                    (clear ?b)
                   )
    :effect (and
             (not (on ?b ?from))
             (on ?b table)
             (clear ?from)
            )
  )

  (:action move-vowel-table-to-block
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

  ;; Consonant agent actions
  (:action move-consonant-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
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
            )
  )

  (:action move-consonant-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
                    (consonant ?b)
                    (on ?b ?from)
                    (clear ?b)
                   )
    :effect (and
             (not (on ?b ?from))
             (on ?b table)
             (clear ?from)
            )
  )

  (:action move-consonant-table-to-block
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
)