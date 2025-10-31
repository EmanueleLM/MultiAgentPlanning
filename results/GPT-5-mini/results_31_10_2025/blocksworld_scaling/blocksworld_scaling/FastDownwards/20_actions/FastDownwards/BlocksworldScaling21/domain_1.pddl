(define (domain Blocksworld-MultiAgent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stack place - object)

  (:predicates
    ; a block is directly on a place (either a block or a stack)
    (on ?b - block ?p - place)
    ; nothing is on top of this place (a block or an empty stack)
    (clear ?p - place)
    ; block belongs to a particular stack (table location)
    (located ?b - block ?s - stack)
    ; agent type predicates
    (vowel ?b - block)
    (consonant ?b - block)
    ; hand / holding for each agent
    (v-handempty)
    (c-handempty)
    (v-holding ?b - block)
    (c-holding ?b - block)
  )

  ;; Vowel agent: pick a top vowel block from a stack (the block must be clear)
  (:action vowel_pick_top
    :parameters (?b - block ?s - stack ?p - place)
    :precondition (and
      (vowel ?b)
      (v-handempty)
      (clear ?b)            ; nothing on top of the block => it's a top block
      (located ?b ?s)
      (on ?b ?p)
    )
    :effect (and
      (not (v-handempty))
      (v-holding ?b)
      (clear ?p)            ; the place that previously supported ?b becomes clear
      (not (on ?b ?p))
      (not (located ?b ?s))
    )
  )

  ;; Vowel agent: place held vowel block onto an empty stack (place is a stack)
  (:action vowel_place_on_stack
    :parameters (?b - block ?s - stack)
    :precondition (and
      (v-holding ?b)
      (clear ?s)
    )
    :effect (and
      (not (v-holding ?b))
      (v-handempty)
      (on ?b ?s)
      (not (clear ?s))
      (clear ?b)
      (located ?b ?s)
    )
  )

  ;; Vowel agent: place held vowel block onto a clear block (target block must be clear and belong to some stack)
  (:action vowel_place_on_block
    :parameters (?b - block ?t - block ?s - stack)
    :precondition (and
      (v-holding ?b)
      (clear ?t)
      (located ?t ?s)
    )
    :effect (and
      (not (v-holding ?b))
      (v-handempty)
      (on ?b ?t)
      (not (clear ?t))
      (clear ?b)
      (located ?b ?s)
    )
  )

  ;; Consonant agent: pick a top consonant block from a stack
  (:action consonant_pick_top
    :parameters (?b - block ?s - stack ?p - place)
    :precondition (and
      (consonant ?b)
      (c-handempty)
      (clear ?b)
      (located ?b ?s)
      (on ?b ?p)
    )
    :effect (and
      (not (c-handempty))
      (c-holding ?b)
      (clear ?p)
      (not (on ?b ?p))
      (not (located ?b ?s))
    )
  )

  ;; Consonant agent: place held consonant block onto an empty stack
  (:action consonant_place_on_stack
    :parameters (?b - block ?s - stack)
    :precondition (and
      (c-holding ?b)
      (clear ?s)
    )
    :effect (and
      (not (c-holding ?b))
      (c-handempty)
      (on ?b ?s)
      (not (clear ?s))
      (clear ?b)
      (located ?b ?s)
    )
  )

  ;; Consonant agent: place held consonant block onto a clear block (target block must be clear and belong to some stack)
  (:action consonant_place_on_block
    :parameters (?b - block ?t - block ?s - stack)
    :precondition (and
      (c-holding ?b)
      (clear ?t)
      (located ?t ?s)
    )
    :effect (and
      (not (c-holding ?b))
      (c-handempty)
      (on ?b ?t)
      (not (clear ?t))
      (clear ?b)
      (located ?b ?s)
    )
  )
)