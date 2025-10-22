(define (domain blocks-vowel-consonant)
  (:requirements :strips :typing :negative-preconditions)
  (:types place)

  (:predicates
    (on ?b - place ?p - place)
    (clear ?b - place)
    (vowel ?b - place)
    (consonant ?b - place)
  )

  (:action move-vowel-block-to-block
    :parameters (?b - place ?from - place ?to - place)
    :precondition (and
                    (vowel ?b)
                    (on ?b ?from)
                    (clear ?b)
                    (clear ?to)
                   )
    :effect (and
             (not (on ?b ?from))
             (on ?b ?to)
             (clear ?from)
             (not (clear ?to))
            )
  )

  (:action move-vowel-block-to-table
    :parameters (?b - place ?from - place)
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
    :parameters (?b - place ?to - place)
    :precondition (and
                    (vowel ?b)
                    (on ?b table)
                    (clear ?b)
                    (clear ?to)
                   )
    :effect (and
             (not (on ?b table))
             (on ?b ?to)
             (not (clear ?to))
            )
  )

  (:action move-consonant-block-to-block
    :parameters (?b - place ?from - place ?to - place)
    :precondition (and
                    (consonant ?b)
                    (on ?b ?from)
                    (clear ?b)
                    (clear ?to)
                   )
    :effect (and
             (not (on ?b ?from))
             (on ?b ?to)
             (clear ?from)
             (not (clear ?to))
            )
  )

  (:action move-consonant-block-to-table
    :parameters (?b - place ?from - place)
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
    :parameters (?b - place ?to - place)
    :precondition (and
                    (consonant ?b)
                    (on ?b table)
                    (clear ?b)
                    (clear ?to)
                   )
    :effect (and
             (not (on ?b table))
             (on ?b ?to)
             (not (clear ?to))
            )
  )
)