(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types support place block)
  (:predicates
    (on ?b - block ?s - support)        ; block ?b is directly on support ?s (block or place)
    (top ?s - support)                 ; support ?s has nothing on it (is clear / is the current top)
    (vowel ?b - block)                 ; block is vowel-labelled (movable by vowel_agent)
    (consonant ?b - block)             ; block is consonant-labelled (movable by consonant_agent)
    (immobile ?b - block)              ; block is not to be moved (hard constraint)
  )

  ; Vowel-agent move: moves a vowel block that is currently top of its stack,
  ; placing it onto a destination support that is currently top. This action
  ; may not move blocks marked immobile.
  (:action move-vowel
    :parameters (?b - block ?below - support ?dest - support)
    :precondition (and
      (vowel ?b)
      (on ?b ?below)
      (top ?b)
      (top ?dest)
      (not (immobile ?b))
    )
    :effect (and
      (not (on ?b ?below))
      (on ?b ?dest)
      (top ?below)         ; the previous support becomes top after removing ?b
      (not (top ?dest))    ; destination is no longer top because ?b sits on it
      (top ?b)             ; moved block is now top at its new location
    )
  )

  ; Consonant-agent move: analogous to vowel move but restricted to consonants.
  (:action move-consonant
    :parameters (?b - block ?below - support ?dest - support)
    :precondition (and
      (consonant ?b)
      (on ?b ?below)
      (top ?b)
      (top ?dest)
      (not (immobile ?b))
    )
    :effect (and
      (not (on ?b ?below))
      (on ?b ?dest)
      (top ?below)
      (not (top ?dest))
      (top ?b)
    )
  )
)