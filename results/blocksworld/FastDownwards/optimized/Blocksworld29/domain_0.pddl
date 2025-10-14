(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block)

  (:predicates
    (on ?x - block ?y - block)        ; block x is on block y
    (on-table ?x - block)             ; block x is directly on the table
    (clear ?x - block)                ; no block on top of x
    (vowel ?x - block)                ; block is a vowel block (A,E,I)
    (consonant ?x - block)            ; block is a consonant block (others)
    (is-vowel-agent ?a - agent)       ; identifies the vowel-moving agent
    (is-consonant-agent ?a - agent)   ; identifies the consonant-moving agent
  )

  ; Vowel agent actions (can move only vowel blocks A,E,I)

  (:action vowel-move-block-to-block
    :parameters (?ag - agent ?b - block ?from - block ?to - block)
    :precondition (and
                    (is-vowel-agent ?ag)
                    (vowel ?b)
                    (clear ?b)
                    (clear ?to)
                    (on ?b ?from)
                   )
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  (:action vowel-move-table-to-block
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and
                    (is-vowel-agent ?ag)
                    (vowel ?b)
                    (clear ?b)
                    (clear ?to)
                    (on-table ?b)
                   )
    :effect (and
              (not (on-table ?b))
              (on ?b ?to)
              (not (clear ?to))
            )
  )

  (:action vowel-move-block-to-table
    :parameters (?ag - agent ?b - block ?from - block)
    :precondition (and
                    (is-vowel-agent ?ag)
                    (vowel ?b)
                    (clear ?b)
                    (on ?b ?from)
                   )
    :effect (and
              (not (on ?b ?from))
              (on-table ?b)
              (clear ?from)
            )
  )

  ; Consonant agent actions (can move only consonant blocks B,C,D,F,G,H,J)

  (:action consonant-move-block-to-block
    :parameters (?ag - agent ?b - block ?from - block ?to - block)
    :precondition (and
                    (is-consonant-agent ?ag)
                    (consonant ?b)
                    (clear ?b)
                    (clear ?to)
                    (on ?b ?from)
                   )
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  (:action consonant-move-table-to-block
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and
                    (is-consonant-agent ?ag)
                    (consonant ?b)
                    (clear ?b)
                    (clear ?to)
                    (on-table ?b)
                   )
    :effect (and
              (not (on-table ?b))
              (on ?b ?to)
              (not (clear ?to))
            )
  )

  (:action consonant-move-block-to-table
    :parameters (?ag - agent ?b - block ?from - block)
    :precondition (and
                    (is-consonant-agent ?ag)
                    (consonant ?b)
                    (clear ?b)
                    (on ?b ?from)
                   )
    :effect (and
              (not (on ?b ?from))
              (on-table ?b)
              (clear ?from)
            )
  )

)