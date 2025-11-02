(define (domain BlocksworldScaling73)
  (:requirements :strips)
  (:predicates
    (on ?b ?x)        ; block ?b is directly on ?x (another block or the special object table)
    (clear ?b)        ; block ?b has nothing on top
    (vowel ?b)        ; ?b is a vowel block (A E I O)
    (consonant ?b)    ; ?b is a consonant block (all other blocks)
  )

  ;; Vowel agent: move a vowel block onto another block
  (:action move-vowel-to-block
    :parameters (?b ?from ?to)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
    )
  )

  ;; Vowel agent: move a vowel block to the table
  (:action move-vowel-to-table
    :parameters (?b ?from)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
      (clear ?b)
    )
  )

  ;; Consonant agent: move a consonant block onto another block
  (:action move-consonant-to-block
    :parameters (?b ?from ?to)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
    )
  )

  ;; Consonant agent: move a consonant block to the table
  (:action move-consonant-to-table
    :parameters (?b ?from)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
      (clear ?b)
    )
  )
)