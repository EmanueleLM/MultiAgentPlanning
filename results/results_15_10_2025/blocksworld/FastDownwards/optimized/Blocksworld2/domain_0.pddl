(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types place block vowel consonant - block)
  (:predicates
    (on ?b - block ?p - place)
    (clear ?b - block)
  )

  ;; Vowel agent actions (can move only A E I)
  (:action vowel-move-block-to-block
    :parameters (?b - vowel ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
              (not (clear ?b))
            )
  )

  (:action vowel-move-block-to-table
    :parameters (?b - vowel ?from - block)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (on ?b table)
              (clear ?from)
              (not (clear ?b))
            )
  )

  (:action vowel-move-table-to-block
    :parameters (?b - vowel ?to - block)
    :precondition (and (on ?b table) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b table))
              (on ?b ?to)
              (not (clear ?to))
              (not (clear ?b))
            )
  )

  ;; Consonant agent actions (can move only B C D F G H J)
  (:action consonant-move-block-to-block
    :parameters (?b - consonant ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
              (not (clear ?b))
            )
  )

  (:action consonant-move-block-to-table
    :parameters (?b - consonant ?from - block)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (on ?b table)
              (clear ?from)
              (not (clear ?b))
            )
  )

  (:action consonant-move-table-to-block
    :parameters (?b - consonant ?to - block)
    :precondition (and (on ?b table) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b table))
              (on ?b ?to)
              (not (clear ?to))
              (not (clear ?b))
            )
  )
)