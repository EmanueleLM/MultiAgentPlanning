(define (domain blocksworld-vowel-consonant)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)    ; block ?x is on block ?y
    (ontable ?x - block)          ; block ?x is on the table
    (clear ?x - block)            ; no block on top of ?x
    (vowel ?x - block)
    (consonant ?x - block)
  )

  ;; Vowel agent actions
  (:action vowel-move-block-to-block
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and (vowel ?x) (on ?x ?from) (clear ?x) (clear ?to))
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?x)
    )
  )

  (:action vowel-move-table-to-block
    :parameters (?x - block ?to - block)
    :precondition (and (vowel ?x) (ontable ?x) (clear ?to))
    :effect (and
      (not (ontable ?x))
      (on ?x ?to)
      (not (clear ?to))
      (clear ?x)
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?x - block ?from - block)
    :precondition (and (vowel ?x) (on ?x ?from) (clear ?x))
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
      (clear ?x)
    )
  )

  ;; Consonant agent actions
  (:action consonant-move-block-to-block
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and (consonant ?x) (on ?x ?from) (clear ?x) (clear ?to))
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?x)
    )
  )

  (:action consonant-move-table-to-block
    :parameters (?x - block ?to - block)
    :precondition (and (consonant ?x) (ontable ?x) (clear ?to))
    :effect (and
      (not (ontable ?x))
      (on ?x ?to)
      (not (clear ?to))
      (clear ?x)
    )
  )

  (:action consonant-move-block-to-table
    :parameters (?x - block ?from - block)
    :precondition (and (consonant ?x) (on ?x ?from) (clear ?x))
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
      (clear ?x)
    )
  )
)