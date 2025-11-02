(define (domain multi-agent-blocksworld)
  (:requirements :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)      ; ?x directly on ?y
    (ontable ?x - block)            ; ?x directly on the table
    (clear ?x - block)              ; nothing on ?x
    (vowel ?x - block)              ; block label is a vowel (A,E,I)
    (consonant ?x - block)          ; block label is a consonant
  )

  ;; Vowel agent actions (only moves A, E, I)
  (:action move-vowel-from-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
                    (vowel ?b)
                    (on ?b ?from)
                    (clear ?b)
                    (clear ?to)
                  )
    :effect (and
              ; remove old relation
              (not (on ?b ?from))
              ; place on new block
              (on ?b ?to)
              ; new top-of-stack changes
              (not (clear ?to))
              (clear ?b)
              ; the block below becomes clear
              (clear ?from)
            )
  )

  (:action move-vowel-from-table-to-block
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
              (clear ?b)
            )
  )

  (:action move-vowel-from-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
                    (vowel ?b)
                    (on ?b ?from)
                    (clear ?b)
                  )
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?b)
              (clear ?from)
            )
  )

  ;; Consonant agent actions (only moves consonants)
  (:action move-consonant-from-block-to-block
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
              (clear ?b)
              (clear ?from)
            )
  )

  (:action move-consonant-from-table-to-block
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
              (clear ?b)
            )
  )

  (:action move-consonant-from-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
                    (consonant ?b)
                    (on ?b ?from)
                    (clear ?b)
                  )
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?b)
              (clear ?from)
            )
  )
)