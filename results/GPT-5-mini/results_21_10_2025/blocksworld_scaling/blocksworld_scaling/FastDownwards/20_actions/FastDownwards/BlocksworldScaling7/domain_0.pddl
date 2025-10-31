(define (domain multiagent-blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block place - object)  ; blocks and places are subtypes of object (loc concept)
  (:predicates
    (on ?b - block ?l - object)        ; block ?b is directly on loc ?l (block or place)
    (clear ?l - object)                ; loc ?l currently has nothing on top (is available)
    (vowel ?b - block)
    (consonant ?b - block)
    (fixed ?l - object)                ; loc (block or place) is fixed in its final position
  )

  ;; Vowel agent actions
  ;; Move a vowel block from any loc to an empty table-place (place object)
  (:action move-vowel-to-place
    :parameters (?b - block ?from - object ?to - place)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Move a vowel block onto another block, allowed only if the target block is fixed
  (:action move-vowel-onto-block
    :parameters (?b - block ?from - object ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (fixed ?to)           ; strict constraint: vowels may only be placed onto consonants/blocks that are fixed
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Consonant agent actions
  ;; Move a consonant block from any loc to an empty table-place (place object)
  (:action move-consonant-to-place
    :parameters (?b - block ?from - object ?to - place)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Move a consonant block onto another block (no extra constraint)
  (:action move-consonant-onto-block
    :parameters (?b - block ?from - object ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Action to declare a consonant (or the special base-place) fixed once it is correctly placed
  ;; This allows vowels to be placed on top of that block/place thereafter (modeling the vowel-agent constraint)
  (:action fix
    :parameters (?b - block ?below - object)
    :precondition (and
      (consonant ?b)
      (on ?b ?below)
      (clear ?b)
      (fixed ?below)    ; only fix ?b when the thing below it is already fixed (Sg is initially fixed)
    )
    :effect (and
      (fixed ?b)
    )
  )
)