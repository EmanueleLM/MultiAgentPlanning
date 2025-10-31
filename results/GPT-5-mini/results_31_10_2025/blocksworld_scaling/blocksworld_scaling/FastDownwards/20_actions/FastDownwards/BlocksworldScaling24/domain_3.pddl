(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?b - block ?x - block)    ; ?b directly on ?x
    (ontable ?b - block)          ; ?b directly on the table
    (clear ?b - block)            ; nothing on ?b (top)
    (vowel ?b - block)            ; block is vowel (A,E,I,O)
    (consonant ?b - block)        ; block is consonant (others)
  )

  ;; Vowel-only actions
  (:action vowel-move-from-block-to-block
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
              (clear ?from)
              (not (clear ?to))
            )
  )

  (:action vowel-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
                    (vowel ?b)
                    (ontable ?b)
                    (clear ?to)
                  )
    :effect (and
              (not (ontable ?b))
              (on ?b ?to)
              (not (clear ?to))
            )
  )

  (:action vowel-move-from-block-to-table
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

  ;; Consonant-only actions
  (:action consonant-move-from-block-to-block
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
              (clear ?from)
              (not (clear ?to))
            )
  )

  (:action consonant-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
                    (consonant ?b)
                    (ontable ?b)
                    (clear ?to)
                  )
    :effect (and
              (not (ontable ?b))
              (on ?b ?to)
              (not (clear ?to))
            )
  )

  (:action consonant-move-from-block-to-table
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