(define (domain BlocksworldScaling118)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    support
    table - support
    block - support
    vowel - block
    consonant - block
  )

  (:predicates
    (on ?b - block ?s - support)            ; b is immediately on support s (a block or the table)
    (clear ?b - block)                      ; b has nothing on top
    (holding-vowel ?b - vowel)              ; vowel agent holds this vowel block
    (holding-consonant ?b - consonant)      ; consonant agent holds this consonant block
    (handempty-vowel)                       ; vowel agent hand empty
    (handempty-consonant)                   ; consonant agent hand empty
  )

  ;; Vowel agent actions
  (:action pick-vowel-from-block
    :parameters (?b - vowel ?s - block)
    :precondition (and (on ?b ?s) (clear ?b) (handempty-vowel))
    :effect (and
      (holding-vowel ?b)
      (not (handempty-vowel))
      (not (on ?b ?s))
      (clear ?s)
      (not (clear ?b))
    )
  )

  (:action pick-vowel-from-table
    :parameters (?b - vowel)
    :precondition (and (on ?b table) (clear ?b) (handempty-vowel))
    :effect (and
      (holding-vowel ?b)
      (not (handempty-vowel))
      (not (on ?b table))
      (not (clear ?b))
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
      (clear ?s)
      (not (clear ?b))
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

  (:action place-consonant-on-block
    :parameters (?b - consonant ?t - block)
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