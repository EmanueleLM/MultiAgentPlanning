(define (domain combined_blocks_agents)
  (:requirements :strips :negative-preconditions :equality)
  (:predicates
    (on ?x ?y)        ; ?x (block) is directly on ?y (block or table)
    (clear ?x)        ; nothing on ?x (top of a stack); table can be clear
    (vowel ?x)        ; ?x is a vowel block (moved by vowel_agent)
    (consonant ?x)    ; ?x is a consonant block (moved by consonant_agent)
  )

  ;; Vowel agent actions (kept distinct)
  (:action vowel-move-to-block
    :parameters (?b ?from ?to)
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

  (:action vowel-move-to-table
    :parameters (?b ?from)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (not (= ?from table))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
      ; table remains clear (we treat table as always available)
    )
  )

  ;; Consonant agent actions (kept distinct)
  (:action consonant-move-block-to-block
    :parameters (?x ?from ?to)
    :precondition (and
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (not (= ?x ?to))
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action consonant-move-table-to-block
    :parameters (?x ?to)
    :precondition (and
      (consonant ?x)
      (on ?x table)
      (clear ?x)
      (clear ?to)
      (not (= ?x ?to))
    )
    :effect (and
      (not (on ?x table))
      (on ?x ?to)
      (not (clear ?to))
    )
  )

  (:action consonant-move-block-to-table
    :parameters (?x ?from)
    :precondition (and
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x table)
      (clear ?from)
    )
  )
)