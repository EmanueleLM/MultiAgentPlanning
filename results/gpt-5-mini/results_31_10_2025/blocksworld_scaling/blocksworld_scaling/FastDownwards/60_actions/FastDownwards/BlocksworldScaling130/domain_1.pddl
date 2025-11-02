(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    table - place
    block - place
    vowel - block
    consonant - block
  )

  (:predicates
    (on ?b - block ?p - place)   ; block ?b is directly on place ?p (block or table)
    (clear ?b - block)           ; block ?b has nothing on top (is top of its stack)
  )

  ;; Vowel-agent actions (may move only vowels: a, e, i)

  ;; Move a vowel block that is on another block onto another block
  (:action move-vowel-block-to-block
    :parameters (?b - vowel ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  ;; Move a vowel block that is on a block to the table
  (:action move-vowel-block-to-table
    :parameters (?b - vowel ?from - block ?to - table)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
            )
  )

  ;; Move a vowel block that is on the table onto a block
  (:action move-vowel-table-to-block
    :parameters (?b - vowel ?from - table ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
            )
  )

  ;; Consonant-agent actions (may move only consonants: b,c,d,f,g,h,j,k,l)

  ;; Move a consonant block that is on another block onto another block
  (:action move-consonant-block-to-block
    :parameters (?b - consonant ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  ;; Move a consonant block that is on a block to the table
  (:action move-consonant-block-to-table
    :parameters (?b - consonant ?from - block ?to - table)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
            )
  )

  ;; Move a consonant block that is on the table onto a block
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