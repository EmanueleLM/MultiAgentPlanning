(define (domain Blocksworld-MultiAgent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stack)

  (:predicates
    (on-block ?b - block ?under - block)
    (on-stack ?b - block ?s - stack)
    (clear-block ?b - block)
    (clear-stack ?s - stack)
    (vowel ?b - block)
    (consonant ?b - block)
    (v-handempty)
    (c-handempty)
    (v-holding ?b - block)
    (c-holding ?b - block)
  )

  ;; Vowel agent: pick a top vowel block that is directly on a stack
  (:action vowel_pick_from_stack
    :parameters (?b - block ?s - stack)
    :precondition (and
      (vowel ?b)
      (v-handempty)
      (clear-block ?b)
      (on-stack ?b ?s)
    )
    :effect (and
      (not (v-handempty))
      (v-holding ?b)
      (not (on-stack ?b ?s))
      (not (clear-block ?b))
      (clear-stack ?s)
    )
  )

  ;; Vowel agent: pick a top vowel block that is on another block
  (:action vowel_pick_from_block
    :parameters (?b - block ?under - block ?s - stack)
    :precondition (and
      (vowel ?b)
      (v-handempty)
      (clear-block ?b)
      (on-block ?b ?under)
      (on-stack ?under ?s)
    )
    :effect (and
      (not (v-handempty))
      (v-holding ?b)
      (not (on-block ?b ?under))
      (not (on-stack ?b ?s))
      (not (clear-block ?b))
      (clear-block ?under)
    )
  )

  ;; Vowel agent: place held vowel block onto an empty stack
  (:action vowel_place_on_stack
    :parameters (?b - block ?s - stack)
    :precondition (and
      (v-holding ?b)
      (clear-stack ?s)
    )
    :effect (and
      (v-handempty)
      (not (v-holding ?b))
      (on-stack ?b ?s)
      (clear-block ?b)
      (not (clear-stack ?s))
    )
  )

  ;; Vowel agent: place held vowel block onto a clear block
  (:action vowel_place_on_block
    :parameters (?b - block ?t - block ?s - stack)
    :precondition (and
      (v-holding ?b)
      (clear-block ?t)
      (on-stack ?t ?s)
    )
    :effect (and
      (v-handempty)
      (not (v-holding ?b))
      (on-block ?b ?t)
      (clear-block ?b)
      (not (clear-block ?t))
      (on-stack ?b ?s)
    )
  )

  ;; Consonant agent: pick a top consonant block that is directly on a stack
  (:action consonant_pick_from_stack
    :parameters (?b - block ?s - stack)
    :precondition (and
      (consonant ?b)
      (c-handempty)
      (clear-block ?b)
      (on-stack ?b ?s)
    )
    :effect (and
      (not (c-handempty))
      (c-holding ?b)
      (not (on-stack ?b ?s))
      (not (clear-block ?b))
      (clear-stack ?s)
    )
  )

  ;; Consonant agent: pick a top consonant block that is on another block
  (:action consonant_pick_from_block
    :parameters (?b - block ?under - block ?s - stack)
    :precondition (and
      (consonant ?b)
      (c-handempty)
      (clear-block ?b)
      (on-block ?b ?under)
      (on-stack ?under ?s)
    )
    :effect (and
      (not (c-handempty))
      (c-holding ?b)
      (not (on-block ?b ?under))
      (not (on-stack ?b ?s))
      (not (clear-block ?b))
      (clear-block ?under)
    )
  )

  ;; Consonant agent: place held consonant block onto an empty stack
  (:action consonant_place_on_stack
    :parameters (?b - block ?s - stack)
    :precondition (and
      (c-holding ?b)
      (clear-stack ?s)
    )
    :effect (and
      (c-handempty)
      (not (c-holding ?b))
      (on-stack ?b ?s)
      (clear-block ?b)
      (not (clear-stack ?s))
    )
  )

  ;; Consonant agent: place held consonant block onto a clear block
  (:action consonant_place_on_block
    :parameters (?b - block ?t - block ?s - stack)
    :precondition (and
      (c-holding ?b)
      (clear-block ?t)
      (on-stack ?t ?s)
    )
    :effect (and
      (c-handempty)
      (not (c-holding ?b))
      (on-block ?b ?t)
      (clear-block ?b)
      (not (clear-block ?t))
      (on-stack ?b ?s)
    )
  )
)