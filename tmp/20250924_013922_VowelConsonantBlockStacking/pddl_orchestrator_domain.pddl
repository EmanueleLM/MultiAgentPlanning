(define (domain multiagent-blocks)
  (:requirements :typing :negative-preconditions)
  (:types block slot)

  (:predicates
    (vowel ?b - block)
    (consonant ?b - block)
    ;; on relation for a block directly on another block
    (on ?b - block ?under - block)
    ;; a block is the bottom of a stack on the table
    (table-bottom ?b - block)
    ;; association between a bottom block and the table-slot it occupies
    (bottom-slot ?b - block ?s - slot)
    ;; a table slot is free (true iff slot not currently used by any bottom)
    (slot-free ?s - slot)
    ;; a block has no block on top of it (i.e., is the top of its stack)
    (clear ?b - block)

    ;; agent V (vowel-only) hand/holding
    (handempty-v)
    (holding-v ?b - block)

    ;; agent C (consonant-only) hand/holding
    (handempty-c)
    (holding-c ?b - block)
  )

  ;; Agent V actions (vowel-only)
  (:action v-pick-from-block
    :parameters (?b - block ?under - block)
    :precondition (and
                   (vowel ?b)
                   (clear ?b)
                   (handempty-v)
                   (on ?b ?under)
                   (not (table-bottom ?b)))
    :effect (and
             (not (on ?b ?under))
             (not (clear ?b))
             (clear ?under)
             (holding-v ?b)
             (not (handempty-v))
            )
  )

  (:action v-pick-from-table
    :parameters (?b - block ?s - slot)
    :precondition (and
                   (vowel ?b)
                   (clear ?b)
                   (handempty-v)
                   (table-bottom ?b)
                   (bottom-slot ?b ?s))
    :effect (and
             (not (table-bottom ?b))
             (not (bottom-slot ?b ?s))
             (slot-free ?s)
             (not (clear ?b))
             (holding-v ?b)
             (not (handempty-v))
            )
  )

  (:action v-put-on-block
    :parameters (?b - block ?under - block)
    :precondition (and
                   (vowel ?b)
                   (holding-v ?b)
                   (clear ?under)
                   ;; cannot place onto a block currently held by the other agent
                   (not (holding-c ?under)))
    :effect (and
             (on ?b ?under)
             (clear ?b)
             (not (clear ?under))
             (not (holding-v ?b))
             (handempty-v)
            )
  )

  (:action v-put-on-table
    :parameters (?b - block ?s - slot)
    :precondition (and
                   (vowel ?b)
                   (holding-v ?b)
                   (slot-free ?s))
    :effect (and
             (table-bottom ?b)
             (bottom-slot ?b ?s)
             (not (slot-free ?s))
             (clear ?b)
             (not (holding-v ?b))
             (handempty-v)
            )
  )

  ;; Agent C actions (consonant-only)
  (:action c-pick-from-block
    :parameters (?b - block ?under - block)
    :precondition (and
                   (consonant ?b)
                   (clear ?b)
                   (handempty-c)
                   (on ?b ?under)
                   (not (table-bottom ?b)))
    :effect (and
             (not (on ?b ?under))
             (not (clear ?b))
             (clear ?under)
             (holding-c ?b)
             (not (handempty-c))
            )
  )

  (:action c-pick-from-table
    :parameters (?b - block ?s - slot)
    :precondition (and
                   (consonant ?b)
                   (clear ?b)
                   (handempty-c)
                   (table-bottom ?b)
                   (bottom-slot ?b ?s))
    :effect (and
             (not (table-bottom ?b))
             (not (bottom-slot ?b ?s))
             (slot-free ?s)
             (not (clear ?b))
             (holding-c ?b)
             (not (handempty-c))
            )
  )

  (:action c-put-on-block
    :parameters (?b - block ?under - block)
    :precondition (and
                   (consonant ?b)
                   (holding-c ?b)
                   (clear ?under)
                   ;; cannot place onto a block currently held by the other agent
                   (not (holding-v ?under)))
    :effect (and
             (on ?b ?under)
             (clear ?b)
             (not (clear ?under))
             (not (holding-c ?b))
             (handempty-c)
            )
  )

  (:action c-put-on-table
    :parameters (?b - block ?s - slot)
    :precondition (and
                   (consonant ?b)
                   (holding-c ?b)
                   (slot-free ?s))
    :effect (and
             (table-bottom ?b)
             (bottom-slot ?b ?s)
             (not (slot-free ?s))
             (clear ?b)
             (not (holding-c ?b))
             (handempty-c)
            )
  )
)