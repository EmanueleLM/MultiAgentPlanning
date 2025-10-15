(define (domain vowel-consonant-blocks)
  (:requirements :typing)
  (:types agent block loc vowel-block cons-block)
  (:predicates
    (on ?b - block ?l - loc)    ; block ?b is directly on location ?l (block or table)
    (clear ?l - loc)            ; location ?l has no block on top of it
  )

  ;; Vowel-agent actions: may only move vowel blocks (A, E, I)
  (:action vowel-move-to-block
    :parameters (?ag - agent ?b - vowel-block ?from - loc ?to - block)
    :precondition (and
                    (on ?b ?from)
                    (clear ?b)         ; ?b must be the top of its stack
                    (clear ?to)        ; target block must be clear (top)
                  )
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))  ; ?to now has ?b on top
              (clear ?from)      ; former support becomes clear
            )
  )

  (:action vowel-move-to-table
    :parameters (?ag - agent ?b - vowel-block ?from - loc)
    :precondition (and
                    (on ?b ?from)
                    (clear ?b)
                  )
    :effect (and
              (not (on ?b ?from))
              (on ?b table)
              (clear ?from)
            )
  )

  ;; Consonant-agent actions: may only move consonant blocks (M H G B L D F C K J)
  (:action cons-move-to-block
    :parameters (?ag - agent ?b - cons-block ?from - loc ?to - block)
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

  (:action cons-move-to-table
    :parameters (?ag - agent ?b - cons-block ?from - loc)
    :precondition (and
                    (on ?b ?from)
                    (clear ?b)
                  )
    :effect (and
              (not (on ?b ?from))
              (on ?b table)
              (clear ?from)
            )
  )
)