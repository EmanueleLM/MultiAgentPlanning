(define (domain multiagent-blocks)
  (:requirements :strips :typing)
  (:types
    vowel consonant - block
    block
  )
  (:predicates
    (on ?x - block ?y - block)    ; ?x is directly on ?y
    (on-table ?x - block)         ; ?x is directly on the table
    (clear ?x - block)            ; nothing on top of ?x
  )

  ;; Vowel-agent actions (can move only vowel-typed blocks)
  (:action vowel-move-block-to-block
    :parameters (?x - vowel ?from - block ?to - block)
    :precondition (and
                    (on ?x ?from)
                    (clear ?x)
                    (clear ?to)
                  )
    :effect (and
              (not (on ?x ?from))
              (on ?x ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  (:action vowel-move-block-to-table
    :parameters (?x - vowel ?from - block)
    :precondition (and
                    (on ?x ?from)
                    (clear ?x)
                  )
    :effect (and
              (not (on ?x ?from))
              (on-table ?x)
              (clear ?from)
            )
  )

  (:action vowel-move-table-to-block
    :parameters (?x - vowel ?to - block)
    :precondition (and
                    (on-table ?x)
                    (clear ?x)
                    (clear ?to)
                  )
    :effect (and
              (not (on-table ?x))
              (on ?x ?to)
              (not (clear ?to))
            )
  )

  ;; Consonant-agent actions (can move only consonant-typed blocks)
  (:action cons-move-block-to-block
    :parameters (?b - consonant ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action cons-move-from-table-to-block
    :parameters (?b - consonant ?to - block)
    :precondition (and
      (on-table ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on-table ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action cons-move-block-to-table
    :parameters (?b - consonant ?from - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on-table ?b)
      (clear ?from)
    )
  )
)