(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)        ; block on block
    (ontable ?x - block)              ; block directly on the table
    (clear ?x - block)                ; nothing on top of block
    (v-holding ?x - block)            ; vowel-agent holding block
    (c-holding ?x - block)            ; consonant-agent holding block
    (v-handempty)                     ; vowel-agent hand empty
    (c-handempty)                     ; consonant-agent hand empty
    (is-vowel ?x - block)
    (is-consonant ?x - block)
  )

  ; -------------------------
  ; VOWEL-AGENT ACTIONS (can only manipulate A E I O U)
  ; -------------------------
  (:action vowel-pickup-from
    :parameters (?x - block ?s - block)
    :precondition (and
      (is-vowel ?x)
      (on ?x ?s)
      (clear ?x)
      (v-handempty)
    )
    :effect (and
      (v-holding ?x)
      (not (on ?x ?s))
      (not (v-handempty))
      (clear ?s)
      (not (clear ?x))
    )
  )

  (:action vowel-pickup-from-table
    :parameters (?x - block)
    :precondition (and
      (is-vowel ?x)
      (ontable ?x)
      (clear ?x)
      (v-handempty)
    )
    :effect (and
      (v-holding ?x)
      (not (ontable ?x))
      (not (v-handempty))
      (not (clear ?x))
    )
  )

  (:action vowel-put-on
    :parameters (?x - block ?y - block)
    :precondition (and
      (is-vowel ?x)
      (v-holding ?x)
      (clear ?y)
    )
    :effect (and
      (on ?x ?y)
      (not (clear ?y))
      (not (v-holding ?x))
      (v-handempty)
      (clear ?x)
    )
  )

  (:action vowel-put-on-table
    :parameters (?x - block)
    :precondition (and
      (is-vowel ?x)
      (v-holding ?x)
    )
    :effect (and
      (ontable ?x)
      (not (v-holding ?x))
      (v-handempty)
      (clear ?x)
    )
  )

  ; -------------------------
  ; CONSONANT-AGENT ACTIONS (can only manipulate consonants)
  ; -------------------------
  (:action consonant-pickup-from
    :parameters (?x - block ?s - block)
    :precondition (and
      (is-consonant ?x)
      (on ?x ?s)
      (clear ?x)
      (c-handempty)
    )
    :effect (and
      (c-holding ?x)
      (not (on ?x ?s))
      (not (c-handempty))
      (clear ?s)
      (not (clear ?x))
    )
  )

  (:action consonant-pickup-from-table
    :parameters (?x - block)
    :precondition (and
      (is-consonant ?x)
      (ontable ?x)
      (clear ?x)
      (c-handempty)
    )
    :effect (and
      (c-holding ?x)
      (not (ontable ?x))
      (not (c-handempty))
      (not (clear ?x))
    )
  )

  (:action consonant-put-on
    :parameters (?x - block ?y - block)
    :precondition (and
      (is-consonant ?x)
      (c-holding ?x)
      (clear ?y)
    )
    :effect (and
      (on ?x ?y)
      (not (clear ?y))
      (not (c-holding ?x))
      (c-handempty)
      (clear ?x)
    )
  )

  (:action consonant-put-on-table
    :parameters (?x - block)
    :precondition (and
      (is-consonant ?x)
      (c-holding ?x)
    )
    :effect (and
      (ontable ?x)
      (not (c-holding ?x))
      (c-handempty)
      (clear ?x)
    )
  )

)