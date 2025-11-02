(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block place)

  (:predicates
    (on ?b - block ?x - block)               ; block ?b is on block ?x
    (onplace ?b - block ?p - place)         ; block ?b is directly on place ?p (a table-stack position)
    (clear ?o - (either block place))       ; top of ?o (block or place) is free (no block on it)
    (vowel ?b - block)                      ; block label is a vowel (can be moved by vowel agent)
    (consonant ?b - block)                  ; block label is a consonant (can be moved by consonant agent)
  )

  ;; Vowel-agent actions: these actions can only move blocks marked (vowel ?b)
  (:action vowel-move-block-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  (:action vowel-move-place-block
    :parameters (?b - block ?pfrom - place ?to - block)
    :precondition (and (vowel ?b) (onplace ?b ?pfrom) (clear ?b) (clear ?to))
    :effect (and
              (not (onplace ?b ?pfrom))
              (on ?b ?to)
              (clear ?pfrom)
              (not (clear ?to))
            )
  )

  (:action vowel-move-block-place
    :parameters (?b - block ?from - block ?pto - place)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?pto))
    :effect (and
              (not (on ?b ?from))
              (onplace ?b ?pto)
              (clear ?from)
              (not (clear ?pto))
            )
  )

  (:action vowel-move-place-place
    :parameters (?b - block ?pfrom - place ?pto - place)
    :precondition (and (vowel ?b) (onplace ?b ?pfrom) (clear ?b) (clear ?pto))
    :effect (and
              (not (onplace ?b ?pfrom))
              (onplace ?b ?pto)
              (clear ?pfrom)
              (not (clear ?pto))
            )
  )

  ;; Consonant-agent actions: these actions can only move blocks marked (consonant ?b)
  (:action consonant-move-block-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  (:action consonant-move-place-block
    :parameters (?b - block ?pfrom - place ?to - block)
    :precondition (and (consonant ?b) (onplace ?b ?pfrom) (clear ?b) (clear ?to))
    :effect (and
              (not (onplace ?b ?pfrom))
              (on ?b ?to)
              (clear ?pfrom)
              (not (clear ?to))
            )
  )

  (:action consonant-move-block-place
    :parameters (?b - block ?from - block ?pto - place)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?pto))
    :effect (and
              (not (on ?b ?from))
              (onplace ?b ?pto)
              (clear ?from)
              (not (clear ?pto))
            )
  )

  (:action consonant-move-place-place
    :parameters (?b - block ?pfrom - place ?pto - place)
    :precondition (and (consonant ?b) (onplace ?b ?pfrom) (clear ?b) (clear ?pto))
    :effect (and
              (not (onplace ?b ?pfrom))
              (onplace ?b ?pto)
              (clear ?pfrom)
              (not (clear ?pto))
            )
  )
)