(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block place)

  (:predicates
    ; block ?b is directly on block ?x
    (on ?b - block ?x - block)
    ; block ?b is directly on a place ?p (a table stack)
    (onplace ?b - block ?p - place)
    ; top of a block or a place is free
    (clear ?o - (either block place))
    ; capability predicates
    (vowel ?b - block)
    (consonant ?b - block)
  )

  ;; Vowel-agent actions: move a vowel block that is on another block onto another block
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

  ;; Vowel: move a vowel block that is on a place onto a block
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

  ;; Vowel: move a vowel block that is on a block onto a place
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

  ;; Vowel: move a vowel block that is on a place onto another place
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

  ;; Consonant-agent actions: move consonant block from block to block
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

  ;; Consonant: move consonant block from place to block
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

  ;; Consonant: move consonant block from block to place
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

  ;; Consonant: move consonant block from place to place
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