(define (domain blocks_multi_agent)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (on ?b ?s - block)      ; ?b is directly on support ?s (a block)
    (ontable ?b - block)    ; ?b is directly on the table
    (clear ?b - block)      ; nothing on top of ?b
    (vowel ?b - block)      ; block is a vowel - can be moved by vowel-agent actions
    (consonant ?b - block)  ; block is a consonant - can be moved by consonant-agent actions
  )

  ;; Vowel-agent actions (distinct names)
  (:action vowel_move-block-to-block
    :parameters (?b ?from ?to - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  (:action vowel_move-from-table-to-block
    :parameters (?b ?to - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
              (not (ontable ?b))
              (on ?b ?to)
              (not (clear ?to))
            )
  )

  (:action vowel_move-block-to-table
    :parameters (?b ?from - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
            )
  )

  ;; Consonant-agent actions (distinct names)
  (:action consonant_move-block-to-block
    :parameters (?b ?from ?to - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  (:action consonant_move-table-to-block
    :parameters (?b ?to - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
              (not (ontable ?b))
              (on ?b ?to)
              (not (clear ?to))
            )
  )

  (:action consonant_move-block-to-table
    :parameters (?b ?from - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
            )
  )
)