(define (domain blocks-multiagent-domain)
  (:requirements :strips :typing :equality)
  (:types block)

  (:predicates
    (on ?b - block ?x - block)    ; block ?b is on block ?x
    (ontable ?b - block)          ; block ?b is on the table
    (clear ?b - block)            ; block ?b has nothing on top
    (vowel ?b - block)            ; block ?b can be moved by the vowel agent
    (consonant ?b - block)        ; block ?b can be moved by the consonant agent
  )

  ;; Vowel-agent actions (labelled with vowel-...)
  (:action vowel-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
              (not (ontable ?b))
              (on ?b ?to)
              (not (clear ?to))
              ;; ?b remains clear/top after moving (no explicit change unless something placed on it)
            )
  )

  (:action vowel-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  (:action vowel-move-from-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
            )
  )

  ;; Consonant-agent actions (labelled with consonant-...)
  (:action consonant-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (consonant ?b) (clear ?b) (on ?b ?from) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  (:action consonant-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (consonant ?b) (clear ?b) (ontable ?b) (clear ?to))
    :effect (and
              (not (ontable ?b))
              (on ?b ?to)
              (not (clear ?to))
            )
  )

  (:action consonant-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (consonant ?b) (clear ?b) (on ?b ?from))
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
            )
  )
)