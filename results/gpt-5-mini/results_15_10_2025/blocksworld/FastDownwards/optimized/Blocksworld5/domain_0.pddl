(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block)

  (:predicates
    (on ?x - block ?y - block)        ; block x is on block y
    (ontable ?x - block)              ; block x is on the table
    (clear ?x - block)                ; nothing on top of x
    (vowel ?x - block)                ; x is a vowel-labeled block (vowel_agent may move)
    (consonant ?x - block)            ; x is a consonant-labeled block (consonant_agent may move)
  )

  ; Vowel-agent actions (vowel_agent can move only A, E, I)
  (:action vowel-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (vowel ?b)
      (not (= ?b ?to))
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?b)              ; b remains clear as it is top after move
      (clear ?from)           ; from becomes clear (had b on top)
      (not (clear ?to))       ; to is no longer clear
    )
  )

  (:action vowel-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (clear ?to)
      (vowel ?b)
      (not (= ?b ?to))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (clear ?b)
      (not (clear ?to))
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (vowel ?b)
      (not (= ?b ?from))
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?b)
      (clear ?from)
    )
  )

  ; Consonant-agent actions (consonant_agent can move only consonant-labeled blocks)
  (:action consonant-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (consonant ?b)
      (not (= ?b ?to))
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?b)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action consonant-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (clear ?to)
      (consonant ?b)
      (not (= ?b ?to))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (clear ?b)
      (not (clear ?to))
    )
  )

  (:action consonant-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (consonant ?b)
      (not (= ?b ?from))
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?b)
      (clear ?from)
    )
  )
)