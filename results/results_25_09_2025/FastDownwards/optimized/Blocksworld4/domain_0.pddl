(define (domain multi-agent-blocks)
  (:requirements :strips :typing :equality)
  (:types block)

  (:predicates
    (vowel ?x - block)        ; blocks the vowel-agent may move
    (consonant ?x - block)    ; blocks the consonant-agent may move
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
  )

  ;; Vowel-agent actions (preserve vowel-only constraint and original semantics)
  (:action vowel_move-table-to-block
    :parameters (?x - block ?y - block)
    :precondition (and
      (vowel ?x)
      (ontable ?x)
      (clear ?x)
      (clear ?y)
      (not (= ?x ?y))
    )
    :effect (and
      (not (ontable ?x))
      (not (clear ?y))
      (on ?x ?y)
      (clear ?x)
    )
  )

  (:action vowel_move-block-to-block
    :parameters (?x - block ?z - block ?y - block)
    :precondition (and
      (vowel ?x)
      (on ?x ?z)
      (clear ?x)
      (clear ?y)
      (not (= ?x ?y))
    )
    :effect (and
      (not (on ?x ?z))
      (clear ?z)
      (not (clear ?y))
      (on ?x ?y)
      (clear ?x)
    )
  )

  (:action vowel_move-block-to-table
    :parameters (?x - block ?z - block)
    :precondition (and
      (vowel ?x)
      (on ?x ?z)
      (clear ?x)
    )
    :effect (and
      (not (on ?x ?z))
      (clear ?z)
      (ontable ?x)
      (clear ?x)
    )
  )

  ;; Consonant-agent actions (preserve consonant-only constraint and original semantics)
  (:action cons_move-block-to-block
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
      (not (ontable ?b))
    )
  )

  (:action cons_move-from-table-to-block
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
    )
  )

  (:action cons_move-block-to-table
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