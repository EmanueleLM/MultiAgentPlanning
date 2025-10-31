(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    support
    table - support
    block - support
    vowel - block
    consonant - block
  )

  (:predicates
    (on ?b - block ?s - support)                ; b is immediately on support s (a block or the table)
    (clear ?b - block)                          ; b has nothing on top (top of its stack)
    (holding-vowel ?b - vowel)                  ; vowel agent is holding b
    (holding-consonant ?b - consonant)          ; consonant agent is holding b
    (handempty-vowel)                           ; vowel agent's hand is empty
    (handempty-consonant)                       ; consonant agent's hand is empty
    (isvowel ?b - block)                        ; helper unary predicate (true for vowels)
    (isconsonant ?b - block)                    ; helper unary predicate (true for consonants)
  )

  ;; Vowel agent actions
  (:action pick-vowel-from-block
    :parameters (?b - vowel ?s - block)
    :precondition (and (on ?b ?s) (clear ?b) (handempty-vowel))
    :effect (and
      (holding-vowel ?b)
      (not (handempty-vowel))
      (not (on ?b ?s))
      (clear ?s)        ; the block below becomes clear
      (clear ?b)        ; vowel_agent models held vowel as remaining clear
    )
  )

  (:action pick-vowel-from-table
    :parameters (?b - vowel)
    :precondition (and (on ?b table) (clear ?b) (handempty-vowel))
    :effect (and
      (holding-vowel ?b)
      (not (handempty-vowel))
      (not (on ?b table))
      (clear ?b)
    )
  )

  (:action place-vowel-on-table
    :parameters (?b - vowel)
    :precondition (and (holding-vowel ?b))
    :effect (and
      (on ?b table)
      (clear ?b)
      (not (holding-vowel ?b))
      (handempty-vowel)
    )
  )

  (:action place-vowel-on-block
    :parameters (?b - vowel ?t - block)
    :precondition (and (holding-vowel ?b) (clear ?t) (not (= ?b ?t)))
    :effect (and
      (on ?b ?t)
      (not (clear ?t))
      (clear ?b)
      (not (holding-vowel ?b))
      (handempty-vowel)
    )
  )

  ;; Consonant agent actions
  (:action pick-consonant-from-block
    :parameters (?b - consonant ?s - block)
    :precondition (and (on ?b ?s) (clear ?b) (handempty-consonant))
    :effect (and
      (holding-consonant ?b)
      (not (handempty-consonant))
      (not (on ?b ?s))
      (clear ?s)           ; block below becomes clear
      (not (clear ?b))     ; consonant_agent models held consonant as NOT clear
    )
  )

  (:action pick-consonant-from-table
    :parameters (?b - consonant)
    :precondition (and (on ?b table) (clear ?b) (handempty-consonant))
    :effect (and
      (holding-consonant ?b)
      (not (handempty-consonant))
      (not (on ?b table))
      (not (clear ?b))
    )
  )

  (:action place-consonant-on-table
    :parameters (?b - consonant)
    :precondition (and (holding-consonant ?b))
    :effect (and
      (on ?b table)
      (clear ?b)
      (not (holding-consonant ?b))
      (handempty-consonant)
    )
  )

  ;; consonant agent restricted to placing on consonant targets (assumption preserved)
  (:action place-consonant-on-consonant
    :parameters (?b - consonant ?t - consonant)
    :precondition (and (holding-consonant ?b) (clear ?t) (not (= ?b ?t)))
    :effect (and
      (on ?b ?t)
      (not (clear ?t))
      (clear ?b)
      (not (holding-consonant ?b))
      (handempty-consonant)
    )
  )
)