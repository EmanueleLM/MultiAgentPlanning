(define (domain BlocksworldScaling111)
  (:requirements :typing :strips :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (is-vowel ?x - block)
    (is-consonant ?x - block)
  )

  ;; Vowel agent actions
  (:action move-vowel-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (is-vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action move-vowel-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (is-vowel ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
              (not (ontable ?b))
              (on ?b ?to)
              (not (clear ?to))
            )
  )

  (:action move-vowel-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (is-vowel ?b) (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
            )
  )

  ;; Consonant agent actions
  (:action move-consonant-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (is-consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action move-consonant-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (is-consonant ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
              (not (ontable ?b))
              (on ?b ?to)
              (not (clear ?to))
            )
  )

  (:action move-consonant-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (is-consonant ?b) (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
            )
  )
)