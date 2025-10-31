(define (domain multiagent_blocks)
  (:requirements :strips)
  (:predicates
    (on ?x ?y)        ; ?x is on top of block ?y
    (ontable ?x)      ; ?x is on the table
    (clear ?x)        ; nothing on ?x
    (vowel ?x)        ; ?x is a vowel block (moved by vowel_agent)
    (consonant ?x)    ; ?x is a consonant block (moved by consonant_agent)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions belonging to the vowel_agent (may move only vowel blocks)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:action vowel-move-block-to-block
    :parameters (?v ?from ?to)
    :precondition (and
      (vowel ?v)
      (on ?v ?from)
      (clear ?v)
      (clear ?to)
    )
    :effect (and
      (not (on ?v ?from))
      (on ?v ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?v)
    )
  )

  (:action vowel-move-table-to-block
    :parameters (?v ?to)
    :precondition (and
      (vowel ?v)
      (ontable ?v)
      (clear ?v)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?v))
      (on ?v ?to)
      (not (clear ?to))
      (clear ?v)
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?v ?from)
    :precondition (and
      (vowel ?v)
      (on ?v ?from)
      (clear ?v)
    )
    :effect (and
      (not (on ?v ?from))
      (ontable ?v)
      (clear ?from)
      (clear ?v)
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions belonging to the consonant_agent (may move only consonant blocks)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:action consonant-move-block-to-block
    :parameters (?b ?from ?to)
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
      (clear ?b)
    )
  )

  (:action consonant-move-block-to-table
    :parameters (?b ?from)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )

  (:action consonant-move-table-to-block
    :parameters (?b ?to)
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

)