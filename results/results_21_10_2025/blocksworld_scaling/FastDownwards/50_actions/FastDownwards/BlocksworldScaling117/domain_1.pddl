(define (domain blocks-two-agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)        ; ?x is directly on block ?y
    (on-table ?x - block)             ; ?x is directly on the table
    (clear ?x - block)                ; nothing on ?x
    (vowel-block ?x - block)          ; can be moved only by vowel agent
    (consonant-block ?x - block)      ; can be moved only by consonant agent
  )

  ;; Vowel-agent actions (move only vowel-labeled blocks: a, e, i)
  (:action vowel-move-block-to-block
    :parameters (?b - block ?s - block ?d - block)
    :precondition (and
                    (vowel-block ?b)
                    (clear ?b)           ; b must be top of its stack
                    (clear ?d)           ; destination must be top (clear)
                    (on ?b ?s)           ; b is on some block s
                  )
    :effect (and
              (not (on ?b ?s))
              (on ?b ?d)
              (clear ?s)           ; source becomes clear after removing ?b
              (not (clear ?d))     ; destination no longer clear
            )
  )

  (:action vowel-move-table-to-block
    :parameters (?b - block ?d - block)
    :precondition (and
                    (vowel-block ?b)
                    (clear ?b)
                    (clear ?d)
                    (on-table ?b)        ; b is currently on the table
                  )
    :effect (and
              (not (on-table ?b))
              (on ?b ?d)
              (not (clear ?d))
            )
  )

  (:action vowel-move-block-to-table
    :parameters (?b - block ?s - block)
    :precondition (and
                    (vowel-block ?b)
                    (clear ?b)
                    (on ?b ?s)
                  )
    :effect (and
              (not (on ?b ?s))
              (on-table ?b)
              (clear ?s)
            )
  )

  ;; Consonant-agent actions (move only consonant-labeled blocks: b, c, d, f, g, h, j)
  (:action consonant-move-block-to-block
    :parameters (?b - block ?s - block ?d - block)
    :precondition (and
                    (consonant-block ?b)
                    (clear ?b)
                    (clear ?d)
                    (on ?b ?s)
                  )
    :effect (and
              (not (on ?b ?s))
              (on ?b ?d)
              (clear ?s)
              (not (clear ?d))
            )
  )

  (:action consonant-move-table-to-block
    :parameters (?b - block ?d - block)
    :precondition (and
                    (consonant-block ?b)
                    (clear ?b)
                    (clear ?d)
                    (on-table ?b)
                  )
    :effect (and
              (not (on-table ?b))
              (on ?b ?d)
              (not (clear ?d))
            )
  )

  (:action consonant-move-block-to-table
    :parameters (?b - block ?s - block)
    :precondition (and
                    (consonant-block ?b)
                    (clear ?b)
                    (on ?b ?s)
                  )
    :effect (and
              (not (on ?b ?s))
              (on-table ?b)
              (clear ?s)
            )
  )

)