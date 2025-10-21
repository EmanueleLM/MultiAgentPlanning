(define (domain blocks-multiagent)
  (:requirements :strips :typing)
  (:types block table)
  (:predicates
    (on ?b - block ?p - block)        ;; block ?b is on block ?p
    (ontable ?b - block)             ;; block ?b is on the table
    (clear ?b - block)               ;; nothing on top of block ?b
    (is-vowel ?b - block)            ;; block ?b may be moved by the vowel agent
    (is-consonant ?b - block)        ;; block ?b may be moved by the consonant agent
  )

  ;; Vowel agent actions: may move only blocks marked is-vowel

  ;; Move from table onto a block
  (:action vowel-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
                    (ontable ?b)
                    (clear ?b)
                    (clear ?to)
                    (is-vowel ?b)
                  )
    :effect (and
              (not (ontable ?b))
              (not (clear ?to))
              (on ?b ?to)
              (clear ?b)
            )
  )

  ;; Move from one block onto another block
  (:action vowel-move-from-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
                    (on ?b ?from)
                    (clear ?b)
                    (clear ?to)
                    (is-vowel ?b)
                  )
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?b)
              (not (clear ?to))
              (clear ?from)
            )
  )

  ;; Move from a block onto the table
  (:action vowel-move-from-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
                    (on ?b ?from)
                    (clear ?b)
                    (is-vowel ?b)
                  )
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?b)
              (clear ?from)
            )
  )

  ;; Consonant agent actions: may move only blocks marked is-consonant

  ;; Move from table onto a block
  (:action cons-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
                    (ontable ?b)
                    (clear ?b)
                    (clear ?to)
                    (is-consonant ?b)
                  )
    :effect (and
              (not (ontable ?b))
              (not (clear ?to))
              (on ?b ?to)
              (clear ?b)
            )
  )

  ;; Move from one block onto another block
  (:action cons-move-from-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
                    (on ?b ?from)
                    (clear ?b)
                    (clear ?to)
                    (is-consonant ?b)
                  )
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?b)
              (not (clear ?to))
              (clear ?from)
            )
  )

  ;; Move from a block onto the table
  (:action cons-move-from-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
                    (on ?b ?from)
                    (clear ?b)
                    (is-consonant ?b)
                  )
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?b)
              (clear ?from)
            )
  )

)