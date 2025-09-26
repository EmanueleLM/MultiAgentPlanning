(define (domain multiagent-blocks)
  (:requirements :strips :negative-preconditions :conditional-effects)
  (:predicates
    ; block classification
    (vowel ?b)
    (consonant ?b)

    ; stack slot usage
    (used ?s)            ; slot ?s currently hosts a stack
    (available ?s)       ; slot ?s available for creating a new stack
    (base ?s ?b)         ; block ?b is the base of stack in slot ?s
    (top ?s ?b)          ; block ?b is currently the top block in slot ?s

    ; relation (on b u) means block b is directly on u (u is a block or the table object)
    (on ?b ?under)
    (table ?t)           ; marks the single table object

    ; clear means no block on top of that block
    (clear ?b)

    ; holding state per agent
    (freeV)              ; V agent free to pick up (holds nothing)
    (freeC)              ; C agent free to pick up (holds nothing)
    (holdingV ?b)
    (holdingC ?b)
  )

  ; V agent (vowel mover) actions
  (:action v-pickup
    :parameters (?b ?s ?under)
    :precondition (and
      (vowel ?b)
      (used ?s)
      (top ?s ?b)
      (freeV)
      (on ?b ?under)
    )
    :effect (and
      (not (top ?s ?b))
      (not (on ?b ?under))
      (not (clear ?b))
      (holdingV ?b)
      (not (freeV))
      ; If the block was on the table, the slot becomes available and base removed
      (when (table ?under)
        (and
          (not (used ?s))
          (available ?s)
          (not (base ?s ?b))
        )
      )
      ; If the block had another block under it, that underlying block becomes the new top and becomes clear
      (when (and (on ?b ?under) (not (table ?under)))
        (and
          (top ?s ?under)
          (clear ?under)
        )
      )
    )
  )

  (:action v-place-on-block
    :parameters (?b ?target ?s)
    :precondition (and
      (vowel ?b)
      (holdingV ?b)
      (used ?s)
      (top ?s ?target)
      (not (holdingC ?target)) ; mutual placement constraint: cannot place onto block held by other agent
    )
    :effect (and
      (on ?b ?target)
      (top ?s ?b)
      (clear ?b)
      (not (top ?s ?target))
      (not (clear ?target))
      (not (holdingV ?b))
      (freeV)
    )
  )

  (:action v-place-on-table
    :parameters (?b ?s)
    :precondition (and
      (vowel ?b)
      (holdingV ?b)
      (available ?s)
    )
    :effect (and
      (not (holdingV ?b))
      (freeV)
      (used ?s)
      (not (available ?s))
      (base ?s ?b)
      (top ?s ?b)
      (on ?b table)
      (clear ?b)
    )
  )

  ; C agent (consonant mover) actions
  (:action c-pickup
    :parameters (?b ?s ?under)
    :precondition (and
      (consonant ?b)
      (used ?s)
      (top ?s ?b)
      (freeC)
      (on ?b ?under)
    )
    :effect (and
      (not (top ?s ?b))
      (not (on ?b ?under))
      (not (clear ?b))
      (holdingC ?b)
      (not (freeC))
      ; If the block was on the table, the slot becomes available and base removed
      (when (table ?under)
        (and
          (not (used ?s))
          (available ?s)
          (not (base ?s ?b))
        )
      )
      ; If the block had another block under it, that underlying block becomes the new top and becomes clear
      (when (and (on ?b ?under) (not (table ?under)))
        (and
          (top ?s ?under)
          (clear ?under)
        )
      )
    )
  )

  (:action c-place-on-block
    :parameters (?b ?target ?s)
    :precondition (and
      (consonant ?b)
      (holdingC ?b)
      (used ?s)
      (top ?s ?target)
      (not (holdingV ?target)) ; mutual placement constraint
    )
    :effect (and
      (on ?b ?target)
      (top ?s ?b)
      (clear ?b)
      (not (top ?s ?target))
      (not (clear ?target))
      (not (holdingC ?b))
      (freeC)
    )
  )

  (:action c-place-on-table
    :parameters (?b ?s)
    :precondition (and
      (consonant ?b)
      (holdingC ?b)
      (available ?s)
    )
    :effect (and
      (not (holdingC ?b))
      (freeC)
      (used ?s)
      (not (available ?s))
      (base ?s ?b)
      (top ?s ?b)
      (on ?b table)
      (clear ?b)
    )
  )
)