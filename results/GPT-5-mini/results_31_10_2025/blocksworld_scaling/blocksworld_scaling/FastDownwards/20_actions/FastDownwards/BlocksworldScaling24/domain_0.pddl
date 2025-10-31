(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?b - block ?x - block)      ; block ?b directly on block ?x
    (ontable ?b - block)            ; block ?b directly on the table
    (clear ?b - block)              ; nothing on ?b (top-of-stack)
    (vowel ?b - block)              ; block label is a vowel (can be moved by vowel-agent)
    (consonant ?b - block)          ; block label is a consonant (can be moved by consonant-agent)
  )

  ;; Vowel-only agent actions
  (:action vowel-move-from-block-to-block
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

  (:action vowel-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
                    (vowel ?b)
                    (ontable ?b)
                    (clear ?to)
                    (not (= ?b ?to))
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

  ;; Consonant-only agent actions
  (:action consonant-move-from-block-to-block
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

  (:action consonant-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
                    (consonant ?b)
                    (ontable ?b)
                    (clear ?to)
                    (not (= ?b ?to))
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