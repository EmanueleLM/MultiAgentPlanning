(define (domain multi_agent_blocks)
  (:requirements :strips :typing :equality)
  (:types block)

  (:predicates
    ;; block relations
    (on ?b - block ?p - block)    ; ?b is directly on block ?p
    (ontable ?b - block)          ; ?b is directly on the table
    (clear ?b - block)            ; nothing on top of ?b
    ;; agent capabilities
    (vowel ?b - block)            ; vowel-agent can move ?b
    (consonant ?b - block)        ; consonant-agent can move ?b
  )

  ;; VOWEL AGENT ACTIONS (owned by vowel agent)
  (:action vowel-move-block-to-block
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
              (on ?b ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  (:action vowel-move-table-to-block
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
              (on ?b ?to)
              (not (clear ?to))
            )
  )

  (:action vowel-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
                    (vowel ?b)
                    (on ?b ?from)
                    (clear ?b)
                  )
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
            )
  )

  ;; CONSONANT AGENT ACTIONS (owned by consonant agent)
  (:action consonant-move-block-to-block
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
              (on ?b ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  (:action consonant-move-table-to-block
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
              (on ?b ?to)
              (not (clear ?to))
            )
  )

  (:action consonant-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
                    (consonant ?b)
                    (on ?b ?from)
                    (clear ?b)
                  )
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
            )
  )
)