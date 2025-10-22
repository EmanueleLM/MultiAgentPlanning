(define (domain multiagent-blocks)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (vowel ?b - block)
    (consonant ?b - block)
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (v-holding ?b - block)
    (c-holding ?b - block)
    (v-handempty)
    (c-handempty)
  )

  ;; Vowel-agent actions (may only move vowels)
  (:action vowel-pick-from-table
    :parameters (?b - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (v-handempty))
    :effect (and
      (v-holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (v-handempty))
    )
  )

  (:action vowel-pick-from-block
    :parameters (?b - block ?s - block)
    :precondition (and (vowel ?b) (on ?b ?s) (clear ?b) (v-handempty))
    :effect (and
      (v-holding ?b)
      (clear ?s)
      (not (on ?b ?s))
      (not (clear ?b))
      (not (v-handempty))
    )
  )

  (:action vowel-put-on-table
    :parameters (?b - block)
    :precondition (and (v-holding ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (v-handempty)
      (not (v-holding ?b))
    )
  )

  (:action vowel-stack-on
    :parameters (?b - block ?s - block)
    :precondition (and (v-holding ?b) (clear ?s))
    :effect (and
      (on ?b ?s)
      (clear ?b)
      (not (clear ?s))
      (v-handempty)
      (not (v-holding ?b))
    )
  )

  ;; Consonant-agent actions (may only move consonants)
  (:action consonant-pick-from-table
    :parameters (?b - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (c-handempty))
    :effect (and
      (c-holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (c-handempty))
    )
  )

  (:action consonant-pick-from-block
    :parameters (?b - block ?s - block)
    :precondition (and (consonant ?b) (on ?b ?s) (clear ?b) (c-handempty))
    :effect (and
      (c-holding ?b)
      (clear ?s)
      (not (on ?b ?s))
      (not (clear ?b))
      (not (c-handempty))
    )
  )

  (:action consonant-put-on-table
    :parameters (?b - block)
    :precondition (and (c-holding ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (c-handempty)
      (not (c-holding ?b))
    )
  )

  (:action consonant-stack-on
    :parameters (?b - block ?s - block)
    :precondition (and (c-holding ?b) (clear ?s))
    :effect (and
      (on ?b ?s)
      (clear ?b)
      (not (clear ?s))
      (c-handempty)
      (not (c-holding ?b))
    )
  )
)