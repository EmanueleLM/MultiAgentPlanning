(define (domain multiagent-blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block place - object)

  (:predicates
    ;; a block is directly on an object (either a block or a place)
    (on ?b - block ?loc - object)
    ;; an object (block or place) has nothing directly on it
    (clear ?o - object)
    ;; agent-type predicates
    (vowel ?b - block)
    (consonant ?b - block)
  )

  ;; Vowel agent: move a vowel block from any object (block or place) to an empty table-place
  (:action move-vowel-to-place
    :parameters (?b - block ?from - object ?to - place)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Vowel agent: move a vowel block onto another block
  (:action move-vowel-onto-block
    :parameters (?b - block ?from - object ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Consonant agent: move a consonant block from any object (block or place) to an empty table-place
  (:action move-consonant-to-place
    :parameters (?b - block ?from - object ?to - place)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Consonant agent: move a consonant block onto another block
  (:action move-consonant-onto-block
    :parameters (?b - block ?from - object ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)