(define (domain blocks-multiagent)
  (:requirements :strips :typing)
  (:types place
          block - place
          table - place
          vowel - block
          consonant - block)

  (:predicates
    (on ?b - block ?p - place)    ; block ?b is directly on place ?p (block or table)
    (clear ?b - block)            ; block ?b has nothing on top (is top of its stack)
  )

  ;; Vowel-agent actions (may move only vowel blocks: a, e, i)
  (:action move-vowel-block-to-block
    :parameters (?b - vowel ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action move-vowel-block-to-table
    :parameters (?b - vowel ?from - block ?to - table)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
            )
  )

  (:action move-vowel-table-to-block
    :parameters (?b - vowel ?from - table ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
            )
  )

  ;; Consonant-agent actions (may move only consonant blocks: b,c,d,f,g,h,j,k,l)
  (:action move-consonant-block-to-block
    :parameters (?b - consonant ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action move-consonant-block-to-table
    :parameters (?b - consonant ?from - block ?to - table)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
            )
  )

  (:action move-consonant-table-to-block
    :parameters (?b - consonant ?from - table ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
            )
  )
)