(define (domain multi-agent-blocks)
  (:requirements :strips :typing :equality)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)    ;; block on block
    (ontable ?x - block)          ;; block on the table
    (clear ?x - block)            ;; top of a stack / nothing on it
    (vowel ?x - block)            ;; movable by vowel-agent
    (consonant ?x - block)        ;; movable by consonant-agent
  )

  ;; Vowel-agent actions (kept distinct with prefix vowel-)
  ;; Move a vowel block from the table onto another (clear) block
  (:action vowel-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?to))
      (on ?b ?to)
      (clear ?b)
    )
  )

  ;; Move a vowel block from one block onto another block
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
      (clear ?from)
      (not (clear ?to))
      (on ?b ?to)
      (clear ?b)
    )
  )

  ;; Move a vowel block from on top of a block to the table
  (:action vowel-move-from-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (not (= ?b ?from))
    )
    :effect (and
      (not (on ?b ?from))
      (clear ?from)
      (ontable ?b)
      (clear ?b)
    )
  )

  ;; Consonant-agent actions (kept distinct with prefix consonant-)
  ;; Move a consonant block from the table onto another (clear) block
  (:action consonant-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?to))
      (on ?b ?to)
      (clear ?b)
    )
  )

  ;; Move a consonant block from one block onto another block
  (:action consonant-move-to-block
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
      (clear ?from)
      (not (clear ?to))
      (on ?b ?to)
      (clear ?b)
    )
  )

  ;; Move a consonant block from a block to the table
  (:action consonant-move-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (not (= ?b ?from))
    )
    :effect (and
      (not (on ?b ?from))
      (clear ?from)
      (ontable ?b)
      (clear ?b)
    )
  )
)