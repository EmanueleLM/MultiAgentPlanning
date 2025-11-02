(define (domain pddl_orchestrator)
  (:requirements :strips :typing)
  (:types block stack - place)

  (:predicates
    (on ?b - block ?p - place)        ; block ?b is directly on place ?p (block or stack)
    (clear ?p - place)               ; nothing is on top of ?p (block or stack)
    (located ?b - block ?s - stack)  ; block ?b currently belongs to stack ?s
    (vowel ?b - block)
    (consonant ?b - block)
    (v-handempty)                    ; vowel agent's hand is empty
    (c-handempty)                    ; consonant agent's hand is empty
    (v-holding ?b - block)
    (c-holding ?b - block)
  )

  ;; Vowel agent: pick a top (vowel) block from a stack
  (:action vowel_pick_top
    :parameters (?b - block ?s - stack ?p - place)
    :precondition (and
      (vowel ?b)
      (v-handempty)
      (clear ?b)
      (located ?b ?s)
      (on ?b ?p)
    )
    :effect (and
      (not (v-handempty))
      (v-holding ?b)
      (clear ?p)
      (not (on ?b ?p))
      (not (located ?b ?s))
    )
  )

  ;; Vowel agent: place held vowel block onto an empty stack (place object of type stack)
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

  ;; Vowel agent: place held vowel block onto a clear block (target block must belong to a stack ?s)
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

  ;; Consonant agent: pick a top (consonant) block from a stack
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

  ;; Consonant agent: place held consonant onto an empty stack
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

  ;; Consonant agent: place held consonant onto a clear block (target block must belong to a stack ?s)
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